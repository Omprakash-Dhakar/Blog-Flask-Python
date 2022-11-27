from flask import Flask, render_template, request, session, redirect
from flask_sqlalchemy import SQLAlchemy
from werkzeug.utils import secure_filename
import json
import os
import math
from datetime import datetime

with open('Templates/config.json', 'r') as c:
    params = json.load(c)['params']
local_server = True

app = Flask(__name__)
app.secret_key = "super-secret-key"
app.config["UPLOAD_FOLDER"] = params["upload_location"]

# app.config.update(
#     MAIL_SERVER = 'smtp.gmail.com',
#     MAIL_PORT = '465',
#     MAIL_USE_SSL = True,
#     MAIL_USERNAME = params['gmail-user'],
#     MAIL_PASSWORD = params['gmail-password']
# )
# mail = Mail(app)

if (local_server):
    app.config["SQLALCHEMY_DATABASE_URI"] = params["local_uri"]
else:
    app.config["SQLALCHEMY_DATABASE_URI"] = params["prod_uri"]

db = SQLAlchemy(app)


class Contacts(db.Model):  # type: ignore
    sno = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(80), nullable=False)
    phone_num = db.Column(db.String(12), nullable=False)
    msg = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12))
    email = db.Column(db.String(20), nullable=False)


class Post(db.Model):  # type: ignore
    sno = db.Column(db.Integer, primary_key=True)
    title = db.Column(db.String(20), nullable=False)
    tagline = db.Column(db.String(50), nullable=False)
    slug = db.Column(db.String(25), nullable=False)
    content = db.Column(db.String(120), nullable=False)
    date = db.Column(db.String(12))
    img_file = db.Column(db.String(12))


@app.route("/")
def home():
    post = Post.query.filter_by().all()
    last = math.ceil(len(post)/int(params["no_of_post"]))

    page = request.args.get("page", 1)
    if (not str(page).isnumeric):
        page = 1
    page = int(page)
    posts = post[(page-1)*int(params["no_of_post"]): (page-1) *
                 int(params["no_of_post"])+int(params["no_of_post"])]
    #Pagination Logic
    # First Page
    if (page == 1):
        prev = "#"
        next = "/?page=" + str(page + 1)

    elif (page == last):
        next = "#"
        prev = "/?page=" + str(page - 1)

    else:
        prev = "/?page=" + str(page - 1)
        next = "/?page=" + str(page + 1)

    return render_template("index.html", params=params, posts=posts, prev=prev, next=next)


@app.route("/about")
def about():
    return render_template("about.html", params=params)


@app.route("/dashboard", methods=['GET', 'POST'])  # type: ignore
def dashboard():
    if ('user' in session and session['user'] == params['admin_user']):
        post = Post.query.all()[0:params['no_of_post']]
        return render_template('dashboard.html', params=params, post=post)

    if (request.method == 'POST'):
        username = request.form.get('uname')
        userpass = request.form.get('pass')
        if (username == params['admin_user'] and userpass == params['admin_password']):
            session['user'] = username
            post = Post.query.all()[0:params['no_of_post']]
            return render_template('dashboard.html', params=params, post=post)
        else:
            return redirect("/dashboard")

    else:
        return render_template("signin.html", params=params)


@app.route("/delete/<string:sno>", methods=['GET', 'POST'])  # type: ignore
def delete(sno):
    if ('user' in session and session['user'] == params["admin_user"]):
        post = Post.query.filter_by(sno=sno).first()
        db.session.delete(post)
        db.session.commit()
    return redirect('/dashboard')


@app.route("/edit/<string:sno>", methods=['GET', 'POST'])  # type: ignore
def edit(sno):
    if ('user' in session and session['user'] == params['admin_user']):
        if request.method == 'POST':
            box_title = request.form.get('title')
            tline = request.form.get('tline')
            slug = request.form.get('slug')
            content = request.form.get('content')
            img_file = request.form.get('img_file')

            if sno == "0":
                post = Post(title=box_title, tagline=tline, slug=slug,
                            content=content, img_file=img_file, date=datetime.now())
                db.session.add(post)
                db.session.commit()
            else:
                post = Post.query.filter_by(sno=sno).first()
                post.title = box_title
                post.tagline = tline
                post.slug = slug
                post.content = content
                post.img_file = img_file
                post.date = datetime.now()
                db.session.commit()
                return redirect('/edit/' + sno)
        post = Post.query.filter_by(sno=sno).first()
        return render_template('edit.html', params=params, post=post)


@app.route("/uploader", methods=['GET', 'POST'])  # type: ignore
def uploader():
    if ('user' in session and session['user'] == params['admin_user']):
        if (request.method == "POST"):
            f = request.files['file1']
            # type: ignore
            f.save(os.path.join(app.config['UPLOAD_FOLDER'], secure_filename(f.filename)))  # type: ignore
            return "Uploaded Successfully"


@app.route("/logout")  # type: ignore
def logout():
    session.pop('user')
    return redirect('/dashboard')


@app.route("/contact", methods=['GET', 'POST'])  # type: ignore
def contact():
    if (request.method == "POST"):
        name = request.form.get("name")
        email = request.form.get("email")
        phone = request.form.get("phone")
        message = request.form.get("message")
        entry = Contacts(name=name, phone_num=phone,
                         msg=message, date=datetime.now(), email=email)
        db.session.add(entry)
        db.session.commit()

        # TO send mail from your gmail
        # mail.send_message('New Message from' + name,
        #                     sender=email,
        #                     recipients=[params['gmail-user']],
        #                     body = message + '\n' + phone
        #                  )
    return render_template("contact.html", params=params)


@app.route("/post/<string:post_slug>", methods=['GET'])
def post_route(post_slug):
    post = Post.query.filter_by(slug=post_slug).first()

    return render_template("post.html", params=params, post=post)


app.run(debug=True)

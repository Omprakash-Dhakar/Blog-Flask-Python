-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 27, 2022 at 01:49 PM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `coding_tortoise`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `sno` int(11) NOT NULL,
  `name` text NOT NULL,
  `phone_num` varchar(50) NOT NULL,
  `msg` text NOT NULL,
  `date` datetime DEFAULT current_timestamp(),
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sno`, `name`, `phone_num`, `msg`, `date`, `email`) VALUES
(1, 'first post', '1234567890', 'first post message', '2022-11-21 17:17:47', 'first@gmail.com'),
(2, 'OMPRAKASH DHAKAR', '09982323064', 'successfull', '2022-11-22 19:22:18', 'ompdhakar27@gmail.com'),
(3, 'NEW USER', '1245789630', '', '2022-11-22 23:18:25', 'user@gmail.com'),
(4, 'NEW USER', '1245789630', 'Are you Looking for a job??', '2022-11-22 23:19:36', 'user@gmail.com'),
(5, 'NEW USER', '1245789630', 'Are you Looking for a job??', '2022-11-22 23:20:01', 'user@gmail.com'),
(6, 'NEW USER', '1234567890', 'yehh!', '2022-11-22 23:25:44', 'user@gmail.com'),
(7, 'MySql', '4', '', '2022-11-26 21:33:24', 'mysql@gmail.com'),
(8, 'MySql', '478596321', 'MySql is a RDMS', '2022-11-26 21:34:19', 'mysql@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `sno` int(11) NOT NULL,
  `title` text NOT NULL,
  `tagline` varchar(50) NOT NULL,
  `slug` varchar(25) NOT NULL,
  `content` text NOT NULL,
  `img_file` varchar(21) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`sno`, `title`, `tagline`, `slug`, `content`, `img_file`, `date`) VALUES
(1, 'Let\'s learn about statistics', 'Statistics Blog', 'first-post', 'Statistics (from German: Statistik, orig. \"description of a state, a country\")[1][2] is the discipline that concerns the collection, organization, analysis, interpretation, and presentation of data.[3][4][5] In applying statistics to a scientific, industrial, or social problem, it is conventional to begin with a statistical population or a statistical model to be studied. Populations can be diverse groups of people or objects such as \"all people living in a country\" or \"every atom composing a crystal\". Statistics deals with every aspect of data, including the planning of data collection in terms of the design of surveys and experiments.[6]\n\nWhen census data cannot be collected, statisticians collect data by developing specific experiment designs and survey samples. Representative sampling assures that inferences and conclusions can reasonably extend from the sample to the population as a whole. An experimental study involves taking measurements of the system under study, manipulating the system, and then taking additional measurements using the same procedure to determine if the manipulation has modified the values of the measurements. In contrast, an observational study does not involve experimental manipulation.\n\nTwo main statistical methods are used in data analysis: descriptive statistics, which summarize data from a sample using indexes such as the mean or standard deviation, and inferential statistics, which draw conclusions from data that are subject to random variation (e.g., observational errors, sampling variation).[7] Descriptive statistics are most often concerned with two sets of properties of a distribution (sample or population): central tendency (or location) seeks to characterize the distribution\'s central or typical value, while dispersion (or variability) characterizes the extent to which members of the distribution depart from its center and each other. Inferences on mathematical statistics are made under the framework of probability theory, which deals with the analysis of random phenomena.', 'post-bg.jpg', '2022-11-22 23:34:52'),
(2, 'News', 'Know more about news', 'second-post', 'Again, stay away from political news stories.\r\n\r\nWhat do you think about (current news story)?\r\nDid you hear about (news story)?\r\nHow much do you follow the news?\r\nWhat do you think doesn’t get enough news coverage?\r\nWhat gets too much attention in the news?\r\nHow do you get your news?', 'about-bg.jpg', '2022-11-24 16:14:19'),
(3, 'Sports', 'Read about sports', 'third-post', 'Sport pertains to any form of competitive physical activity or game[1] that aims to use, maintain, or improve physical ability and skills while providing enjoyment to participants and, in some cases, entertainment to spectators.[2] Sports can, through casual or organized participation, improve participants\' physical health. Hundreds of sports exist, from those between single contestants, through to those with hundreds of simultaneous participants, either in teams or competing as individuals. In certain sports such as racing, many contestants may compete, simultaneously or consecutively, with one winner; in others, the contest (a match) is between two sides, each attempting to exceed the other. Some sports allow a \"tie\" or \"draw\", in which there is no single winner; others provide tie-breaking methods to ensure one winner and one loser. A number of contests may be arranged in a tournament producing a champion. Many sports leagues make an annual champion by arranging games in a regular sports season, followed in some cases by playoffs.  Sport is generally recognised as system of activities based in physical athleticism or physical dexterity, with major competitions such as the Olympic Games admitting only sports meeting this definition.[3] Other organisations, such as the Council of Europe, preclude activities without a physical element from classification as sports.[2] However, a number of competitive, but non-physical, activities claim recognition as mind sports. The International Olympic Committee (through ARISF) recognises both chess and bridge as bona fide sports, and SportAccord, the international sports federation association, recognises five non-physical sports: bridge, chess, draughts (checkers), Go and xiangqi,[4][5] and limits the number of mind games which can be admitted as sports.[1]', 'contact-bg.jpg', '2022-11-24 16:14:19'),
(4, 'Music', '', 'next-post', 'Music is generally defined as the art of arranging sound to create some combination of form, harmony, melody, rhythm or otherwise expressive content.[1][2][3] Exact definitions of music vary considerably around the world,[4] though it is an aspect of all human societies, a cultural universal.[5] While scholars agree that music is defined by a few specific elements, there is no consensus on their precise definitions.[6] The creation of music is commonly divided into musical composition, musical improvisation, and musical performance,[7] though the topic itself extends into academic disciplines, criticism, philosophy, and psychology. Music may be performed or improvised using a vast range of instruments, including the human voice.\r\n\r\nIn some musical contexts, a performance or composition may be to some extent improvised. For instance, in Hindustani classical music, the performer plays spontaneously while following a partially defined structure and using characteristic motifs. In modal jazz the performers may take turns leading and responding, while sharing a changing set of notes. In a free jazz context, there may be no structure whatsoever, with each performer acting at their discretion. Music may be deliberately composed to be unperformable, or agglomerated electronically from many performances. Music is played in public and private areas, highlighted at events such as festivals, rock concerts, and orchestra performance, and heard incidentally as part of a score or soundtrack to a film, TV show, opera, or video game. Musical playback is the primary function of an MP3 player or CD player and a universal feature of radios and smartphones.\r\n\r\nMusic often plays a key role in social activities, religious rituals, rite of passage ceremonies, celebrations, and cultural activities. The music industry includes songwriters, performers, sound engineers, producers, tour organizers, distributors of instruments, accessories, and sheet music. Compositions, performances, and recordings are assessed and evaluated by music critics, music journalists, and music scholars, as well as amateurs.\r\n', '', '2022-11-24 16:16:11'),
(5, 'Film', '', 'film-post', 'A film – also called a movie, motion picture, moving picture, picture or photoplay – is a work of visual art that simulates experiences and otherwise communicates ideas, stories, perceptions, feelings, beauty, or atmosphere through the use of moving images. These images are generally accompanied by sound and, more rarely, other sensory stimulations.[1] The word \"cinema\", short for cinematography, is often used to refer to filmmaking and the film industry, and to the art form that is the result of it.', '', '2022-11-24 16:19:02'),
(6, 'Python', '', 'Python-blog', 'Python is a high-level, general-purpose programming language. Its design philosophy emphasizes code readability with the use of significant indentation.[33]\r\n\r\nPython is dynamically-typed and garbage-collected. It supports multiple programming paradigms, including structured (particularly procedural), object-oriented and functional programming. It is often described as a \"batteries included\" language due to its comprehensive standard library.[34][35]\r\n\r\nGuido van Rossum began working on Python in the late 1980s as a successor to the ABC programming language and first released it in 1991 as Python 0.9.0.[36] Python 2.0 was released in 2000 and introduced new features such as list comprehensions, cycle-detecting garbage collection, reference counting, and Unicode support. Python 3.0, released in 2008, was a major revision that is not completely backward-compatible with earlier versions. Python 2 was discontinued with version 2.7.18 in 2020.', '', '2022-11-24 16:19:02'),
(7, 'DATA', '', 'Data-blog', 'In the pursuit of knowledge, data (US: /ˈdætə/; UK: /ˈdeɪtə/) are a collection of discrete values that convey information, describing the quantity, quality, fact, statistics, other basic units of meaning, or simply sequences of symbols that may be further interpreted. A datum is an individual value in a collection of data. Data are usually organized into structures such as tables that provide additional context and meaning, and which may themselves be used as data in larger structures. Data may be used as variables in a computational process.[1][2] Data may represent abstract ideas or concrete measurements.[3] Data are commonly used in scientific research, finance, and virtually every other form of human organizational activity. Examples of data sets include stock prices, crime rates, unemployment rates, literacy rates, and census data. In this context, data represents the raw facts and figures which can be used in such a manner to capture useful information it.\r\n\r\nData are collected using techniques such as measurement, observation, query, or analysis, and are typically represented as numbers or characters which may be further processed. Field data are data that are collected in an uncontrolled in-situ environment. Experimental data are data that are generated in the course of a controlled scientific experiment. Data is analyzed using techniques such as calculation, reasoning, discussion, presentation, visualization, or other forms of post-analysis. Before analysis, raw information (or unprocessed data) is typically cleaned: Outliers are removed and obvious instrument or data entry errors are corrected.\r\n\r\nData are the atoms of decision-making. As such, data can be seen as the smallest units of factual information that can be used as a basis for calculation, reasoning, or discussion. Data can range from abstract ideas to concrete measurements, including but not limited to, statistics. Thematically connected data presented in some relevant context can be viewed as information. Contextually connected information can then be described as data insights or intelligence. The stock of insights and intelligence that accumulates over time resulting from the synthesis of data into information, can then be described as knowledge. Data has been described as \"the new oil of the digital economy\".[4][5] Data, as a general concept, refers to the fact that some existing information or knowledge is represented or coded in some form suitable for better usage or processing.', '', '2022-11-24 16:21:20');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

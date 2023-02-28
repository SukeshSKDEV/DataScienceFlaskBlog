-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 28, 2023 at 07:22 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `data_science`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `sno` int(11) NOT NULL,
  `name` text NOT NULL,
  `phone_num` int(50) NOT NULL,
  `msg` varchar(50) NOT NULL,
  `date` datetime DEFAULT current_timestamp(),
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sno`, `name`, `phone_num`, `msg`, `date`, `email`) VALUES
(1, 'sudhir', 2345678, 'Hey there', '2023-02-25 23:23:48', 'ritesh@gmail.com'),
(3, 'Sukeshsk', 2147483647, 'wqdsa', NULL, 'sukeshskdev@gmail.com'),
(4, 'Sukeshsk', 2147483647, 'wqdsa', '2023-02-26 10:09:46', 'sukeshskdev@gmail.com'),
(5, 'Ritesh', 2147483647, 'dsafsda', '2023-02-26 10:49:05', 'ratrbat@gmail.com'),
(6, 'Ritesh', 2147483647, 'dsafsda', '2023-02-26 10:50:28', 'ratrbat@gmail.com'),
(7, 'Ajay', 2147483647, 'Hey there ajay is here.', '2023-02-26 10:51:28', 'ajay@gmail.com'),
(8, 'Sukeshsk', 2147483647, 'dasfasdf', '2023-02-26 12:21:25', 'sukeshskdev@gmail.com'),
(9, 'Sukeshsk', 2147483647, 'dfsgbsfd', '2023-02-26 12:35:24', 'sukeshskdev@gmail.com'),
(10, 'Sukeshsk', 2147483647, 'fdasf', '2023-02-26 12:41:10', 'sukeshskdev@gmail.com'),
(11, 'Sukeshsk', 2147483647, 'fdsaf', '2023-02-26 12:42:34', 'sukeshskdev@gmail.com'),
(12, 'Sukeshsk', 2147483647, 'sdafdsa', '2023-02-26 12:43:12', 'sukeshskdev@gmail.com'),
(13, 'Sukeshsk', 2147483647, 'sadas', '2023-02-26 12:44:31', 'sukeshskdev@gmail.com'),
(14, 'Sukeshsk', 2147483647, 'dasfsda', '2023-02-26 12:46:19', 'sukeshskdev@gmail.com'),
(15, 'Ajay', 2147483647, 'dasfdas', '2023-02-26 12:47:30', 'sukeshskdev@gmail.com'),
(16, 'Vinay Pathak', 2147483647, 'sukesh', '2023-02-26 12:50:17', 'vinaypathak@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(11) NOT NULL,
  `title` text NOT NULL,
  `content` text NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `slug` varchar(25) NOT NULL,
  `img_file` varchar(12) NOT NULL,
  `tagline` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `title`, `content`, `date`, `slug`, `img_file`, `tagline`) VALUES
(1, 'What is Machine learning and Deep Learning ?', 'Machine learning (ML) is a field of inquiry devoted to understanding and building methods that \"learn\" – that is, methods that leverage data to improve performance on some set of tasks. It is seen as a part of artificial intelligence.\r\n\r\nMachine learning algorithms build a model based on sample data, known as training data, in order to make predictions or decisions without being explicitly programmed to do so.[2] Machine learning algorithms are used in a wide variety of applications, such as in medicine, email filtering, speech recognition, agriculture, and computer vision, where it is difficult or unfeasible to develop conventional algorithms to perform the needed tasks.', '2023-02-28 22:08:45', 'slug_post', 'about.jpg', 'Machine learning is fun and easy.'),
(2, 'Let\'s learn Python for Data Science', 'Python is a high-level, general-purpose programming language. Its design philosophy emphasizes code readability with the use of significant indentation.\r\nPython is dynamically typed and garbage-collected. It supports multiple programming paradigms, including structured (particularly procedural), object-oriented and functional programming. It is often described as a \"batteries included\" language due to its comprehensive standard library.', '2023-02-26 19:13:09', 'python_post', 'about-bg.jpg', 'Python: There should be one and preferably only one, obvious way to do it.'),
(3, 'Do you know what is PyTorch ?', 'PyTorch is a machine learning framework based on the Torch library,used for applications such as computer vision and natural language processing,originally developed by Meta AI and now part of the Linux Foundation umbrella.It is free and open-source software released under the modified BSD license. Although the Python interface is more polished and the primary focus of development, PyTorch also has a C++ interface.', '2023-02-26 19:15:11', 'pytorch_post', 'post-bg.jpg', 'PyTorch: There should be one and preferably only one, obvious way to do it.'),
(4, 'Git : a version control system', 'GitHub, Inc. is an Internet hosting service for software development and version control using Git. It provides the distributed version control of Git plus access control, bug tracking, software feature requests, task management, continuous integration, and wikis for every project. Headquartered in California, it has been a subsidiary of Microsoft since 2018.\r\nIt is commonly used to host open source software development projects. As of January 2023, GitHub reported having over 100 million developers and more than 372 million repositories,[9] including at least 28 million public repositories. It is the largest source code host as of November 2021.', '2023-02-26 19:17:17', 'git_post', 'about-bg.jpg', 'A community connected by Code'),
(5, 'Why ChatGPT is gaining popularity ?', 'ChatGPT is an artificial-intelligence chatbot developed by OpenAI and launched in November 2022. It is built on top of OpenAI\'s GPT-3 family of large language models and has been fine-tuned (an approach to transfer learning) using both supervised and reinforcement learning techniques. ChatGPT was launched as a prototype on November 30, 2022, and quickly garnered attention for its detailed responses and articulate answers across many domains of knowledge. Its uneven factual accuracy, however, has been identified as a significant drawback. Following the release of ChatGPT, OpenAI\'s valuation was estimated at US$29 billion in 2023.', '2023-02-26 19:18:48', 'chatgpt-post', 'post-bg.jpg', '“ChatGPT is scary good. We are not far from dangerously strong AI.” ~Elon Musk'),
(7, 'DALL-E', 'DALL-E and DALL-E 2 are deep learning models developed by OpenAI to generate digital images from natural language descriptions, called \"prompts\". DALL-E was revealed by OpenAI in a blog post in January 2021, and uses a version of GPT-3 modified to generate images.', '2023-02-28 22:14:12', 'dalle_post', 'about-bg.jpg', 'Salvador Dali and the robot WALL-E from Pixar'),
(8, 'Exploratory data analysis', 'In statistics, exploratory data analysis is an approach of analyzing data sets to summarize their main characteristics, often using statistical graphics and other data visualization methods. ', '2023-02-28 22:47:25', 'eda_post', 'post-bg.jpg', 'A new baby is like the beginning of all things - wonder, hope, a dream of possibilities.'),
(9, 'Natural language processing', 'Natural language processing (NLP) refers to the branch of computer science—and more specifically, the branch of artificial intelligence or AI—concerned with giving computers the ability to understand text and spoken words in much the same way human beings can.', '2023-02-28 22:54:42', 'nlp_post', 'about-bg.jpg', '\"All that we are is the result of what we have thought. \r\nThe mind is everything. What we think we become.\"\r\n ~ The Buddha'),
(10, 'Sophia', 'Sophia is a social humanoid robot developed by the Hong Kong-based company Hanson Robotics. Sophia was activated on February 14, 2016, and made its first public appearance in mid-March 2016 at South by Southwest in Austin, Texas, United States. ', '2023-02-28 23:33:24', 'sophia_post', 'about-bg.jpg', 'Sophia\'s Artificial Intelligence');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

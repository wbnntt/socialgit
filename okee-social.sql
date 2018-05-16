-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 16, 2018 at 04:51 PM
-- Server version: 5.7.14
-- PHP Version: 7.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `okee-social`
--

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

CREATE TABLE `comments` (
  `id` int(11) NOT NULL,
  `post_body` text NOT NULL,
  `posted_by` varchar(60) NOT NULL,
  `posted_to` varchar(60) NOT NULL,
  `date_added` datetime NOT NULL,
  `removed` varchar(3) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `comments`
--

INSERT INTO `comments` (`id`, `post_body`, `posted_by`, `posted_to`, `date_added`, `removed`, `post_id`) VALUES
(1, 'kkk', 'black_blackster', 'blue_bell', '2017-11-15 19:22:12', 'no', 306),
(2, 'oooo', 'black_blackster', 'blue_bell', '2017-11-15 19:27:50', 'no', 306),
(3, 'lll', 'black_blackster', 'blue_bell', '2017-11-15 20:44:47', 'no', 306),
(4, 'comment', 'black_blackster', 'blue_bell', '2017-11-16 17:00:36', 'no', 305),
(5, '', 'black_blackster', 'blue_bell', '2017-11-16 17:00:39', 'no', 305),
(6, '4th', 'black_blackster', 'blue_bell', '2017-11-16 17:00:51', 'no', 306),
(7, 'another', 'will_bennett', 'blue_bell', '2017-11-16 17:49:29', 'no', 305),
(8, 'first', 'will_bennett', 'blue_bell', '2017-11-16 17:49:56', 'no', 304),
(9, '', 'will_bennett', 'black_blackster', '2017-11-16 17:52:07', 'no', 297),
(10, 'commnt', 'will_bennett', 'black_blackster', '2017-11-20 14:07:43', 'no', 297),
(11, 'kkllllll', 'will_bennett', 'black_blackster', '2017-11-20 14:07:52', 'no', 297),
(12, '', 'will_bennett', 'black_blackster', '2017-11-20 14:07:54', 'no', 297),
(13, 'llll', 'will_bennett', 'black_blackster', '2017-11-20 14:07:56', 'no', 297),
(14, 'llll', 'will_bennett', 'black_blackster', '2017-11-20 14:08:01', 'no', 297),
(15, '', 'will_bennett', 'black_blackster', '2017-11-20 14:08:09', 'no', 297),
(16, '', 'will_bennett', 'black_blackster', '2017-11-20 14:08:09', 'no', 297),
(17, 'mmm', 'will_bennett', 'black_blackster', '2017-11-20 14:08:23', 'no', 297),
(18, 'cvvdff', 'will_bennett', 'ben_jones', '2017-11-30 17:39:03', 'no', 311),
(19, 'its a comment', 'will_bennett', 'ben_jones', '2017-12-18 18:24:49', 'no', 313),
(20, 'hold on', 'will_bennett', 'blue_bell', '2017-12-18 18:51:33', 'no', 319),
(21, '', 'will_bennett', 'blue_bell', '2017-12-18 18:52:32', 'no', 319),
(22, '', 'will_bennett', 'blue_bell', '2017-12-18 18:57:05', 'no', 319),
(23, '', 'will_bennett', 'blue_bell', '2017-12-18 18:57:06', 'no', 319),
(24, 'yyyy', 'will_bennett', 'blue_bell', '2017-12-19 13:00:42', 'no', 319),
(25, 'coooooo', 'will_bennett', 'will_bennett', '2017-12-19 14:02:48', 'no', 322),
(26, 'pppp', 'bark_dog', 'bark_dog', '2017-12-21 16:49:51', 'no', 343),
(27, 'jjjj', 'bark_dog', 'billy_goat', '2017-12-21 16:50:01', 'no', 342),
(28, 'bbbb', 'will_bennett', 'will_bennett', '2018-01-05 10:56:24', 'no', 347),
(29, 'jjjjj', 'will_bennett', 'will_bennett', '2018-01-05 10:56:32', 'no', 347),
(30, 'mmmm', 'billy_goat', 'billy_goat', '2018-01-05 13:46:48', 'no', 351),
(31, 'dfsdf', 'billy_goat', 'greg_goo', '2018-01-06 01:03:00', 'no', 372),
(32, 'llloollll', 'billy_goat', 'greg_goo', '2018-01-06 01:11:10', 'no', 372),
(33, 'jjj', 'billy_goat', 'billy_goat', '2018-01-08 17:30:33', 'no', 377),
(34, 'ko', 'billy_goat', 'greg_goo', '2018-01-08 17:30:43', 'no', 375),
(35, 'kkkk', 'billy_goat', 'will_bennett', '2018-01-09 16:51:06', 'no', 380),
(36, 'hhh', 'crank_call', 'billy_goat', '2018-01-10 15:03:15', 'no', 386),
(37, 'my comment', 'crank_call', 'will_bennett', '2018-01-15 14:34:11', 'no', 389);

-- --------------------------------------------------------

--
-- Table structure for table `friend_requests`
--

CREATE TABLE `friend_requests` (
  `id` int(11) NOT NULL,
  `user_to` varchar(50) NOT NULL,
  `user_from` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` int(11) NOT NULL,
  `username` varchar(60) NOT NULL,
  `post_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `id` int(11) NOT NULL,
  `user_to` varchar(50) NOT NULL,
  `user_from` varchar(50) NOT NULL,
  `body` text NOT NULL,
  `date` datetime NOT NULL,
  `opened` varchar(3) NOT NULL,
  `viewed` varchar(3) NOT NULL,
  `deleted` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `user_to` varchar(50) NOT NULL,
  `user_from` varchar(50) NOT NULL,
  `message` text NOT NULL,
  `link` varchar(100) NOT NULL,
  `datetime` datetime NOT NULL,
  `opened` varchar(3) NOT NULL,
  `viewed` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `body` text NOT NULL,
  `added_by` varchar(60) NOT NULL,
  `user_to` varchar(60) NOT NULL,
  `date_added` datetime NOT NULL,
  `user_closed` varchar(3) NOT NULL,
  `deleted` varchar(3) NOT NULL,
  `likes` int(11) NOT NULL,
  `image` varchar(500) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `body`, `added_by`, `user_to`, `date_added`, `user_closed`, `deleted`, `likes`, `image`) VALUES
(408, 'Carbureter', 'will_bennett', 'none', '2018-02-06 21:54:38', 'no', 'no', 0, 'assets/images/posts/5a7a241e8651320170502_152421.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `trends`
--

CREATE TABLE `trends` (
  `title` varchar(50) NOT NULL,
  `hits` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `trends`
--

INSERT INTO `trends` (`title`, `hits`) VALUES
('1', 1),
('1010', 1),
('1112', 1),
('1113', 1),
('1114', 9),
('2', 1),
('3', 1),
('Bbbb', 1),
('Ben', 1),
('Black', 1),
('Blue', 4),
('Carbureter', 1),
('Cccc', 1),
('Crank', 1),
('Deleted', 1),
('Dog', 1),
('Eventwebapp', 1),
('Ff', 1),
('Ffef', 1),
('Ffffff', 13),
('Goat', 1),
('Gogogo', 1),
('Hhbn', 1),
('Jon', 1),
('Kjnbvcxaqwedxcvghn', 2),
('Kk', 1),
('Kkmmk', 1),
('L', 2),
('Landscape', 1),
('Ll', 2),
('Llllll', 1),
('Loppy', 1),
('Main', 1),
('Mm', 1),
('Mmm', 1),
('Mmmm', 4),
('Mmnnn', 1),
('Mnmmbvuiio', 3),
('Ned', 1),
('Nn', 1),
('Nnn', 6),
('Ok', 4),
('Oo', 5),
('Op', 5),
('P1', 1),
('P2', 1),
('P3', 1),
('P4', 1),
('P5', 1),
('P6', 1),
('P7', 1),
('Page', 1),
('Photo', 2),
('Poas', 1),
('Podddddd', 1),
('Poiuyt', 1),
('Poppp', 2),
('Post', 10),
('Post1', 1),
('Post2', 1),
('Postingbr', 1),
('Pppp', 1),
('Qwaszx', 1),
('Red', 3),
('Resdter', 1),
('Secons', 7),
('Soccer', 1),
('Test', 5),
('Ttt', 24),
('Tuesday', 2),
('User', 1),
('Wb', 2),
('Wednesday', 1),
('Wertfds909', 14),
('Ww', 2);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `first_name` varchar(25) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `signup_date` date NOT NULL,
  `profile_pic` varchar(255) NOT NULL,
  `num_posts` int(11) NOT NULL,
  `num_likes` int(11) NOT NULL,
  `user_closed` varchar(3) NOT NULL,
  `friend_array` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `first_name`, `last_name`, `username`, `email`, `password`, `signup_date`, `profile_pic`, `num_posts`, `num_likes`, `user_closed`, `friend_array`) VALUES
(15, 'William', 'Bennett', 'will_bennett', 'wbnntt@gmail.com', '376c43878878ac04e05946ec1dd7a55f', '2017-09-13', 'assets/images/profile_pics/will_bennett57a8302aa98ebfcc0f9121f41f4961f2n.jpeg', 82, 4, 'no', ',');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `friend_requests`
--
ALTER TABLE `friend_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `trends`
--
ALTER TABLE `trends`
  ADD PRIMARY KEY (`title`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comments`
--
ALTER TABLE `comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
--
-- AUTO_INCREMENT for table `friend_requests`
--
ALTER TABLE `friend_requests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `messages`
--
ALTER TABLE `messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=409;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

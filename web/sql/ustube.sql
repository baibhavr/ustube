-- phpMyAdmin SQL Dump
-- version 3.5.0
-- http://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: May 12, 2012 at 12:26 AM
-- Server version: 5.5.22-0ubuntu1
-- PHP Version: 5.3.10-1ubuntu3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Database: `ustube`
--
CREATE DATABASE `ustube` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `ustube`;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(225) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `title`) VALUES
(4, 'Audio'),
(3, 'Video'),
(5, 'Movies'),
(6, 'Drama');

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE IF NOT EXISTS `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `media_id` int(11) DEFAULT NULL,
  `comment` varchar(256) DEFAULT NULL,
  `comment_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comment_user1` (`user_id`),
  KEY `fk_comment_media1` (`media_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `user_id`, `media_id`, `comment`, `comment_date`) VALUES
(5, 10025, 93, 'fdafdasfdasf', '2012-05-08 04:34:29'),
(6, 10025, 93, 'ewqrewqrewqre', '2012-05-08 04:34:40'),
(7, 10026, 96, 'what do you guys think about this song?', '2012-05-08 07:09:45'),
(8, 10026, 96, 'Give it some like if you like it :)', '2012-05-08 07:10:07');

-- --------------------------------------------------------

--
-- Table structure for table `friend`
--

CREATE TABLE IF NOT EXISTS `friend` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `friend_id` int(11) DEFAULT NULL,
  `friend_id1` int(11) DEFAULT NULL,
  `comfirm` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_friend_user2` (`friend_id1`),
  KEY `fk_friend_user1` (`friend_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `friend`
--

INSERT INTO `friend` (`id`, `friend_id`, `friend_id1`, `comfirm`) VALUES
(4, 10025, 10004, 1),
(5, 10028, 100, 1),
(6, 10010, 100, 0),
(7, 10012, 10023, 1);

-- --------------------------------------------------------

--
-- Table structure for table `history`
--

CREATE TABLE IF NOT EXISTS `history` (
  `history_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `media_id` int(11) NOT NULL,
  `watched_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`history_id`),
  KEY `user_id` (`user_id`),
  KEY `media_id` (`media_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=57 ;

--
-- Dumping data for table `history`
--

INSERT INTO `history` (`history_id`, `user_id`, `media_id`, `watched_date`) VALUES
(1, 100, 94, '2012-05-05 00:43:11'),
(2, 100, 92, '2012-05-05 00:44:08'),
(3, 100, 84, '2012-05-05 00:45:01'),
(4, 100, 96, '2012-05-05 13:22:03'),
(5, 100, 96, '2012-05-05 13:38:23'),
(6, 100, 94, '2012-05-05 13:51:25'),
(7, 10012, 98, '2012-05-05 16:49:43'),
(8, 100, 99, '2012-05-05 19:40:35'),
(9, 100, 97, '2012-05-05 19:40:48'),
(10, 10010, 100, '2012-05-06 04:46:40'),
(11, 10010, 96, '2012-05-06 04:48:04'),
(12, 100, 99, '2012-05-06 15:21:12'),
(14, 10004, 92, '2012-05-07 23:39:54'),
(15, 10004, 94, '2012-05-07 23:40:15'),
(16, 10004, 102, '2012-05-08 00:05:24'),
(17, 10004, 95, '2012-05-08 00:09:21'),
(20, 10025, 93, '2012-05-08 04:34:22'),
(21, 10010, 104, '2012-05-08 05:33:35'),
(22, 10010, 104, '2012-05-08 05:34:40'),
(23, 10010, 104, '2012-05-08 05:36:10'),
(24, 10010, 104, '2012-05-08 05:38:59'),
(25, 10010, 104, '2012-05-08 05:40:23'),
(26, 10010, 104, '2012-05-08 05:42:58'),
(27, 10010, 104, '2012-05-08 05:48:52'),
(28, 10010, 104, '2012-05-08 05:56:39'),
(29, 10010, 104, '2012-05-08 05:58:12'),
(30, 10010, 104, '2012-05-08 05:59:20'),
(31, 10010, 104, '2012-05-08 05:59:59'),
(32, 10026, 99, '2012-05-08 06:37:01'),
(33, 10026, 96, '2012-05-08 06:47:18'),
(34, 10026, 97, '2012-05-08 06:47:31'),
(35, 10026, 95, '2012-05-08 06:47:38'),
(36, 10026, 102, '2012-05-08 06:47:44'),
(37, 10026, 100, '2012-05-08 06:47:58'),
(38, 10026, 91, '2012-05-08 06:48:14'),
(39, 10026, 104, '2012-05-08 06:49:00'),
(40, 10026, 106, '2012-05-08 06:51:06'),
(41, 10026, 99, '2012-05-08 07:00:36'),
(42, 10026, 99, '2012-05-08 07:00:42'),
(43, 10026, 99, '2012-05-08 07:00:45'),
(44, 10026, 106, '2012-05-08 07:01:00'),
(45, 10026, 106, '2012-05-08 07:01:05'),
(46, 10026, 106, '2012-05-08 07:02:47'),
(47, 10026, 106, '2012-05-08 07:04:05'),
(48, 10026, 106, '2012-05-08 07:06:50'),
(49, 10026, 94, '2012-05-08 07:07:23'),
(50, 10026, 91, '2012-05-08 07:07:31'),
(51, 10026, 96, '2012-05-08 07:09:29'),
(52, 10025, 106, '2012-05-08 14:22:00'),
(53, 10025, 101, '2012-05-08 14:22:22'),
(54, 10028, 106, '2012-05-08 15:33:10'),
(55, 10010, 95, '2012-05-09 04:51:21'),
(56, 10012, 98, '2012-05-10 03:31:52');

-- --------------------------------------------------------

--
-- Table structure for table `like`
--

CREATE TABLE IF NOT EXISTS `like` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `media_id` int(11) DEFAULT NULL,
  `liked_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_like_user1` (`user_id`),
  KEY `fk_like_media1` (`media_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `like`
--

INSERT INTO `like` (`id`, `user_id`, `media_id`, `liked_date`) VALUES
(2, 10010, 104, '2012-05-08 05:52:19');

-- --------------------------------------------------------

--
-- Table structure for table `media`
--

CREATE TABLE IF NOT EXISTS `media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `add_date` datetime DEFAULT NULL,
  `hit` int(11) DEFAULT NULL,
  `desc` varchar(45) DEFAULT NULL,
  `type` enum('video','audio') DEFAULT NULL,
  `category_id` int(11) DEFAULT NULL,
  `privacy` enum('0','1','2') NOT NULL DEFAULT '0',
  `file_path` varchar(512) NOT NULL,
  `thumbnail_path` varchar(512) NOT NULL,
  `tags` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_media_user1` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=107 ;

--
-- Dumping data for table `media`
--

INSERT INTO `media` (`id`, `user_id`, `name`, `add_date`, `hit`, `desc`, `type`, `category_id`, `privacy`, `file_path`, `thumbnail_path`, `tags`) VALUES
(84, 100, 'fafa', '2012-05-02 21:46:40', 132, '', 'video', 3, '0', '/var/www/ustubefiles/6704356a-25ca-4615-b36e-2fae74b07d67.mp4', '/var/www/ustubefiles/thumb/6704356a-25ca-4615-b36e-2fae74b07d67_1.jpg', 'video hit first baby'),
(91, 10004, 'proud', '2012-05-03 22:36:08', 11, 'nice song~!', 'video', 3, '0', '/var/www/ustubefiles/e0554a64-1f23-4fef-ac80-0624272d6285.mp4', '/var/www/ustubefiles/thumb/e0554a64-1f23-4fef-ac80-0624272d6285_1.jpg', 'video hit second'),
(92, 10004, 'both of us', '2012-05-03 23:06:28', 11, 'a nice song from taylor swift', 'video', 3, '0', '/var/www/ustubefiles/d9fa671b-c788-4da8-aab8-fa0aaa4b5846.mp4', '/var/www/ustubefiles/thumb/d9fa671b-c788-4da8-aab8-fa0aaa4b5846_1.jpg', ''),
(93, 10004, 'discovery', '2012-05-03 23:13:28', 203, 'the world is just awesome~', 'video', 3, '0', '/var/www/ustubefiles/026299dd-fd9f-420c-918f-d7e139b842cb.mp4', '/var/www/ustubefiles/thumb/026299dd-fd9f-420c-918f-d7e139b842cb_1.jpg', ''),
(94, 10004, 'walle', '2012-05-03 23:22:15', 27, 'they r so adorable~ loooooooooooooooool~', 'video', 3, '0', '/var/www/ustubefiles/a520345d-4872-4233-983f-c9bca1708746.mp4', '/var/www/ustubefiles/thumb/a520345d-4872-4233-983f-c9bca1708746_1.jpg', ''),
(95, 10007, 'Snow ', '2012-05-04 02:29:18', 29, 'by Red hot chili peppers', 'audio', 4, '0', '/var/www/ustubefiles/880bbe07-8b66-4418-9169-5a857c54dfe4.mp3', '', 'Rock'),
(96, 100, 'Hallelujah', '2012-05-05 13:21:48', 7, 'Cover Song Hallelujah Unplugged', 'audio', 4, '0', '/var/www/ustubefiles/084b1814-34ba-401d-87ed-3229e35003a0.mp3', '', 'Cover Song Hallelujah Unplugged'),
(97, 100, 'My Cover Behind Blue Eyes', '2012-05-05 13:46:05', 4, 'Behing blue eyes ozzy unplugged recording', 'audio', 4, '0', '/var/www/ustubefiles/7ef3e0d4-7d6e-4425-a3b9-b53cfc48152b.mp3', '', 'Behing blue eyes ozzy unplugged recording'),
(98, 10012, 'chin_test2', '2012-05-05 16:49:06', 3, 'testing video3', 'video', 3, '1', '/var/www/ustubefiles/cfa9af68-c50f-4b1d-b89d-ef0ce952e2e4.mp4', '/var/www/ustubefiles/thumb/cfa9af68-c50f-4b1d-b89d-ef0ce952e2e4_1.jpg', 'test2'),
(99, 100, 'In Dino Cover', '2012-05-05 19:40:24', 7, 'Cover In Dino Bollywood Karoake Life in Metro', 'audio', 4, '0', '/var/www/ustubefiles/a395d7ec-6df7-482b-ba24-28328b135a5b.mp3', '', 'Cover In Dino Bollywood Karoake Life Metro'),
(100, 10010, 'HTML5&#35270;&#39057;', '2012-05-06 04:37:17', 21, '&#28023;&#24213;&#20004;&#19975;&#37324;', 'video', 3, '0', '/var/www/ustubefiles/bd64421d-bf40-454e-a3a5-abd8ea1e4200.mp4', '/var/www/ustubefiles/thumb/bd64421d-bf40-454e-a3a5-abd8ea1e4200_1.jpg', 'HTML5&#65292;&#20013;&#25991;&#27979;&#35797;'),
(101, 10000, 'test', '2012-05-07 01:30:12', 4, 'test desc', 'video', 5, '0', '/var/www/ustubefiles/74b6b8b4-4c19-4784-8656-f70aa542c74b.mp4', '/var/www/ustubefiles/thumb/74b6b8b4-4c19-4784-8656-f70aa542c74b_1.jpg', 'testtag'),
(102, 10004, 'Foreplay/Longtime', '2012-05-07 23:58:43', 7, 'Boston!', 'audio', 4, '0', '/var/www/ustubefiles/867ac7b0-556a-4484-9e9c-cd825bb04340.mp3', '', ''),
(103, 10023, 'Sea', '2012-05-08 00:34:46', 5, 'Beautiful Sea World', 'video', 3, '0', '/var/www/ustubefiles/8417ba7e-1084-420e-bddb-f612812c4ef5.mp4', '/var/www/ustubefiles/thumb/8417ba7e-1084-420e-bddb-f612812c4ef5_1.jpg', 'Nature'),
(104, 10010, 'We are young', '2012-05-08 05:30:45', 27, 'By Fun', 'video', 3, '0', '/var/www/ustubefiles/a7f87dce-e0a8-45d1-bbbc-c1f7c89692ab.mp4', '/var/www/ustubefiles/thumb/a7f87dce-e0a8-45d1-bbbc-c1f7c89692ab_1.jpg', 'Rock'),
(105, 100, 'Kinect', '2012-05-08 06:16:20', NULL, 'Kinect demonstration', 'video', 3, '1', '/var/www/ustubefiles/fef810ae-6b46-4936-8a9f-595ec4422dbc.mp4', '/var/www/ustubefiles/thumb/fef810ae-6b46-4936-8a9f-595ec4422dbc_1.jpg', 'kinect technology computer'),
(106, 10026, 'We are young', '2012-05-08 06:51:00', 18, 'We are young', 'video', 3, '0', '/var/www/ustubefiles/384f5206-839e-4ad5-8bbe-329dd8f373e8.mp4', '/var/www/ustubefiles/thumb/384f5206-839e-4ad5-8bbe-329dd8f373e8_1.jpg', 'We are young');

-- --------------------------------------------------------

--
-- Table structure for table `slides`
--

CREATE TABLE IF NOT EXISTS `slides` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mediaId` int(11) NOT NULL,
  `description` varchar(512) NOT NULL,
  `thumbnail_path` varchar(512) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `mediaId` (`mediaId`),
  KEY `mediaId_2` (`mediaId`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `slides`
--

INSERT INTO `slides` (`id`, `mediaId`, `description`, `thumbnail_path`) VALUES
(2, 91, 'a uplifting song!~~~~~~', '/var/www/ustubefiles/thumb/proud.png'),
(3, 92, 'a nice song from B.O.B', '/var/www/ustubefiles/thumb/both of us.png'),
(5, 93, 'the world is just awesome~~~~', '/var/www/ustubefiles/thumb/discovery.png'),
(6, 94, 'they r so adorable~~~~looooooooool~', '/var/www/ustubefiles/thumb/walle.png');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) DEFAULT NULL,
  `nick_name` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `activation_code` varchar(255) NOT NULL,
  `city` varchar(56) DEFAULT 'address',
  `name` varchar(56) DEFAULT 'name',
  `sex` enum('male','female') DEFAULT 'male',
  `dob` date DEFAULT '2000-01-01',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10030 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `user_name`, `nick_name`, `password`, `email`, `is_active`, `activation_code`, `city`, `name`, `sex`, `dob`) VALUES
(100, 'baibhav', NULL, 'check', 'baibhavr@gmail.com', 1, '0', 'albany', 'baib', 'male', '2012-05-01'),
(10000, 'aparna', NULL, 'aparna', 'aparna@aa.com', 1, '0', 'Albany ny', 'Test', 'female', '2012-05-03'),
(10004, 'test', NULL, 'test', 'dan.bokser@gmail.com', 1, '64b2047c-e343-4bc2-b882-657b017b6fe3', 'albany', 'dan', 'male', '2012-05-02'),
(10007, 'test3', NULL, 'test2', 'dbokser@albany.edu', 1, 'a4fe79a3-d754-4209-b962-76bff22ba758', 'city', 'name', 'male', '2012-05-03'),
(10009, 'test3453', NULL, 'test', 'fd@fdsa.cd', 0, 'b6d86bfe-be15-4e3f-b5ba-09987dc3a950', 'city', 'name', 'male', '2012-05-03'),
(10010, 'Stanislaus', NULL, '123321', 'zju@albany.edu', 1, 'e476dcea-9aec-4b1b-a712-9aaad9a125ce', 'city', 'name', 'male', '2012-05-06'),
(10011, 'cpj', NULL, 'pw', 'ch@yagoo.com', 0, '25b1797d-40d7-4564-bfdb-35bbcc329b1f', 'city', 'name', 'male', '2012-05-15'),
(10012, 'chinthaka', NULL, 'chinthaka', 'cjayawardena@albany.edu', 1, 'a0f6e903-079b-4efe-9fd6-8e43be49e69a', 'city', 'name', 'male', '2012-05-04'),
(10017, 'chinthaka2', NULL, 'pw', 'cj@gmail.com', 0, '793ae2eb-e8b5-400f-a13d-0a42083181c0', 'address', 'name', 'male', '2000-01-01'),
(10018, 'chin', NULL, 'pw', 'cjayawardena@albnay.edu', 0, '7b83158d-402d-415f-b55a-ed300c2c615e', 'address', 'name', 'male', '2000-01-01'),
(10019, 'cpj007', NULL, 'password', 'cjayawardena@albnay.edu', 0, 'b0157cc7-371a-4b34-9334-3dcc2071f9c0', 'address', 'name', 'male', '2000-01-01'),
(10020, 'cpj18', NULL, 'pw', 'chinthakapj@yahoo.com', 0, '996a254b-d8bb-4ac2-8ac0-b5aef7832b35', 'address', 'name', 'male', '2000-01-01'),
(10022, 'prasad', NULL, 'pw', 'rr@gmail.com', 1, 'b9886c05-23a4-472f-843e-98ee47d30b33', '19 Delaware Ave Albany NY', 'Ronald Raygan', 'male', '1969-03-01'),
(10023, 'team2', NULL, 'pw', 'chinthakapj@gmail.com', 1, '5b6d6181-712a-4db2-ac5a-169cc88f082a', 'Albany NY', 'Chinthaka', 'male', '2000-01-01'),
(10025, 'huang', NULL, 'huang', 'yellowstone.huangshi@gmail.com', 1, '324964f2-9867-4400-a698-f78f0049a729', 'Albany', 'huang shi', 'male', '1985-11-13'),
(10026, 'ustube1', NULL, 'ustube', 'bair@gmail.com', 1, '08a63640-ff59-4d48-b8fe-2662e155bfc3', 'address', 'name', 'male', '2000-01-01'),
(10028, 'ustube', NULL, 'ustube', 'baibhavlr@gmail.com1', 1, 'f181339f-31d7-41f7-98a6-86f3786b6217', 'address', 'ustube', 'male', '2000-01-01'),
(10029, 'paurakh', NULL, 'baibhav', 'baibhavlr@gmail.com', 1, 'd93c5337-8204-4e6e-a612-c4a50d5e35a6', 'address', 'name', 'male', '2000-01-01');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `fk_comment_media1` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_comment_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `friend`
--
ALTER TABLE `friend`
  ADD CONSTRAINT `fk_friend_user1` FOREIGN KEY (`friend_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_friend_user2` FOREIGN KEY (`friend_id1`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `history`
--
ALTER TABLE `history`
  ADD CONSTRAINT `history_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `history_ibfk_2` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `like`
--
ALTER TABLE `like`
  ADD CONSTRAINT `fk_like_media1` FOREIGN KEY (`media_id`) REFERENCES `media` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_like_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `media`
--
ALTER TABLE `media`
  ADD CONSTRAINT `fk_media_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `slides`
--
ALTER TABLE `slides`
  ADD CONSTRAINT `slides_ibfk_1` FOREIGN KEY (`mediaId`) REFERENCES `media` (`id`);

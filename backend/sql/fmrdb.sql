-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 28, 2026 at 06:46 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fmrdb`
--

-- --------------------------------------------------------

--
-- Table structure for table `chatbot_logs`
--

CREATE TABLE `chatbot_logs` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `user_message` text DEFAULT NULL,
  `bot_reply` text DEFAULT NULL,
  `intent` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `chatbot_logs`
--

INSERT INTO `chatbot_logs` (`id`, `user_id`, `user_message`, `bot_reply`, `intent`, `created_at`) VALUES
(1, 1, 'Why my report is rejected?', 'Your report may be rejected due to:\n* Blurry or unclear images\n* Duplicate report already exists\n* Invalid/private location\n* Incomplete information', 'faq', '2026-04-12 14:20:17'),
(2, 1, 'How to report an issue', 'Reporting is easy! Just follow these steps:\n1. Tap the **Report** button on the home screen.\n2. Take a clear photo (up to 3 images).\n3. Confirm GPS location.\n4. Tap **Submit**. Your report will be sent for review.', 'faq', '2026-04-12 14:20:25'),
(3, 1, 'Why cause a pothole ', 'Potholes form when water seeps into cracks in the road surface, weakens the underlying layers, and traffic loads cause the weakened spot to collapse. In Malaysia, common contributors are:\n\n- Heavy rain and poor drainage (especially during monsoon season)  \n- Ageing asphalt and lack of timely maintenance by JKR or the local council (PBT)  \n- Heavy truck traffic and repeated loading on the same spot  \n- Sub‑grade settlement or poor base material  \n\nRegular resurfacing and good drainage are key to preventing them.', 'road', '2026-04-12 14:20:34'),
(4, 1, 'How can I contact the person incharge', 'I can only help with app usage and road infrastructure questions.', 'other', '2026-04-12 14:21:05'),
(5, 1, 'What categories of issues can I report?', 'Check:\n1. Internet connection\n2. Required photos uploaded\n3. App is updated\n4. All fields completed', 'faq', '2026-04-13 02:50:55'),
(6, 1, 'Why my report is rejected?', 'Your report may be rejected due to:\n* Blurry or unclear images\n* Duplicate report already exists\n* Invalid/private location\n* Incomplete information', 'faq', '2026-04-13 02:51:17'),
(7, 1, 'How to change my profile details?', 'I can only help with app usage and road infrastructure questions.', 'other', '2026-04-13 02:51:27'),
(8, 1, 'explain a little bit what king of drainaige cause dangerous', 'In Malaysia, unsafe road conditions are often caused by **poor or blocked drainage**, such as:\n\n- **Clogged roadside drains** – leaves, sand, or construction debris block water flow, leading to water pooling on the carriageway.\n- **Inadequate drainage capacity** – old or undersized culverts cannot handle heavy rain, causing flooding on the road surface.\n- **Improperly designed slopes** – water runs onto the road instead of away from it, creating slippery patches or hydro‑hydroplaning risk.\n- **Damaged or collapsed drains** – cracks or collapses create potholes and sudden depressions that can cause loss of vehicle control.\n\nThese drainage failures can lead to **hydroplaning, reduced tyre grip, potholes, and even road collapse**, especially during the monsoon season. Regular cleaning, proper design, and timely maintenance by JKR or the local PBT (Pihak Berkuasa Tempatan) are essential to keep roads safe.', 'road', '2026-04-13 02:51:54'),
(9, 1, 'How to report a road issue?', 'You can report a road problem (pothole, broken sign, drainage, street‑light, etc.) in three easy ways:\n\n1. **MyRoad / MyJKR app** – download the “MyRoad” (or “JKR Road Maintenance”) app, select “Report Issue”, attach a photo, give the location and submit.  \n2. **Online e‑aduan portal** – visit the local council (PBT) website or the JKR e‑aduan portal (https://aduan.jkr.gov.my) and fill in the form.  \n3. **Phone / SMS** – call the JKR toll‑free line +603‑8888 8888 or send an SMS with “REPORT + location + type of issue” to 1515 (PBT‑specific numbers may vary).\n\nAfter you submit, you’ll receive a reference number and the agency will schedule a repair. If it’s an urgent safety hazard, call the nearest PBT or JKR office directly.', 'road', '2026-04-13 06:35:17'),
(10, 1, 'How to track my report status?', 'Reporting is easy! Just follow these steps:\n1. Tap the **Report** button on the home screen.\n2. Take a clear photo (up to 3 images).\n3. Confirm GPS location.\n4. Tap **Submit**. Your report will be sent for review.', 'faq', '2026-04-13 08:37:53'),
(11, 1, 'why potholes is dangerous', 'Potholes are dangerous because they can:\n\n- **Cause vehicle damage** – sudden impacts can break tyres, rims, suspension or steering components, leading to costly repairs.  \n- **Trigger accidents** – drivers may swerve or brake sharply to avoid a hole, increasing the risk of collisions, especially on busy Malaysian roads or during wet conditions.  \n- **Reduce road safety** – potholes affect braking distance and vehicle stability, making it harder to control the car, particularly for motorcyclists and heavy vehicles.  \n\nIn Malaysia, heavy rain and flood‑prone areas can worsen potholes, so reporting them to the local council (PBT) or JKR helps keep the road network safe.', 'road', '2026-04-13 08:38:15');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL,
  `state_iso2` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `faq`
--

CREATE TABLE `faq` (
  `id` int(11) NOT NULL,
  `question` text DEFAULT NULL,
  `answer` text DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `faq`
--

INSERT INTO `faq` (`id`, `question`, `answer`, `category`) VALUES
(1, 'How do I report a road issue?', 'Reporting is easy! Just follow these steps:\n1. Tap the **Report** button on the home screen.\n2. Take a clear photo (up to 3 images).\n3. Confirm GPS location.\n4. Tap **Submit**. Your report will be sent for review.', 'report'),
(2, 'What do I need to submit a pothole complaint?', 'You need:\n* Clear photo of the pothole\n* GPS location (auto-detected)\n* Short description (optional but helpful)', 'report'),
(3, 'Can I submit a report without a photo?', 'No. A photo is required so authorities can verify the issue and its severity.', 'report'),
(4, 'Why was my report rejected?', 'Your report may be rejected due to:\n* Blurry or unclear images\n* Duplicate report already exists\n* Invalid/private location\n* Incomplete information', 'report'),
(8, 'How can I check my report status?', 'Go to **My Reports** section. You will see statuses like Pending, Approved, In Progress, or Resolved.', 'status'),
(9, 'What does \"Pending\" mean?', 'Pending means your report has been received and is waiting for admin review.', 'status'),
(10, 'What does \"Approved\" or \"In Progress\" mean?', 'Approved means accepted. In Progress means repair work has started or scheduled.', 'status'),
(17, 'Why is my location not accurate?', 'GPS accuracy can be affected by buildings or weak signal. Enable High Accuracy mode and allow location permission.', 'location'),
(19, 'Can I manually select a location on the map?', 'Yes. You can drag and adjust the map marker before submitting.', 'location'),
(23, 'What is the purpose of the Fix My Road (FMR) app?', 'FMR is a community app that allows users to report road issues directly to authorities for faster repairs.', 'general'),
(25, 'Who handles and reviews my reports?', 'Reports are reviewed by system admins and forwarded to local authorities for action.', 'general'),
(29, 'Why can’t I submit my report?', 'Check:\n1. Internet connection\n2. Required photos uploaded\n3. App is updated\n4. All fields completed', 'troubleshoot'),
(31, 'How many photos can I upload for one report?', 'You can upload up to **3 photos** per report to provide better evidence.', 'report'),
(32, 'What types of road issues can I report?', 'You can report:\n* Potholes\n* Road cracks\n* Flooded roads\n* Broken street lights\n* Missing signs\n* Road obstructions', 'report'),
(33, 'Can I edit my report after submitting it?', 'No. Submitted reports cannot be edited. You may cancel it if still pending and resubmit.', 'report'),
(34, 'What happens after I submit a report?', '1. System validates your report\n2. Admin reviews it\n3. If valid, it is approved\n4. Maintenance team is assigned\n5. You receive status updates', 'report'),
(35, 'Why do I need to allow GPS permission?', 'GPS helps locate the exact issue so repair teams can reach the correct location quickly.', 'report'),
(36, 'Why is my report location different from actual location?', 'This happens due to weak GPS signal. Always adjust the marker manually before submitting.', 'location'),
(37, 'Does the app track my location all the time?', 'No. Location is only used when submitting reports or using map features.', 'location'),
(38, 'Can I report issues in another city or state?', 'Yes, but ensure the location is accurate and within supported regions.', 'location'),
(39, 'What does \"Rejected\" status mean?', 'Rejected means the report was not accepted due to invalid, duplicate, or unclear information.', 'status'),
(40, 'How long does it take to fix a reported issue?', 'It usually takes **3–14 days**, depending on severity and priority.', 'status'),
(41, 'Can I get notifications when status changes?', 'Yes. You will receive in-app notifications when your report status updates.', 'status'),
(42, 'App is stuck on loading screen. What should I do?', 'Try:\n1. Restart app\n2. Clear cache\n3. Check internet\n4. Reinstall app if needed', 'troubleshoot'),
(43, 'Why is my photo upload failing?', 'Causes:\n* Slow internet\n* Large image size\n* Server timeout\nTry compressing image or switching network.', 'troubleshoot'),
(44, 'Why can’t I log in to my account?', 'Check:\n1. Email/password correct\n2. Internet connection\n3. Use Forgot Password if needed', 'troubleshoot'),
(45, 'Is the Fix My Road app free to use?', 'Yes, it is completely free for all users.', 'general'),
(46, 'Do I need an account to use the app?', 'Yes. An account is required to submit and track reports.', 'general'),
(47, 'Is my personal data safe?', 'Yes. Your data is securely stored and only used for report management.', 'general');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `code` varchar(10) NOT NULL,
  `expires_at` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `report_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `issue_type` enum('Pothole','Drainage','Other','Public Transport Facilities','Road Sign','Roadside Safety','Street Light','Traffic Light') NOT NULL,
  `title` varchar(150) NOT NULL,
  `description` text DEFAULT NULL,
  `location_text` varchar(255) DEFAULT NULL,
  `latitude` decimal(10,8) NOT NULL,
  `longitude` decimal(11,8) NOT NULL,
  `photo1` varchar(255) DEFAULT NULL,
  `photo2` varchar(255) DEFAULT NULL,
  `photo3` varchar(255) DEFAULT NULL,
  `status` enum('pending','approved','in_progress','rejected','completed') NOT NULL DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `rejection_reason` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `report`
--

INSERT INTO `report` (`report_id`, `user_id`, `updated_by`, `issue_type`, `title`, `description`, `location_text`, `latitude`, `longitude`, `photo1`, `photo2`, `photo3`, `status`, `created_at`, `updated_at`, `rejection_reason`) VALUES
(1, 2, 1, 'Pothole', 'Found a large pothole on the road', 'Near the front of Dmas UUM', 'Dewan Muadzam shah Hall, Changlun, Malaysia', 6.46768994, 100.50528299, 'uploads/reports/1776001740_69dba2ccb5feb.jpg', 'uploads/reports/1776001740_69dba2ccb61c3.jpg', 'uploads/reports/1776001740_69dba2ccb6350.jpg', 'rejected', '2026-04-01 13:49:00', '2026-04-28 14:47:34', 'Duplicate Report'),
(2, 2, 1, 'Drainage', 'Saliran tersumbat', 'Saliran di inasis tnb tersumbat', 'Laluan DPP MAS, Universiti Utara Malaysia, Malaysia', 6.45770957, 100.50330352, 'uploads/reports/1776001832_69dba328e5322.jpg', NULL, NULL, 'completed', '2026-03-31 13:50:32', '2026-04-12 14:25:34', NULL),
(3, 2, 1, 'Street Light', 'The light is broken', 'Street light broken cause the road very dangerous, can\'t see anything during night', '276, Changlun, Malaysia', 6.44846960, 100.50799973, 'uploads/reports/1776001917_69dba37d1659a.jpg', NULL, NULL, 'approved', '2026-04-08 13:51:57', '2026-04-12 14:24:03', NULL),
(4, 1, 1, 'Traffic Light', 'The traffic light not function', 'Dangerous for people to cross the road, the car drive very fast', 'Bagunan Sosial & Bahasa Moden, Changlun, Malaysia', 6.46579703, 100.50877456, 'uploads/reports/1776002006_69dba3d644ee8.jpg', 'uploads/reports/1776002006_69dba3d645033.jpg', NULL, 'pending', '2026-03-20 13:53:26', '2026-04-12 14:26:07', NULL),
(5, 3, 1, 'Traffic Light', 'Traffic light broken', 'It is dangerous', 'Changlun Uum Sintok, Changlun, Malaysia', 6.44876778, 100.50974585, 'uploads/reports/1776002670_69dba66ece213.jpg', NULL, NULL, 'in_progress', '2026-04-12 14:04:30', '2026-04-27 17:11:39', NULL),
(6, 3, 1, 'Public Transport Facilities', 'Bus stop kena tambahbaikkan daripada perlindungan hujan', 'Bus stop in xleh langsung nak terlindung drp hujan apabila hujan lebat, every time tunggu bas masa hujan akan basah semua', '166, Ambangan Heights, Sungai Petani, Malaysia', 5.70295857, 100.53544879, 'uploads/reports/1776002893_69dba74dbb619.jpg', NULL, NULL, 'approved', '2026-04-12 14:08:13', '2026-04-28 15:02:42', NULL),
(7, 2, 1, 'Drainage', 'Saliran kena improve', 'Saliran ni asyik tersumbat apabila hujan lebat saja', 'K06 MyKiosk, Kampung Kenanga, Rawang, Malaysia', 3.31343501, 101.58037674, 'uploads/reports/1776002994_69dba7b2173c0.jpg', 'uploads/reports/1776002994_69dba7b21757f.jpg', NULL, 'completed', '2026-03-12 14:09:54', '2026-04-12 14:19:33', NULL),
(8, 2, 2, 'Other', 'Tanah Runtuh!!!', 'Tanah Runtuh berlaku di kawasan pergi ke Bukit kachi', 'K20, Changlun, Malaysia', 6.44495047, 100.51776800, 'uploads/reports/1776003079_69dba807007f7.jpg', NULL, NULL, 'pending', '2026-04-12 14:11:19', '2026-04-12 14:11:19', NULL),
(9, 2, 2, 'Road Sign', 'Road sign need to be improve', 'Road sign beri laluan ini telah dilanggar, jadi semua yang dari luar xtau sini boleh pusing tanpa tunggu traffic light', 'No. 11, Arau, Arau, Malaysia', 6.42953639, 100.27086899, 'uploads/reports/1776003171_69dba863ab336.jpg', NULL, NULL, 'pending', '2026-03-22 14:12:51', '2026-04-12 14:24:43', NULL),
(10, 2, 1, 'Roadside Safety', 'Pasang barriers beside road', 'For roadside safety', '912, Kampung Tampoi, Krubong, Malaysia', 2.27995231, 102.23125767, 'uploads/reports/1776003263_69dba8bfdcd7f.jpg', 'uploads/reports/1776003263_69dba8bfdcf2b.jpg', NULL, 'rejected', '2026-04-12 14:14:23', '2026-04-28 14:47:21', 'Out of Scope'),
(11, 2, 2, 'Roadside Safety', 'Roadside safety', '🦺 please take note of this', '19, Kuala Nerang, Malaysia', 6.33064075, 100.56931067, 'uploads/reports/1776003334_69dba9061d822.jpg', NULL, NULL, 'pending', '2026-03-20 14:15:34', '2026-04-12 14:26:53', NULL),
(12, 2, 1, 'Pothole', 'A big hole', 'Very dangerous for motorcyclist especially when night', 'c80, Kampung Changkat Setol, Changlun, Malaysia', 6.43222337, 100.45989800, 'uploads/reports/1776003398_69dba946601b6.jpg', 'uploads/reports/1776003398_69dba94660315.jpg', 'uploads/reports/1776003398_69dba946603c2.jpg', 'approved', '2026-04-02 14:16:38', '2026-04-21 13:17:19', NULL),
(13, 2, 1, 'Street Light', 'Very dark when night', 'The street light broken', 'K517, Kampung Tandop, Pokok Sena, Malaysia', 6.07533839, 100.66860504, 'uploads/reports/1776003447_69dba97715e2a.jpg', 'uploads/reports/1776003447_69dba97715f59.jpg', NULL, 'approved', '2026-02-12 14:17:27', '2026-04-12 14:19:01', NULL),
(14, 2, 1, 'Public Transport Facilities', 'aaaaaaa', 'aaaa', 'Bagunan Sosial & Bahasa Moden, Changlun, Malaysia', 6.46653760, 100.50902870, 'uploads/reports/1776068577_69dca7e14ec3c.jpg', NULL, NULL, 'rejected', '2026-04-13 08:22:57', '2026-04-28 14:47:15', 'Spam Report'),
(15, 4, 1, 'Pothole', 'Potholes', 'Near Tnb', 'Persiaran Perdana, Universiti Utara Malaysia, Malaysia', 6.45546847, 100.50388958, 'uploads/reports/1776767636_69e7529411348.jpg', NULL, NULL, 'in_progress', '2026-04-21 10:33:56', '2026-04-27 17:29:01', NULL),
(16, 4, 1, 'Traffic Light', 'Traffic light not function', 'That traffic light not functioning since two days ago, causing jam', '90, Taman Perindustrian Anson, Teluk Intan, Malaysia', 3.99553502, 101.00501876, 'uploads/reports/1777314009_69efa8d93df3b.jpg', 'uploads/reports/1777314009_69efa8d93e065.jpg', 'uploads/reports/1777314009_69efa8d93e144.jpg', 'approved', '2026-04-27 18:20:09', '2026-04-27 18:22:45', NULL),
(17, 4, 1, 'Street Light', 'No light', 'The street light rosak, jarang ada orang jalan sana, very dangerous if somebody is ...', '570, Pekan Baru, Teluk Intan, Malaysia', 3.99005251, 101.01142656, 'uploads/reports/1777314133_69efa955d54de.jpg', NULL, NULL, 'in_progress', '2026-04-27 18:22:13', '2026-04-27 18:22:50', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `states`
--

CREATE TABLE `states` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `iso2` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `unanswered`
--

CREATE TABLE `unanswered` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `question` text DEFAULT NULL,
  `detected_intent` varchar(50) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `unanswered`
--

INSERT INTO `unanswered` (`id`, `user_id`, `question`, `detected_intent`, `created_at`) VALUES
(12, 1, 'How can I contact the person incharge', 'other', '2026-04-12 14:21:05'),
(13, 1, 'How to change my profile details?', 'other', '2026-04-13 02:51:27');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `phone_no` varchar(20) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `postal_code` varchar(10) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `profile_picture` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `email`, `phone_no`, `password`, `first_name`, `last_name`, `address`, `postal_code`, `state`, `city`, `profile_picture`, `created_at`, `updated_at`) VALUES
(1, 'aaa@gmail.com', '01738191031', '$2y$10$VptH1xG.VxSN0QTGGZk5yuIvq1xplWIcWfVwnxPQzG9zLzD3BZhgG', 'Siew Ting', 'Ong', 'No.10, Jalan aaa', '06010', 'Kedah', 'Jitra', NULL, '2026-04-12 13:35:27', '2026-04-12 13:36:03'),
(2, 'bbb@gmail.com', '01839193019', '$2y$10$6ZejuWUw2w7s4SN3cGM6W.2Uk73IFNnOU6sXDcQIw6x.cbJXYV0ii', 'Erica', 'Tan', 'No.161, jalan bbb', '36000', 'Perak', 'Teluk Intan', 'uploads/profile_photo/1776001664_image_cropper_1776001660907.jpg', '2026-04-12 13:36:25', '2026-04-12 13:47:44'),
(3, 'ccc@gmail.com', '01829103819', '$2y$10$YLu.xqH4M7BqMY81dPV2z.WmwVQpS6trg6LhYXP1DstZbCFiR/e2.', 'Jin Min', 'Xue', '01371891031', '06010', 'Sabah', 'Putatan', NULL, '2026-04-12 13:37:33', '2026-04-12 13:38:07'),
(4, 'siewting8008@gmail.com', '0167934415', '$2y$10$dyJBScw9ZIPCZtKULhKF4Oycxl8c4UL6DfMdetRmkapN3U6Prkr8e', 'Ong', 'Siew Ting', 'No10', '36000', 'Perak', 'Teluk Intan', 'uploads/profile_photo/1776766761_image_cropper_1776766757080.jpg', '2026-04-21 10:18:21', '2026-04-21 16:49:33'),
(5, 'laotou487@gmail.com', '01783901027', '$2y$10$mjL6BdY1kGv9V4LtaaXJm.m4vhgrTyb.YveNgy3F5f.aJIp2h9vea', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-21 11:05:20', '2026-04-21 16:08:38'),
(6, 'nothing@gmail.com', '01783901027', '$2y$10$.Zdm6Qqgu9LupmbOuXewrewZt1vs6oj6R1z.KfqhYBKCIxzABczkG', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-04-21 11:05:33', '2026-04-21 11:05:33');

-- --------------------------------------------------------

--
-- Table structure for table `verification_codes`
--

CREATE TABLE `verification_codes` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `code` varchar(6) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `expires_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `verification_codes`
--

INSERT INTO `verification_codes` (`id`, `email`, `code`, `created_at`, `expires_at`) VALUES
(10, 'laotou487@gmail.com', '4045', '2026-04-21 16:18:27', '2026-04-22 00:23:27'),
(13, 'siewting8008@gmail.com', '3435', '2026-04-27 17:46:45', '2026-04-28 01:51:45');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `chatbot_logs`
--
ALTER TABLE `chatbot_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`),
  ADD KEY `state_iso2` (`state_iso2`);

--
-- Indexes for table `faq`
--
ALTER TABLE `faq`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`report_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `updated_by` (`updated_by`);

--
-- Indexes for table `states`
--
ALTER TABLE `states`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `iso2` (`iso2`);

--
-- Indexes for table `unanswered`
--
ALTER TABLE `unanswered`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `verification_codes`
--
ALTER TABLE `verification_codes`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `chatbot_logs`
--
ALTER TABLE `chatbot_logs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faq`
--
ALTER TABLE `faq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `states`
--
ALTER TABLE `states`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `unanswered`
--
ALTER TABLE `unanswered`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `verification_codes`
--
ALTER TABLE `verification_codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `chatbot_logs`
--
ALTER TABLE `chatbot_logs`
  ADD CONSTRAINT `chatbot_logs_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE;

--
-- Constraints for table `cities`
--
ALTER TABLE `cities`
  ADD CONSTRAINT `cities_ibfk_1` FOREIGN KEY (`state_iso2`) REFERENCES `states` (`iso2`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `report`
--
ALTER TABLE `report`
  ADD CONSTRAINT `report_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `report_ibfk_2` FOREIGN KEY (`updated_by`) REFERENCES `user` (`user_id`) ON DELETE SET NULL;

--
-- Constraints for table `unanswered`
--
ALTER TABLE `unanswered`
  ADD CONSTRAINT `unanswered_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

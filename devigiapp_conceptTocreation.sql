-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 07, 2023 at 12:40 PM
-- Server version: 5.7.42
-- PHP Version: 8.1.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `devigiapp_conceptTocreation`
--

-- --------------------------------------------------------

--
-- Table structure for table `add_cart`
--

CREATE TABLE `add_cart` (
  `id` bigint(20) NOT NULL,
  `userid` int(11) NOT NULL,
  `courseid` int(11) NOT NULL,
  `cdate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `payment_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `payment_status` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email_id` varchar(40) DEFAULT NULL,
  `password` varchar(40) DEFAULT NULL,
  `role` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `last_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `email_id`, `password`, `role`, `status`, `last_login`) VALUES
(1, 'admin', 'admin@admin.com', 'e10adc3949ba59abbe56e057f20f883e', 1, 1, '2019-01-31 07:27:59');

-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

CREATE TABLE `banner` (
  `id` int(11) NOT NULL,
  `heading` varchar(255) DEFAULT NULL,
  `sub_heading` varchar(255) DEFAULT NULL,
  `banner_image` varchar(255) DEFAULT NULL,
  `banner_url` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `banner`
--

INSERT INTO `banner` (`id`, `heading`, `sub_heading`, `banner_image`, `banner_url`, `status`, `created_at`) VALUES
(1, 'World Leading Learning Platform', 'People Expect to be Bored of Learning &lt;br&gt; DONT BE', 'h2-11.jpg', 'https://dev.igiapp.com/concepttocreation/course-detail/7', 1, '2023-05-04 16:36:42'),
(2, 'Beyond Automation', 'RECREATE yourself &lt;br&gt; EXPONENTIALLY!', 'h2-21.jpg', 'https://dev.igiapp.com/concepttocreation/course-detail/7', 1, '2023-05-04 16:38:44'),
(3, 'Concept To Creation', 'Use your uniqueness  &lt;br&gt; to automate creativity!', 'pexels-buro-millennial-1438072.jpg', 'https://dev.igiapp.com/concepttocreation/course-detail/8', 1, '2023-05-16 05:20:14');

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `uploaded_by` varchar(255) NOT NULL,
  `popular` int(11) NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cert_payments`
--

CREATE TABLE `cert_payments` (
  `id` bigint(20) NOT NULL,
  `userid` int(11) NOT NULL,
  `courseid` int(11) NOT NULL,
  `shiped_price` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `payment_status` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `trans_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cert_verify`
--

CREATE TABLE `cert_verify` (
  `id` int(11) NOT NULL,
  `cert_name` varchar(255) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `org_name` varchar(255) NOT NULL,
  `org_fname` varchar(255) NOT NULL,
  `org_lname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `rply_text` longtext NOT NULL,
  `rply_status` int(11) NOT NULL,
  `rply_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cms`
--

CREATE TABLE `cms` (
  `id` int(11) NOT NULL,
  `page` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `meta_description` text NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `image1` text NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cms`
--

INSERT INTO `cms` (`id`, `page`, `title`, `meta_title`, `slug`, `meta_description`, `description`, `image`, `image1`, `status`, `created_at`) VALUES
(1, 'About us', 'Welcome to The Concept To Creation', 'Welcome to The Concept To Creation', 'welcome-to-the-concept-to-creation', 'Recogizing the need is the primary than we expected Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sint ipsa voluptatibus,', '<p><strong>Recogizing the need is the primary than we expected Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sint ipsa voluptatibus,</strong></p>\r\n\r\n<p><span class=\"marker\"><em><strong>Great Site to Learn and Gain Knowledge.</strong></em></span></p>\r\n', 'image11.png', '', 1, '2019-01-30 02:28:24'),
(2, 'Privacy Policy', 'Privacy Policy', 'Privacy Policy', 'privacy-policy', '', '<p>In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.</p>\r\n\r\n<p>In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.</p>\r\n\r\n<p>In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.</p>\r\n\r\n<p>In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.</p>\r\n\r\n<p>In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.</p>\r\n', '', '', 1, '2019-04-10 06:10:58'),
(4, 'Why students choose us', 'Why students choose us?', 'Why students choose us?', 'why-students-choose-us', 'Why students choose us?', '<p>Leverage our experience and collaborations.</p>\r\n', '', '', 1, '2020-10-30 04:40:10'),
(5, 'Self Paced online', 'Self Paced online', 'Self Paced online', 'self-paced-online', 'Self Paced online', '<p>Online industry standard certifications, thoroughly prepared by experts.</p>\r\n', '', '', 1, '2020-10-30 04:40:50'),
(6, 'Mentorship', 'Mentorship', 'Mentorship', 'mentorship', 'Mentorship', '<p>One on one mentorship access to professionals with decades of experience in pharmaceuticals.</p>\r\n', '', '', 1, '2020-10-30 04:41:35'),
(12, 'Terms of Service', 'Terms of Service', '', 'terms-of-service', '', '<p>In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.</p>\r\n\r\n<p>In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.</p>\r\n\r\n<p>In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.</p>\r\n\r\n<p>In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.</p>\r\n', '', '', 1, '2020-12-10 06:24:08'),
(13, 'Hands on work experience', 'Hands on work experience', 'Hands on work experience', 'hands-on-work-experience', 'Hands on work experience', '<p>With safety databases, CTMS, eTMF, EDC applications.</p>\r\n', '', '', 1, '2021-01-08 01:20:44'),
(14, 'Collaborations', 'Collaborations', 'Collaborations', 'collaborations', 'Collaborations', '<p>with hiring agencies, Pharmaceutical/CRO companies.</p>\r\n', '', '', 1, '2021-01-15 04:27:15'),
(15, 'Job place assistance', '100% Job place assistance', '100% Job place assistance', '100-job-place-assistance', '100% Job place assistance', '<p>End to end assistance with resume writing, mock screens and interview questionnaire.</p>\r\n', '', '', 1, '2021-01-15 04:30:30'),
(16, 'Get In Touch', 'Get In Touch', 'Get In Touch', 'get-in-touch', 'Get In Touch', '<p>Have some queries or suggestions, or just want to say hi? Our support teams are ready to help you 24/7.</p>\r\n', '', '', 1, '2021-01-15 04:31:05'),
(20, 'Job readiness', 'Job readiness', 'Job readiness', 'job-readiness', 'Curriculum drafted for current market needs.', '<p>Curriculum drafted for current market needs.</p>\r\n', '', '', 1, '2023-01-19 09:15:40'),
(21, 'Consulting', 'Consulting Services at Concept To Creation', 'Consulting services at Concept To Creation', 'consulting-services-at-concept-to-creation', 'We offer the best consulting services on this planet', '<p><strong>Knowledge is Information, and the more you share the more you know:</strong></p>\r\n\r\n<p>Our expertise is available to you at all times so that you may benefit from our experience. Our consulting servies include&nbsp;</p>\r\n\r\n<ul>\r\n	<li>Job Consulting</li>\r\n	<li>Career Planning</li>\r\n	<li>Placements and relocation</li>\r\n	<li>Portfolio management</li>\r\n</ul>\r\n\r\n<p>All are welcome, and all shall benefit.</p>\r\n', 'image12.png', 'image1.jpg', 1, '2023-05-05 00:52:32');

-- --------------------------------------------------------

--
-- Table structure for table `consulting_form`
--

CREATE TABLE `consulting_form` (
  `id` bigint(20) NOT NULL,
  `fname` varchar(30) NOT NULL,
  `lname` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` int(10) NOT NULL,
  `msg` text NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `rply_text` longtext NOT NULL,
  `rply_status` int(11) NOT NULL,
  `rply_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `consulting_form`
--

INSERT INTO `consulting_form` (`id`, `fname`, `lname`, `email`, `phone`, `msg`, `created`, `rply_text`, `rply_status`, `rply_date`) VALUES
(3, 'demo', '', 'goutampaul@goigi.in', 1236547890, 'Hello.\r\nThis is a text message from consulting.', '2023-05-05 14:47:33', 'Test Message', 1, '2023-05-25 07:57:29');

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `phone` int(15) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `crested_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `rply_text` longtext NOT NULL,
  `rply_status` int(11) NOT NULL,
  `rply_date` datetime DEFAULT NULL,
  `address` text NOT NULL,
  `business_name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `fname`, `lname`, `email`, `phone`, `subject`, `message`, `crested_at`, `rply_text`, `rply_status`, `rply_date`, `address`, `business_name`) VALUES
(1, 'demo', '', 'demo@gmail.com', 2147483647, 'Demo Subject', 'Hello,\r\nThis is a test message form contact us page.', '2023-05-05 09:19:08', 'Is this for communication with students?', 1, '2023-05-10 02:52:30', '', ''),
(2, 'Kaustav', '', 'kaustav@goigi.com', 2147483647, 'ABC', 'How do I enroll ? Please assist.', '2023-05-16 00:11:54', 'Hi We are calling you, Please receive the call.', 1, '2023-05-16 05:43:01', '', ''),
(4, 'Goutam', '', 'goutampaul@goigi.in', 2147483647, 'Conception creation', 'Test Message', '2023-05-25 12:28:37', 'Your message is valuable for us.We will get back to you soon.', 1, '2023-05-25 07:36:06', 'Test Address', 'Test name');

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `heading_1` text,
  `heading_2` text,
  `meta_descr` varchar(1000) NOT NULL,
  `description` text NOT NULL,
  `program_overview` longtext,
  `objectives` longtext,
  `curriculam` longtext,
  `duration` longtext,
  `career_paths` longtext,
  `price` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `video` text NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `cat_id`, `title`, `slug`, `heading_1`, `heading_2`, `meta_descr`, `description`, `program_overview`, `objectives`, `curriculam`, `duration`, `career_paths`, `price`, `rating`, `image`, `video`, `status`, `created_at`) VALUES
(1, 1, 'ADVANCED CERTIFICATE PROGRAMME IN MACHINE LEARNING & NLP', 'advanced-certificate-programme-in-machine-learning-nlp', 'Competing in the Age of AI—Virtual', 'Eligibility: Bachelor’s degree with a minimum ofThe program fee covers tuition, e-books, and online case materials.\r\n\r\nThis program includes live online classes, self-paced work, discussion groups, and virtual networking. Download brochure for detailed schedule.\r\n\r\nSummary\r\n\r\nArtificial intelligence (AI) is revolutionizing the way today\'s businesses compete and operate. By putting AI and data at the center of their capabilities, companies are redefining how they create, capture, and share value—and are achieving impressive growth as a result. Whatever your industry or business model, you cannot afford to ignore this exciting, highly disruptive trend.\r\n\r\nIn this live online program, you will delve into new AI-based business models and operational approaches. As you explore a range of capabilities that can help your business succeed in today\'s data-driven environments, you will discover how you can lead your company\'s transformation into an AI-first leader. Along with learning how to unlock new growth potential, you will deepen your understanding of ethical challenges that come with leveraging massive amounts of data and sophisticated analytics. 50% or equivalent passing marks.', '', '<p>The program fee covers tuition, e-books, and online case materials.</p>\r\n\r\n<p>This program includes live online classes, self-paced work, discussion groups, and virtual networking. Download brochure for detailed schedule.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Summary</h2>\r\n\r\n<p>Artificial intelligence (AI) is revolutionizing the way today&#39;s businesses compete and operate. By putting AI and data at the center of their capabilities, companies are redefining how they create, capture, and share value&mdash;and are achieving impressive growth as a result. Whatever your industry or business model, you cannot afford to ignore this exciting, highly disruptive trend.</p>\r\n\r\n<p>In this live online program, you will delve into new AI-based business models and operational approaches. As you explore a range of capabilities that can help your business succeed in today&#39;s data-driven environments, you will discover how you can lead your company&#39;s transformation into an AI-first leader. Along with learning how to unlock new growth potential, you will deepen your understanding of ethical challenges that come with leveraging massive amounts of data and sophisticated analytics.</p>\r\n\r\n<p>&nbsp;</p>\r\n', '<p>Key Benefits</p>\r\n\r\n<p>This online artificial intelligence course is a &quot;how-to&quot; guide that demystifies AI and its practical implications for business advantage. You will delve into diverse applications of AI, machine learning, predictive modeling, and data science; explore network effects and platform strategies; and learn how to build an AI factory that enables your company to compete successfully in existing and new markets. You will also analyze your organization&#39;s current business models and AI capabilities, identify new opportunities, and create specific plans for growth.</p>\r\n\r\n<p>&nbsp;</p>\r\n', '<p><a href=\"https://www.exed.hbs.edu/competing-age-ai-virtual/?utm_source=google&amp;utm_medium=paid-search&amp;utm_campaign=exed-non-brand-program-aiv-global-none-exact-cross-device-india&amp;utm_id=core&amp;gclid=EAIaIQobChMIjprq84TZ_gIV-JlmAh3u6wuoEAAYASAAEgIA4PD_BwE&amp;gclsrc=aw.ds#\">Move toward an AI-based business model</a></p>\r\n\r\n<ul>\r\n	<li>Choose how best to apply AI in your industry and your business</li>\r\n	<li>Redesign key components of your organization and operating model</li>\r\n	<li>Lead the creation of algorithms, software infrastructure, data pipelines, and experimentation platforms</li>\r\n	<li>Guide your organization in the development of sophisticated data platforms and artificial intelligence capabilities and enable higher levels of automation</li>\r\n	<li>Ensure an ethical approach to AI and manage inherent risks</li>\r\n</ul>\r\n\r\n<p><a href=\"https://www.exed.hbs.edu/competing-age-ai-virtual/?utm_source=google&amp;utm_medium=paid-search&amp;utm_campaign=exed-non-brand-program-aiv-global-none-exact-cross-device-india&amp;utm_id=core&amp;gclid=EAIaIQobChMIjprq84TZ_gIV-JlmAh3u6wuoEAAYASAAEgIA4PD_BwE&amp;gclsrc=aw.ds#\">Create opportunities to build competitive advantage</a></p>\r\n\r\n<ul>\r\n	<li>Reimagine your company&#39;s value propositions to create new revenue streams</li>\r\n	<li>Redesign organizational systems, processes, and roles to be AI driven</li>\r\n	<li>Build the skills, capabilities, and culture to manage an AI-first operating model</li>\r\n	<li>Recognize and benefit from network effects and learning effects</li>\r\n</ul>\r\n\r\n<p><a href=\"https://www.exed.hbs.edu/competing-age-ai-virtual/?utm_source=google&amp;utm_medium=paid-search&amp;utm_campaign=exed-non-brand-program-aiv-global-none-exact-cross-device-india&amp;utm_id=core&amp;gclid=EAIaIQobChMIjprq84TZ_gIV-JlmAh3u6wuoEAAYASAAEgIA4PD_BwE&amp;gclsrc=aw.ds#\">Expand your personal and professional network</a></p>\r\n\r\n<ul>\r\n	<li>Extend your network by connecting and working with accomplished executives from various backgrounds, industries, and countries around the globe</li>\r\n	<li>Build relationships with a diverse group of peers who can provide wide-ranging insights into your business challenges and career decisions</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n', '<h2>What You Will Learn</h2>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Through a rich experience that includes live online sessions with faculty, new case studies, self-paced learning, small-group discussions, and insights from experts, you will discover how artificial intelligence is transforming today&#39;s businesses&mdash;and how your business can benefit. These lessons feature all new material developed by the faculty, and focus on leading companies such as Ant Financial and Moderna. This online artificial intelligence course releases AI from the black box and provides a blueprint to help all businesses&mdash;from startups to long-established companies&mdash;compete successfully and thrive in the age of AI.</p>\r\n\r\n<p>This program is based on the findings summarized in the groundbreaking and critically acclaimed book&nbsp;<em>Competing in the Age of AI: Strategy and Leadership When Algorithms and Networks Run the World</em>.</p>\r\n\r\n<h2>Program Format</h2>\r\n\r\n<p>Each week of the program includes one live online session (interactive case discussion, simulation, or expert panel) and three to five hours of self-paced learning and small-group discussions. Class sessions and discussions will take place via the Zoom platform. Carefully curated small groups of peers will facilitate learning, idea exchange, and networking throughout the course.</p>\r\n\r\n<p>The program will also leverage an extensive network of analytics and AI mentors to help you contextualize and apply your learning. Collaborative learning is an integral part of this virtual experience. To maximize the benefit for everyone, participants are expected to attend every session, complete all assignments, and contribute effectively in the Zoom classroom and in small peer groups.</p>\r\n\r\n<p>Participants should expect to spend at least 9-12 hours on self-paced case preparation prior to attending the program. Case materials will be made available approximately two weeks prior to program start.</p>\r\n\r\n<p>&nbsp;</p>\r\n', '13 Months', '<p><a href=\"https://www.exed.hbs.edu/competing-age-ai-virtual/curriculum#\">The age of AI</a></p>\r\n\r\n<ul>\r\n	<li>Tracing digitization of the economy and the (re)emergence of AI</li>\r\n	<li>Understanding the impact of AI on business and operating models</li>\r\n	<li>Developing a framework for driving business and industry transformation</li>\r\n	<li>Evolving leadership in the era of AI</li>\r\n	<li>Exploring surprising uses of AI today</li>\r\n</ul>\r\n\r\n<p><a href=\"https://www.exed.hbs.edu/competing-age-ai-virtual/curriculum#\">Network effects and learning effects</a></p>\r\n\r\n<ul>\r\n	<li>Overcoming the challenge of developing strategy in today&#39;s AI landscape</li>\r\n	<li>Comparing AI-first firms to traditional product and/or service-based organizations</li>\r\n	<li>Implementing powerful innovation frameworks</li>\r\n	<li>Building network effects, using them to accelerate competitive advantage&mdash;and competing against them</li>\r\n	<li>Taking full advantage of learning effects as you scale your operations</li>\r\n</ul>\r\n\r\n<p><a href=\"https://www.exed.hbs.edu/competing-age-ai-virtual/curriculum#\">The AI factory</a></p>\r\n\r\n<ul>\r\n	<li>Developing a data pipeline to gather, clean, integrate, and safeguard data in a systematic, sustainable, and scalable way</li>\r\n	<li>Developing algorithms</li>\r\n	<li>Deploying personalization for maximum effectiveness</li>\r\n	<li>Using predictive modeling to anticipate future states or actions of the business</li>\r\n	<li>Testing hypotheses with an experimentation platform</li>\r\n	<li>Ensuring that your infrastructure supports key processes and connects them to both internal and external users</li>\r\n</ul>\r\n\r\n<p><a href=\"https://www.exed.hbs.edu/competing-age-ai-virtual/curriculum#\">The AI-first company</a></p>\r\n\r\n<ul>\r\n	<li>Accruing the advantages of scale, scope, learning, and speed to innovate and go to market</li>\r\n	<li>Understanding how companies with an AI factory core deliver significant value to customers</li>\r\n	<li>Designing and implementing organizational and technological architectures needed to achieve success</li>\r\n	<li>Navigating the inherent challenges of AI and capturing strategic opportunities</li>\r\n</ul>\r\n\r\n<p><a href=\"https://www.exed.hbs.edu/competing-age-ai-virtual/curriculum#\">Ethics of AI and data</a></p>\r\n\r\n<ul>\r\n	<li>Building and scaling a responsible AI framework</li>\r\n	<li>Ensuring privacy and cybersecurity</li>\r\n	<li>Avoiding algorithmic bias</li>\r\n	<li>Managing risks related to inclusiveness and transparency</li>\r\n</ul>\r\n\r\n<p><a href=\"https://www.exed.hbs.edu/competing-age-ai-virtual/curriculum#\">Driving organizational transformation</a></p>\r\n\r\n<ul>\r\n	<li>Leading a new kind of digital transformation</li>\r\n	<li>Assessing your organization&#39;s AI readiness and maturity</li>\r\n	<li>Developing your AI-first Scorecard</li>\r\n	<li>Rearchitecting your operating model</li>\r\n	<li>Providing effective, unbiased service that protects consumers</li>\r\n	<li>Intensifying the value of data</li>\r\n	<li>Mitigating collisions between traditional and digital operating models</li>\r\n</ul>\r\n\r\n<p><a href=\"https://www.exed.hbs.edu/competing-age-ai-virtual/curriculum#\">AI Application Deep Dives</a></p>\r\n\r\n<p>HBS faculty will curate interactive cases and panels with industry experts that examine the wide range of AI applications being put into use in today&#39;s enterprises. You will have the opportunity to choose at least two of these live sessions, and the remaining sessions will be available to view asynchronously.</p>\r\n\r\n<p><a href=\"https://www.exed.hbs.edu/competing-age-ai-virtual/curriculum#\">AI Readiness Survey</a></p>\r\n\r\n<p>You will evaluate your own organization&#39;s AI readiness and learn how your organization compares with other firms in similar industries and geographies. The survey serves as a research tool, a diagnostic tool, and a benchmark tool. You will review survey results with peers and faculty.</p>\r\n', 29, 0, 'photo-1620712943543-bcc4688e7485_1.jpg', '', 1, '2023-05-04 00:42:20'),
(2, 1, 'MASTER CERTIFICATE PROGRAMME IN MACHINE LEARNING & NLP', 'master-certificate-programme-in-machine-learning-nlp', 'Age of AI—Virtual', 'Eligibility: Bachelor’s degree with a minimum ofThe program fee covers tuition, e-books, and online case materials.\r\n\r\nThis program includes live online classes, self-paced work, discussion groups, and virtual networking. Download brochure for detailed schedule.\r\n\r\nSummary\r\n\r\nArtificial intelligence (AI) is revolutionizing the way today\'s businesses compete and operate. By putting AI and data at the center of their capabilities, companies are redefining how they create, capture, and share value—and are achieving impressive growth as a result. Whatever your industry or business model, you cannot afford to ignore this exciting, highly disruptive trend.\r\n\r\nIn this live online program, you will delve into new AI-based business models and operational approaches. As you explore a range of capabilities that can help your business succeed in today\'s data-driven environments, you will discover how you can lead your company\'s transformation into an AI-first leader. Along with learning how to unlock new growth potential, you will deepen your understanding of ethical challenges that come with leveraging massive amounts of data and sophisticated analytics. 50% or equivalent passing marks.', '', '<p>The program fee covers tuition, e-books, and online case materials.</p>\r\n\r\n<p>This program includes live online classes, self-paced work, discussion groups, and virtual networking. Download brochure for detailed schedule.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Summary</h2>\r\n\r\n<p>Artificial intelligence (AI) is revolutionizing the way today&#39;s businesses compete and operate. By putting AI and data at the center of their capabilities, companies are redefining how they create, capture, and share value&mdash;and are achieving impressive growth as a result. Whatever your industry or business model, you cannot afford to ignore this exciting, highly disruptive trend.</p>\r\n\r\n<p>In this live online program, you will delve into new AI-based business models and operational approaches. As you explore a range of capabilities that can help your business succeed in today&#39;s data-driven environments, you will discover how you can lead your company&#39;s transformation into an AI-first leader. Along with learning how to unlock new growth potential, you will deepen your understanding of ethical challenges that come with leveraging massive amounts of data and sophisticated analytics.</p>\r\n\r\n<p>&nbsp;</p>\r\n', '<p>Key Benefits</p>\r\n\r\n<p>This online artificial intelligence course is a &quot;how-to&quot; guide that demystifies AI and its practical implications for business advantage. You will delve into diverse applications of AI, machine learning, predictive modeling, and data science; explore network effects and platform strategies; and learn how to build an AI factory that enables your company to compete successfully in existing and new markets. You will also analyze your organization&#39;s current business models and AI capabilities, identify new opportunities, and create specific plans for growth.</p>\r\n\r\n<p>&nbsp;</p>\r\n', '<p><a href=\"https://www.exed.hbs.edu/competing-age-ai-virtual/?utm_source=google&amp;utm_medium=paid-search&amp;utm_campaign=exed-non-brand-program-aiv-global-none-exact-cross-device-india&amp;utm_id=core&amp;gclid=EAIaIQobChMIjprq84TZ_gIV-JlmAh3u6wuoEAAYASAAEgIA4PD_BwE&amp;gclsrc=aw.ds#\">Move toward an AI-based business model</a></p>\r\n\r\n<ul>\r\n	<li>Choose how best to apply AI in your industry and your business</li>\r\n	<li>Redesign key components of your organization and operating model</li>\r\n	<li>Lead the creation of algorithms, software infrastructure, data pipelines, and experimentation platforms</li>\r\n	<li>Guide your organization in the development of sophisticated data platforms and artificial intelligence capabilities and enable higher levels of automation</li>\r\n	<li>Ensure an ethical approach to AI and manage inherent risks</li>\r\n</ul>\r\n\r\n<p><a href=\"https://www.exed.hbs.edu/competing-age-ai-virtual/?utm_source=google&amp;utm_medium=paid-search&amp;utm_campaign=exed-non-brand-program-aiv-global-none-exact-cross-device-india&amp;utm_id=core&amp;gclid=EAIaIQobChMIjprq84TZ_gIV-JlmAh3u6wuoEAAYASAAEgIA4PD_BwE&amp;gclsrc=aw.ds#\">Create opportunities to build competitive advantage</a></p>\r\n\r\n<ul>\r\n	<li>Reimagine your company&#39;s value propositions to create new revenue streams</li>\r\n	<li>Redesign organizational systems, processes, and roles to be AI driven</li>\r\n	<li>Build the skills, capabilities, and culture to manage an AI-first operating model</li>\r\n	<li>Recognize and benefit from network effects and learning effects</li>\r\n</ul>\r\n\r\n<p><a href=\"https://www.exed.hbs.edu/competing-age-ai-virtual/?utm_source=google&amp;utm_medium=paid-search&amp;utm_campaign=exed-non-brand-program-aiv-global-none-exact-cross-device-india&amp;utm_id=core&amp;gclid=EAIaIQobChMIjprq84TZ_gIV-JlmAh3u6wuoEAAYASAAEgIA4PD_BwE&amp;gclsrc=aw.ds#\">Expand your personal and professional network</a></p>\r\n\r\n<ul>\r\n	<li>Extend your network by connecting and working with accomplished executives from various backgrounds, industries, and countries around the globe</li>\r\n	<li>Build relationships with a diverse group of peers who can provide wide-ranging insights into your business challenges and career decisions</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n', '<h2>What You Will Learn</h2>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Through a rich experience that includes live online sessions with faculty, new case studies, self-paced learning, small-group discussions, and insights from experts, you will discover how artificial intelligence is transforming today&#39;s businesses&mdash;and how your business can benefit. These lessons feature all new material developed by the faculty, and focus on leading companies such as Ant Financial and Moderna. This online artificial intelligence course releases AI from the black box and provides a blueprint to help all businesses&mdash;from startups to long-established companies&mdash;compete successfully and thrive in the age of AI.</p>\r\n\r\n<p>This program is based on the findings summarized in the groundbreaking and critically acclaimed book&nbsp;<em>Competing in the Age of AI: Strategy and Leadership When Algorithms and Networks Run the World</em>.</p>\r\n\r\n<h2>Program Format</h2>\r\n\r\n<p>Each week of the program includes one live online session (interactive case discussion, simulation, or expert panel) and three to five hours of self-paced learning and small-group discussions. Class sessions and discussions will take place via the Zoom platform. Carefully curated small groups of peers will facilitate learning, idea exchange, and networking throughout the course.</p>\r\n\r\n<p>The program will also leverage an extensive network of analytics and AI mentors to help you contextualize and apply your learning. Collaborative learning is an integral part of this virtual experience. To maximize the benefit for everyone, participants are expected to attend every session, complete all assignments, and contribute effectively in the Zoom classroom and in small peer groups.</p>\r\n\r\n<p>Participants should expect to spend at least 9-12 hours on self-paced case preparation prior to attending the program. Case materials will be made available approximately two weeks prior to program start.</p>\r\n\r\n<p>&nbsp;</p>\r\n', '13 Months', '<p><a href=\"https://www.exed.hbs.edu/competing-age-ai-virtual/curriculum#\">The age of AI</a></p>\r\n\r\n<ul>\r\n	<li>Tracing digitization of the economy and the (re)emergence of AI</li>\r\n	<li>Understanding the impact of AI on business and operating models</li>\r\n	<li>Developing a framework for driving business and industry transformation</li>\r\n	<li>Evolving leadership in the era of AI</li>\r\n	<li>Exploring surprising uses of AI today</li>\r\n</ul>\r\n\r\n<p><a href=\"https://www.exed.hbs.edu/competing-age-ai-virtual/curriculum#\">Network effects and learning effects</a></p>\r\n\r\n<ul>\r\n	<li>Overcoming the challenge of developing strategy in today&#39;s AI landscape</li>\r\n	<li>Comparing AI-first firms to traditional product and/or service-based organizations</li>\r\n	<li>Implementing powerful innovation frameworks</li>\r\n	<li>Building network effects, using them to accelerate competitive advantage&mdash;and competing against them</li>\r\n	<li>Taking full advantage of learning effects as you scale your operations</li>\r\n</ul>\r\n\r\n<p><a href=\"https://www.exed.hbs.edu/competing-age-ai-virtual/curriculum#\">The AI factory</a></p>\r\n\r\n<ul>\r\n	<li>Developing a data pipeline to gather, clean, integrate, and safeguard data in a systematic, sustainable, and scalable way</li>\r\n	<li>Developing algorithms</li>\r\n	<li>Deploying personalization for maximum effectiveness</li>\r\n	<li>Using predictive modeling to anticipate future states or actions of the business</li>\r\n	<li>Testing hypotheses with an experimentation platform</li>\r\n	<li>Ensuring that your infrastructure supports key processes and connects them to both internal and external users</li>\r\n</ul>\r\n\r\n<p><a href=\"https://www.exed.hbs.edu/competing-age-ai-virtual/curriculum#\">The AI-first company</a></p>\r\n\r\n<ul>\r\n	<li>Accruing the advantages of scale, scope, learning, and speed to innovate and go to market</li>\r\n	<li>Understanding how companies with an AI factory core deliver significant value to customers</li>\r\n	<li>Designing and implementing organizational and technological architectures needed to achieve success</li>\r\n	<li>Navigating the inherent challenges of AI and capturing strategic opportunities</li>\r\n</ul>\r\n\r\n<p><a href=\"https://www.exed.hbs.edu/competing-age-ai-virtual/curriculum#\">Ethics of AI and data</a></p>\r\n\r\n<ul>\r\n	<li>Building and scaling a responsible AI framework</li>\r\n	<li>Ensuring privacy and cybersecurity</li>\r\n	<li>Avoiding algorithmic bias</li>\r\n	<li>Managing risks related to inclusiveness and transparency</li>\r\n</ul>\r\n\r\n<p><a href=\"https://www.exed.hbs.edu/competing-age-ai-virtual/curriculum#\">Driving organizational transformation</a></p>\r\n\r\n<ul>\r\n	<li>Leading a new kind of digital transformation</li>\r\n	<li>Assessing your organization&#39;s AI readiness and maturity</li>\r\n	<li>Developing your AI-first Scorecard</li>\r\n	<li>Rearchitecting your operating model</li>\r\n	<li>Providing effective, unbiased service that protects consumers</li>\r\n	<li>Intensifying the value of data</li>\r\n	<li>Mitigating collisions between traditional and digital operating models</li>\r\n</ul>\r\n\r\n<p><a href=\"https://www.exed.hbs.edu/competing-age-ai-virtual/curriculum#\">AI Application Deep Dives</a></p>\r\n\r\n<p>HBS faculty will curate interactive cases and panels with industry experts that examine the wide range of AI applications being put into use in today&#39;s enterprises. You will have the opportunity to choose at least two of these live sessions, and the remaining sessions will be available to view asynchronously.</p>\r\n\r\n<p><a href=\"https://www.exed.hbs.edu/competing-age-ai-virtual/curriculum#\">AI Readiness Survey</a></p>\r\n\r\n<p>You will evaluate your own organization&#39;s AI readiness and learn how your organization compares with other firms in similar industries and geographies. The survey serves as a research tool, a diagnostic tool, and a benchmark tool. You will review survey results with peers and faculty.</p>\r\n', 39, 0, 'premium_photo-1682824037866-f86695c32675.jpg', '', 1, '2023-05-04 00:42:20'),
(3, 2, 'Python Certification Course', 'python-certification-course', 'Python Certification Course', 'Learn to Program and Analyze Data with Python. Develop programs to gather, clean, analyze, and visualize data.', '', '<h2>Python Course <strong>Key Highlights</strong></h2>\r\n\r\n<p>42 Hrs Instructor Led Training</p>\r\n\r\n<p>24 Hrs Self-paced Videos</p>\r\n\r\n<p>50 Hrs Project &amp; Exercises</p>\r\n\r\n<p>Certification</p>\r\n\r\n<p>Job Assistance</p>\r\n\r\n<p>Flexible Schedule</p>\r\n\r\n<p>Lifetime Free Upgrade</p>\r\n\r\n<p>Mentor Support</p>\r\n\r\n<p>&nbsp;</p>\r\n', '<h2>Python Certification Course <strong>Overview</strong></h2>\r\n\r\n<p>This Python certification training will help you understand the high-level, general-purpose dynamic programming language of the decade. In this Python course, you will be exposed to both the basic and advanced concepts of Python such as Machine Learning, Deep Learning, Hadoop streaming, and MapReduce, and you will work with packages such as Scikit and SciPy. Read Less</p>\r\n\r\n<h3>What will you learn in this Python course online?</h3>\r\n\r\n<ol>\r\n	<li>Importance and introduction to Python and its installation</li>\r\n	<li>OOP, expressions, data types, looping, etc.</li>\r\n	<li>Functions, operations, and class defining</li>\r\n	<li>Machine Learning algorithms in Python</li>\r\n	<li>Course completion certificate from Intellipaat</li>\r\n	<li>Skills to crack Python professional certification</li>\r\n</ol>\r\n\r\n<h3>Who should take up this Python certification course?</h3>\r\n\r\n<h3>What are the prerequisites for taking up this Python course?</h3>\r\n\r\n<h3>Why should I learn Python programming language?</h3>\r\n\r\n<h3>What Python projects will you be working on in this online Python course?</h3>\r\n\r\n<h3>How is Intellipaat&rsquo;s Python certification awarded?</h3>\r\n\r\n<p>&nbsp;</p>\r\n', '<p>To earn our Python certification, you must complete the entire Python training program. Additionally, you must complete all the assignments and projects given and score a minimum of 60 percent in the certification exam conducted by Intellipaat. Once you complete all of it and finish the projects with the help of the trainers, you will receive an industry-recognized Python course completion certification from us.</p>\r\n\r\n<p>Intellipaat offers one of the top certification courses on Python, and it is designed by experts who aim to make you an expert in this programming language. Enroll in Intellipaat&rsquo;s Python online course today and take the first step toward getting an industry-recognized certification in it.</p>\r\n', '<h2>Peer <strong>Learning</strong></h2>\r\n\r\n<p>Via <strong>Intellipaat PeerChat</strong>, you can interact with your peers across all classes and batches and even our alumni. Collaborate on projects, share job referrals &amp; interview experiences, compete with the best, make new friends &mdash; the possibilities are endless and our community has something for everyone!</p>\r\n', '13 Months', '<h2>What is a Python developer?&nbsp;</h2>\r\n\r\n<p>Python developers design, code, and deploy development projects in the Python language. They also work on debugging those same projects to ensure they function as intended.</p>\r\n\r\n<p>As a python developer, you&#39;ll work closely with other teams, including data collection and <a href=\"https://www.coursera.org/articles/data-analytics\" target=\"_self\">analytics</a>, to help answer questions and provide insight. Some of the projects you could work on span everything from application development to <a href=\"https://www.coursera.org/articles/types-of-machine-learning\" target=\"_self\">machine learning</a> and AI.</p>\r\n\r\n<p>Becoming proficient in Python and its uses opens the door to job possibilities in various industries. Ultimately, your role and responsibilities will likely vary depending upon the industry and organization that you find yourself working within.</p>\r\n\r\n<p><strong>Read more: </strong><a href=\"https://www.coursera.org/articles/what-is-python-used-for-a-beginners-guide-to-using-python\" target=\"_self\">What Is Python Used For? A Beginner&rsquo;s Guide</a></p>\r\n\r\n<h2>Advantages of Python&nbsp;</h2>\r\n\r\n<p>Python is the most versatile language for coding and the second-best programming language for everything else [<a href=\"https://www.computerweekly.com/opinion/Python-30-Praising-the-versatility-of-Python\" target=\"_blank\">4</a>]. As a Python developer, you&rsquo;ll be able to use your skills to tackle multiple challenges. Additional advantages of Python include the following:&nbsp;&nbsp;&nbsp;</p>\r\n\r\n<h3>Python&rsquo;s one of the easiest languages to learn.</h3>\r\n\r\n<p>Python is among the easiest programming languages to learn because it prioritizes readability and relies on a syntax that&#39;s much like the commands of the English language. You also need fewer lines of code to perform tasks compared to other languages like Java and C or C++.</p>\r\n', 299, 0, 'best-online-courses-for-python-main.jpg', '', 1, '2023-05-05 11:45:18'),
(4, 3, 'Learn DS & Algorithms', 'learn-ds-algorithms', 'Learn DS & Algorithms', 'A computer program is a collection of instructions to perform a specific task. For this, a computer program may need to store data, retrieve data, and perform computations on the data.\r\n\r\nA data structure is a named location that can be used to store and organize data. And, an algorithm is a collection of steps to solve a particular problem. Learning data structures and algorithms allow us to write efficient and optimized computer programs.\r\n\r\nOur DSA tutorial will guide you to learn different types of data structures and algorithms and their implementations in Python, C, C++, and Java.', '', '<p>A data structure is a way of organizing and storing data in a computer&#39;s memory or storage space in a specific and efficient way that allows for easy access, manipulation, and retrieval of data. It provides a standardized way of organizing and managing large amounts of data so that it can be used effectively by computer programs.</p>\r\n\r\n<p>Different types of data structures are designed to handle different types of data and tasks. Some common data structures include arrays, linked lists, stacks, queues, trees, graphs, and hash tables.</p>\r\n\r\n<p>Arrays are a simple data structure that stores data elements in contiguous memory locations, allowing for fast random access to individual elements. Linked lists, on the other hand, are dynamic data structures that store data elements as nodes, each containing a pointer to the next node in the list. This allows for efficient insertion and deletion of elements, but random access to individual elements can be slower.</p>\r\n\r\n<p>Stacks and queues are data structures that are useful for implementing algorithms that require last-in, first-out (LIFO) or first-in, first-out (FIFO) processing. Trees are hierarchical data structures that are useful for representing data with parent-child relationships, while graphs are useful for representing relationships between arbitrary sets of objects.</p>\r\n\r\n<p>Hash tables are another common data structure that provides fast access to data elements based on their keys. They are useful for implementing databases and other applications where fast lookup times are important.</p>\r\n\r\n<p>Overall, data structures are an essential part of computer science and programming, and understanding how they work and how to use them effectively can greatly enhance a programmer&#39;s ability to write efficient and effective code.</p>\r\n\r\n<p>&nbsp;</p>\r\n', '<p>A data structure program is a computer program that implements one or more data structures, allowing users to efficiently store, access, manipulate, and retrieve data. These programs are typically written in a high-level programming language such as C++, Java, Python, or C#, and they use specific algorithms and techniques to ensure that data is organized and managed in an efficient manner.</p>\r\n\r\n<p>Some common data structure programs include:</p>\r\n\r\n<ol>\r\n	<li>\r\n	<p>Array programs - these programs manipulate data elements stored in arrays, such as sorting algorithms or search algorithms.</p>\r\n	</li>\r\n	<li>\r\n	<p>Linked list programs - these programs implement linked lists and allow users to insert, delete, or traverse nodes in the list.</p>\r\n	</li>\r\n	<li>\r\n	<p>Stack and queue programs - these programs implement stack and queue data structures and allow users to push, pop, or dequeue elements.</p>\r\n	</li>\r\n	<li>\r\n	<p>Tree and graph programs - these programs implement tree and graph data structures and allow users to add, remove, or search nodes and edges.</p>\r\n	</li>\r\n	<li>\r\n	<p>Hash table programs - these programs implement hash tables and allow users to insert, delete, or retrieve key-value pairs.</p>\r\n	</li>\r\n</ol>\r\n\r\n<p>Data structure programs are essential for building complex computer systems, such as operating systems, databases, and web applications. They are also used in various fields such as finance, healthcare, and scientific research, where large amounts of data need to be stored and analyzed efficiently. By using data structure programs, developers can optimize their code and improve the performance of their applications.</p>\r\n', '<p>The objectives of using data structures in computer programming are:</p>\r\n\r\n<ol>\r\n	<li>\r\n	<p>Efficient storage and retrieval of data: Data structures provide a way to store and organize data in memory or on disk in a way that makes it easy to access and retrieve data quickly and efficiently. By choosing the right data structure for a particular application, programmers can optimize the performance of their code.</p>\r\n	</li>\r\n	<li>\r\n	<p>Simplify code complexity: Data structures provide a way to manage and manipulate large amounts of data in a structured and organized manner, which can help to simplify the code complexity and reduce the chances of errors.</p>\r\n	</li>\r\n	<li>\r\n	<p>Improve algorithm efficiency: By using the appropriate data structure for a specific task, programmers can improve the efficiency of their algorithms. For example, choosing a hash table to implement a search algorithm can significantly reduce the search time compared to using an unsorted list.</p>\r\n	</li>\r\n	<li>\r\n	<p>Enable code reusability: Data structures are reusable components that can be used in different programs or parts of a program, which helps to reduce development time and effort.</p>\r\n	</li>\r\n	<li>\r\n	<p>Facilitate program maintenance: Data structures can make it easier to maintain code by providing a standard way to organize data, making it easier to debug, modify, and test code.</p>\r\n	</li>\r\n</ol>\r\n\r\n<p>Overall, the use of data structures is essential in computer programming to ensure efficient and effective processing of large amounts of data. By choosing the right data structure for a specific task, programmers can optimize code performance, simplify code complexity, and improve algorithm efficiency.</p>\r\n', '<p>A data structure curriculum typically covers the following topics:</p>\r\n\r\n<ol>\r\n	<li>\r\n	<p>Arrays: One-dimensional and multi-dimensional arrays, array operations, and algorithms.</p>\r\n	</li>\r\n	<li>\r\n	<p>Linked lists: Singly linked lists, doubly linked lists, circular linked lists, linked list operations, and algorithms.</p>\r\n	</li>\r\n	<li>\r\n	<p>Stacks and Queues: Basic concepts, stack and queue operations, and algorithms.</p>\r\n	</li>\r\n	<li>\r\n	<p>Trees: Binary trees, binary search trees, AVL trees, heap trees, and tree traversal algorithms.</p>\r\n	</li>\r\n	<li>\r\n	<p>Graphs: Basic concepts, graph representation, graph traversal algorithms, shortest path algorithms, and minimum spanning tree algorithms.</p>\r\n	</li>\r\n	<li>\r\n	<p>Hash tables: Hashing techniques, hash functions, hash table operations, and collision resolution algorithms.</p>\r\n	</li>\r\n	<li>\r\n	<p>Sorting and searching algorithms: Bubble sort, insertion sort, selection sort, merge sort, quick sort, linear search, binary search, and interpolation search.</p>\r\n	</li>\r\n	<li>\r\n	<p>Advanced topics: Red-black trees, B-trees, tries, and dynamic programming.</p>\r\n	</li>\r\n</ol>\r\n\r\n<p>In addition to the above topics, a data structure curriculum may also cover design patterns, object-oriented programming, and algorithm analysis. Students typically learn how to implement data structures using programming languages such as C++, Java, Python, or C#. They also learn how to analyze the performance of algorithms and data structures using Big O notation.</p>\r\n\r\n<p>The data structure curriculum is an essential part of a computer science degree program and is also a popular topic for online courses and tutorials. Proficiency in data structures is critical for software development and is necessary for building efficient and robust computer systems.</p>\r\n\r\n<p>&nbsp;</p>\r\n', '11 Months', '<p>Professionals with expertise in data structures are in high demand in various industries, including software development, data science, artificial intelligence, and machine learning. Some of the career paths for individuals with a strong foundation in data structures are:</p>\r\n\r\n<ol>\r\n	<li>\r\n	<p>Software Engineer: Software engineers design, develop, and maintain software applications. They use data structures to optimize the performance of software applications.</p>\r\n	</li>\r\n	<li>\r\n	<p>Data Scientist: Data scientists use data structures to analyze, interpret, and extract insights from large data sets. They apply data structures to build predictive models and identify patterns in data.</p>\r\n	</li>\r\n	<li>\r\n	<p>Artificial Intelligence/Machine Learning Engineer: AI/ML engineers use data structures to build and optimize machine learning algorithms. They apply data structures to design and develop intelligent systems that can learn from data.</p>\r\n	</li>\r\n	<li>\r\n	<p>Database Administrator: Database administrators use data structures to design, implement, and maintain databases. They optimize the database structure to ensure efficient storage and retrieval of data.</p>\r\n	</li>\r\n	<li>\r\n	<p>Systems Architect: Systems architects use data structures to design and develop computer systems. They optimize the system structure to ensure efficient processing of data.</p>\r\n	</li>\r\n	<li>\r\n	<p>Technical Writer: Technical writers use their knowledge of data structures to write technical documentation for software products. They create user manuals, help files, and other technical documentation to help users understand how to use software products.</p>\r\n	</li>\r\n</ol>\r\n\r\n<p>Overall, proficiency in data structures is essential for a wide range of career paths in computer science and related fields.</p>\r\n', 499, 0, '1_lGUL34nZvS3gXv4LNAKG3Q.jpg', '', 1, '2023-05-05 12:10:04'),
(5, 4, 'Full Stack Development Course', 'full-stack-development-course', 'Full Stack Development Course', 'Web development can be divided into two main categories: front-end development and back-end development. Front-end development involves creating the visual components of a website that users interact with, such as the layout, colors, and typography. Back-end development involves creating the underlying infrastructure that makes a website work, such as the server-side logic and database management.', '', '<p>Web development is the process of creating websites or web applications. It involves designing, building, and maintaining websites using a variety of programming languages, frameworks, and tools. The goal of web development is to create a website that is functional, user-friendly, and visually appealing.</p>\r\n\r\n<p>Web developers use a range of programming languages such as HTML, CSS, JavaScript, and PHP to create the structure, style, and interactivity of websites. They also use tools like text editors, code libraries, and content management systems to make the development process faster and more efficient.</p>\r\n\r\n<p>Web development can be divided into two main categories: front-end development and back-end development. Front-end development involves creating the visual components of a website that users interact with, such as the layout, colors, and typography. Back-end development involves creating the underlying infrastructure that makes a website work, such as the server-side logic and database management.</p>\r\n\r\n<p>Web development is an in-demand field, and there are many career opportunities available for skilled web developers. Some common job titles in web development include front-end developer, back-end developer, full-stack developer, and web designer.</p>\r\n', '<p>Web development is the process of creating dynamic and interactive web applications using a combination of programming languages, databases, and design tools. The web development process includes building and maintaining websites, web applications, and mobile applications.</p>\r\n\r\n<p>Here is an overview of the main components of a web development program:</p>\r\n\r\n<ol>\r\n	<li>\r\n	<p>HTML: Hypertext Markup Language is the foundation of any web development project. It is used to structure and present content on a webpage.</p>\r\n	</li>\r\n	<li>\r\n	<p>CSS: Cascading Style Sheets are used to add style and formatting to HTML. This includes color, layout, font, and other visual elements.</p>\r\n	</li>\r\n	<li>\r\n	<p>JavaScript: A programming language used to create dynamic and interactive web content. This includes animations, user input validation, and more.</p>\r\n	</li>\r\n	<li>\r\n	<p>Frameworks and Libraries: Web development frameworks and libraries help developers to build applications more quickly by providing pre-built code modules and templates.</p>\r\n	</li>\r\n	<li>\r\n	<p>Server-side Technologies: This includes programming languages such as PHP, Python, and Ruby, which are used to build server-side applications that communicate with databases and other services.</p>\r\n	</li>\r\n	<li>\r\n	<p>Databases: Web applications often rely on databases to store and retrieve data. Common databases used in web development include MySQL, PostgreSQL, and MongoDB.</p>\r\n	</li>\r\n	<li>\r\n	<p>Web Hosting: Websites and applications need to be hosted on a server to be accessible online. Web hosting services provide the infrastructure and support needed to make this possible.</p>\r\n	</li>\r\n</ol>\r\n\r\n<p>Overall, a web development program teaches students the skills they need to design, develop, and deploy web applications. This includes both front-end and back-end development, as well as web design principles and user experience (UX) design.</p>\r\n', '<p>The objectives of web development can vary depending on the specific goals of the project, but some common objectives include:</p>\r\n\r\n<ol>\r\n	<li>\r\n	<p>Creating a visually appealing and user-friendly website: The primary objective of web development is to create a website that is aesthetically pleasing and easy to navigate for users.</p>\r\n	</li>\r\n	<li>\r\n	<p>Optimizing website performance: Website performance is an important objective for web developers. This includes optimizing website load times, improving website speed, and ensuring the website is responsive and mobile-friendly.</p>\r\n	</li>\r\n	<li>\r\n	<p>Ensuring website security: Website security is a crucial objective for web developers. This includes implementing secure protocols such as HTTPS, protecting against malware and hacking, and safeguarding user data.</p>\r\n	</li>\r\n	<li>\r\n	<p>Developing website functionality: Web developers aim to create websites with advanced functionality such as forms, search functionality, e-commerce capabilities, and integrations with third-party services.</p>\r\n	</li>\r\n	<li>\r\n	<p>Ensuring website accessibility: Web developers also strive</p>\r\n	</li>\r\n</ol>\r\n', '<p>A web development curriculum typically covers several areas such as front-end development, back-end development, databases, and web design. Here is a sample curriculum for web development:</p>\r\n\r\n<p><strong>1. HTML, CSS, and JavaScript Fundamentals</strong></p>\r\n\r\n<ul>\r\n	<li>Introduction to web development and its components</li>\r\n	<li>HTML, CSS, and JavaScript basics and their roles in building websites</li>\r\n	<li>Responsive design and mobile-first development</li>\r\n	<li>Common CSS frameworks and libraries such as Bootstrap and Foundation</li>\r\n</ul>\r\n\r\n<p><strong>2. Front-end Web Development</strong></p>\r\n\r\n<ul>\r\n	<li>Advanced HTML and CSS techniques such as flexbox and grid layout</li>\r\n	<li>Introduction to JavaScript frameworks and libraries such as React, Vue, and jQuery</li>\r\n	<li>JavaScript ES6 features and syntax</li>\r\n	<li>Web accessibility and usability best practices</li>\r\n	<li>Web performance optimization and speed techniques</li>\r\n</ul>\r\n\r\n<p><strong>3. Back-end Web Development</strong></p>\r\n\r\n<ul>\r\n	<li>Introduction to server-side programming languages such as PHP, Python, and Ruby</li>\r\n	<li>Web server configuration and setup</li>\r\n	<li>Database fundamentals and design</li>\r\n	<li>Building RESTful APIs</li>\r\n	<li>Introduction to serverless computing</li>\r\n</ul>\r\n\r\n<p><strong>4. Full-stack Web Development</strong></p>\r\n\r\n<ul>\r\n	<li>Combining front-end and back-end development to build full-stack web applications</li>\r\n	<li>Using frameworks and libraries such as Node.js, Express.js, and Django to build full-stack applications</li>\r\n	<li>Real-time web applications using technologies such as WebSockets and Socket.io</li>\r\n	<li>DevOps concepts and practices for deploying and scaling web applications</li>\r\n</ul>\r\n\r\n<p><strong>5. Web Design</strong></p>\r\n\r\n<ul>\r\n	<li>Principles of design and typography</li>\r\n	<li>User experience (UX) and user interface (UI) design</li>\r\n	<li>Responsive design and design systems</li>\r\n	<li>Design tools and software such as Adobe Photoshop, Illustrator, and Sketch</li>\r\n</ul>\r\n\r\n<p>In addition to these technical skills, it is important to learn soft skills such as project management, collaboration, and communication to succeed as a web developer. It&#39;s also essential to stay updated with the latest technologies, trends, and best practices in the constantly evolving web development field.</p>\r\n', '18 Months', '<p>There are several different career paths within web development. Here are some of the most common:</p>\r\n\r\n<ol>\r\n	<li>\r\n	<p>Front-end Developer: Front-end developers are responsible for building the user-facing portion of a website or web application. This involves creating the layout, design, and interactivity of the website using languages such as HTML, CSS, and JavaScript.</p>\r\n	</li>\r\n	<li>\r\n	<p>Back-end Developer: Back-end developers are responsible for the server-side of web applications, which includes creating and managing databases, server-side scripting, and integrating with other web services.</p>\r\n	</li>\r\n	<li>\r\n	<p>Full-stack Developer: Full-stack developers are skilled in both front-end and back-end development, allowing them to work on all aspects of web development from server configuration to user interface design.</p>\r\n	</li>\r\n	<li>\r\n	<p>UI/UX Designer: UI/UX designers are responsible for designing the user interface and user experience of a website or web application. They work closely with front-end developers to ensure that the design is properly implemented.</p>\r\n	</li>\r\n	<li>\r\n	<p>DevOps Engineer: DevOps engineers are responsible for the deployment and management of web applications, as well as automating various aspects of the development process.</p>\r\n	</li>\r\n	<li>\r\n	<p>Technical SEO Specialist: Technical SEO specialists are responsible for ensuring that a website is optimized for search engines. This involves working with front-end and back-end developers to improve website performance and implementing various SEO strategies.</p>\r\n	</li>\r\n	<li>\r\n	<p>Web Content Developer: Web content developers are responsible for creating and publishing website content, including text, images, and multimedia. They may also be responsible for managing a website&#39;s social media presence.</p>\r\n	</li>\r\n	<li>\r\n	<p>E-commerce Developer: E-commerce developers specialize in building websites and applications that facilitate online sales. This involves integrating payment gateways, managing product databases, and ensuring that the website is secure.</p>\r\n	</li>\r\n</ol>\r\n\r\n<p>These are just a few examples of the many different career paths within web development. Depending on your interests and skills, you may find that some of these paths are a better fit for you than others</p>\r\n', 1199, 0, 'web-development.jpg', '', 1, '2023-05-05 12:34:35');
INSERT INTO `courses` (`id`, `cat_id`, `title`, `slug`, `heading_1`, `heading_2`, `meta_descr`, `description`, `program_overview`, `objectives`, `curriculam`, `duration`, `career_paths`, `price`, `rating`, `image`, `video`, `status`, `created_at`) VALUES
(6, 4, 'Learn Java Course', 'learn-java-course', 'Learn Java Course', 'Java is popular among developers because of its simplicity, reliability, and security. It has a large and active community of developers who contribute to its development, libraries, and frameworks. Java is also used for developing web applications, mobile applications, desktop applications, and enterprise software.', '', '<p>Java is a high-level, object-oriented programming language that is widely used for developing applications and software across various platforms. It was first released in 1995 by Sun Microsystems and is now owned by Oracle Corporation. Java is designed to be platform-independent, meaning that applications written in Java can run on any system or device that has a Java Virtual Machine (JVM) installed, regardless of the underlying hardware and operating system.</p>\r\n\r\n<p>Java is popular among developers because of its simplicity, reliability, and security. It has a large and active community of developers who contribute to its development, libraries, and frameworks. Java is also used for developing web applications, mobile applications, desktop applications, and enterprise software.</p>\r\n\r\n<p>Java applications are typically compiled into bytecode, which is then executed by the JVM. The JVM interprets the bytecode and converts it into machine code that can be executed by the underlying hardware. Java also provides features such as automatic memory management, exception handling, and multithreading, which makes it easier for developers to write efficient and reliable code.</p>\r\n', '<p>Java is a popular programming language that was first introduced by Sun Microsystems in 1995. It is an object-oriented language that is designed to be platform-independent, meaning that it can be run on any operating system that has a Java Virtual Machine (JVM) installed.</p>\r\n\r\n<p>Java programs are compiled into bytecode, which can be executed on any platform that has a JVM installed. This makes Java a popular choice for developing cross-platform applications.</p>\r\n\r\n<p>The language is commonly used for building various types of applications such as web applications, mobile applications, desktop applications, and server-side applications. Some of the popular frameworks and libraries used in Java development include Spring, Hibernate, Struts, and Apache Tomcat.</p>\r\n\r\n<p>Java provides a rich set of features such as automatic memory management, strong type checking, exception handling, multithreading, and network programming, which makes it an efficient and reliable language for building complex applications.</p>\r\n\r\n<p>Overall, Java is a versatile and powerful programming language that is widely used in the software development industry due to its platform-independence, scalability, and ease of use.</p>\r\n', '<p>Java is a popular programming language used for developing a wide range of applications, from mobile apps to enterprise-level systems. Here are some of the main objectives of using Java:</p>\r\n\r\n<ol>\r\n	<li>\r\n	<p>Platform independence: One of the main advantages of Java is its ability to run on multiple platforms without any changes to the code. This is possible due to the Java Virtual Machine (JVM) that enables the same code to be executed on different platforms.</p>\r\n	</li>\r\n	<li>\r\n	<p>Object-oriented programming: Java is an object-oriented programming (OOP) language, which means it allows developers to create reusable code in the form of objects that can be easily maintained and modified.</p>\r\n	</li>\r\n	<li>\r\n	<p>Security: Java is designed to be secure, with built-in features such as automatic memory management and a robust security model that helps prevent unauthorized access to data and resources.</p>\r\n	</li>\r\n	<li>\r\n	<p>Performance: Java is designed to be fast and efficient, with features such as just-in-time compilation and bytecode optimization that help improve performance.</p>\r\n	</li>\r\n	<li>\r\n	<p>Large community and ecosystem: Java has a large and active developer community, with a wide range of libraries, frameworks, and tools available to help developers create high-quality applications.</p>\r\n	</li>\r\n	<li>\r\n	<p>Easy to learn and use: Java has a simple syntax and a rich set of built-in features that make it easy for developers to learn and use.</p>\r\n	</li>\r\n</ol>\r\n\r\n<p>Overall, the main objectives of using Java are to create robust, secure, and high-performance applications that can run on multiple platforms and be easily maintained and modified over time.</p>\r\n', '<p>A typical Java curriculum would cover the following topics:</p>\r\n\r\n<ol>\r\n	<li>\r\n	<p>Introduction to Java</p>\r\n\r\n	<ul>\r\n		<li>Overview of Java, history, features, and applications</li>\r\n		<li>Setting up the Java environment</li>\r\n		<li>Writing, compiling, and executing a simple Java program</li>\r\n		<li>Basic syntax and data types</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p>Object-Oriented Programming in Java</p>\r\n\r\n	<ul>\r\n		<li>Classes and objects</li>\r\n		<li>Inheritance, encapsulation, and polymorphism</li>\r\n		<li>Interfaces and abstract classes</li>\r\n		<li>Exception handling</li>\r\n		<li>Garbage collection and memory management</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p>Java Collections Framework</p>\r\n\r\n	<ul>\r\n		<li>Lists, sets, and maps</li>\r\n		<li>Iterators and comparators</li>\r\n		<li>Generics and type safety</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p>Java I/O</p>\r\n\r\n	<ul>\r\n		<li>Input/output streams</li>\r\n		<li>Serialization and deserialization</li>\r\n		<li>File handling</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p>Java Multithreading</p>\r\n\r\n	<ul>\r\n		<li>Creating and managing threads</li>\r\n		<li>Thread synchronization and communication</li>\r\n		<li>Thread pools and executors</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p>Java Network Programming</p>\r\n\r\n	<ul>\r\n		<li>Socket programming</li>\r\n		<li>TCP/IP and UDP protocols</li>\r\n		<li>HTTP and HTTPS protocols</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p>Java Database Connectivity (JDBC)</p>\r\n\r\n	<ul>\r\n		<li>Connecting to databases</li>\r\n		<li>Executing SQL queries</li>\r\n		<li>Handling transactions</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p>Java Server Pages (JSP) and Servlets</p>\r\n\r\n	<ul>\r\n		<li>Creating dynamic web pages</li>\r\n		<li>Handling HTTP requests and responses</li>\r\n		<li>Session management and authentication</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p>Java Enterprise Edition (Java EE)</p>\r\n\r\n	<ul>\r\n		<li>Overview of Java EE</li>\r\n		<li>Introduction to web services and RESTful services</li>\r\n		<li>Java Message Service (JMS)</li>\r\n		<li>Java Persistence API (JPA)</li>\r\n	</ul>\r\n	</li>\r\n	<li>\r\n	<p>Java Frameworks</p>\r\n\r\n	<ul>\r\n		<li>Spring Framework</li>\r\n		<li>Hibernate Framework</li>\r\n		<li>Struts Framework</li>\r\n		<li>JSF Framework</li>\r\n	</ul>\r\n	</li>\r\n</ol>\r\n', '24 Months', '<h3 style=\"color:#666666; font-style:normal\"><strong>The Java Developer Career Path</strong></h3>\r\n\r\n<p>The Java career path can be broken down into three steps: entry-level, mid-level, and senior-level. Job titles are generally going to be some form of&nbsp;<em>Java developer</em>, but you may also be referred to as&nbsp;<a href=\"https://www.coursereport.com/blog/software-engineering-job-description\">software engineers</a>&nbsp;or programmers.</p>\r\n\r\n<p><strong>ENTRY-LEVEL JAVA JOBS: JUNIOR JAVA DEVELOPER</strong></p>\r\n\r\n<p>Junior Java developer is the entry-level position that most people are qualified to hold after completing a degree or a coding bootcamp. While these roles require the least amount of experience, applicants are still expected to possess solid soft skills as well as being able to program and use&nbsp;<a href=\"https://www.coursereport.com/blog/what-is-java-programming-used-for\">Java</a>.</p>\r\n\r\n<p><strong>What does a Junior Java Developer do?</strong></p>\r\n\r\n<p>Entry-level jobs vary depending on the company or organization, but developers will be dealing with databases on the back end and how users are able to interact with an app or website on the front end. Typically, junior Java developers start&nbsp;<strong>working with both back end and front end</strong>&nbsp;by adjusting code. Most of the time, entry-level work is going to be improving or editing something that&rsquo;s already out there, but some entry-level Java developers may get to build something from scratch.&nbsp;</p>\r\n\r\n<p>Junior Java developers generally function as part of a team and they will have several responsibilities. An obvious responsibility is programming in Java, but there are others as well.&nbsp;<strong>It&rsquo;s important to have some database skills</strong>&nbsp;and to be able to write queries that access the data.</p>\r\n\r\n<p>Soft skills are also largely important for developers. Junior Java developers are likely to be&nbsp;<strong>interacting and working with customers</strong>, so they need to be able to converse with clients, explain technical issues in a non-technical way, and understand what the client wants to be able to translate those requests into technical terms for their code.</p>\r\n\r\n<p><strong>Entry-Level Java Developer Salaries</strong></p>\r\n\r\n<p><strong>The salary range for junior Java developers is typically between $40k-$90k</strong>. Remember that salaries are highly varied and can fluctuate based on factors like professional experience, personal background, educational experience, and geographical location.</p>\r\n\r\n<p><strong>MID-LEVEL JAVA JOBS: JAVA DEVELOPER</strong></p>\r\n\r\n<p>Mid-level Java developer roles generally don&rsquo;t have a special job title. They&rsquo;re generally going to be listed as something like developer, engineer, consultant, or analyst. For mid-level Java developer roles, employers look for developers with 3-5 years of experience in the field.</p>\r\n\r\n<p><strong>What does a Java developer do?</strong></p>\r\n\r\n<p>For the most part, mid-level Java developers can expect to have similar roles to junior Java developers.&nbsp;<strong>Employers will have higher expectations regarding their skills</strong>, and developers will have more responsibilities compared to junior-level developers.</p>\r\n\r\n<p><strong>Java Developer Salaries</strong></p>\r\n\r\n<p>Mid-level Java developers can expect to see a pay bump compared to entry-level positions.&nbsp;<strong>A typical salary range for mid-level Java developers is between $60k-$120k.</strong>&nbsp;Many salaries will depend on previous experience since mid-level jobs are generally reserved for individuals who have already worked in the field for some time. Geographical location is also an important factor.</p>\r\n\r\n<p><strong>SENIOR-LEVEL JAVA JOBS: SENIOR JAVA DEVELOPER</strong></p>\r\n\r\n<p>Employers looking for senior-level Java developers will generally make it clear they&rsquo;re looking for someone with experience in the job listing. These roles typically require between 5-10 years of experience. These senior-level roles are usually listed as senior Java software developer.&nbsp;</p>\r\n\r\n<p><strong>What does a Senior Java Developer do?</strong></p>\r\n\r\n<p>At this level, employers are looking for somebody that can come in to&nbsp;<strong>take charge of a team and lead a project</strong>. Instead of writing more code, these professionals are reviewing other&rsquo;s code. They may be doing some programming, but a lot of that is left to junior and mid-level developers. As the senior developer, they review their code. Writing an application involves a lot of testing and senior developers are the ones writing those tests.</p>\r\n\r\n<p><strong>Senior Java Developer Salaries</strong></p>\r\n\r\n<p>Senior-level Java developers can expect to be paid very well for their services, especially if they have a lot of experience. By the time someone gets to the senior level, they have generally been in the field for some time and they can afford to be a little more selective when looking for a job.&nbsp;<strong>A senior-level Java developer can expect to make between $150-$200k.</strong></p>\r\n', 1099, 0, 'image-blog-revel-top-java-tools.jpg', '', 1, '2023-05-05 12:46:44'),
(7, 5, 'History British', 'history-british', 'This is an excelent course, Students from ARTS must enroll it', 'ABCD ABCD EFG', '', '<p>sDilfilzsdihzgsuhzghrzh;h;dofhgob</p>\r\n\r\n<p>ldfob;oixgb;oi;obnoknb;onbcv</p>\r\n\r\n<p>lkbnbn;lnxobcvn</p>\r\n', '<p><strong>szdkblkjfbzflbjkbfzvkjbzfk</strong></p>\r\n\r\n<p>;lkznv;fnz;lnl;vnlznf;lnb;ln</p>\r\n\r\n<p>;lznov;oisefhopHEWFOPIHEFOSI</p>\r\n\r\n<p>LKZNONKZ;FN;NZV</p>\r\n', '<p>SLDNF;N;ZN;DLZN</p>\r\n\r\n<p>;LKZDSNF;NZ;LKFNV</p>\r\n\r\n<p>MZFM&#39;LMLZM</p>\r\n\r\n<p>LZNDN</p>\r\n\r\n<p>ZNDLFVN</p>\r\n\r\n<p>LNLN&#39;</p>\r\n', '<p>sdgG&#39;PRGJ&#39;PZJDP6+6+465465</p>\r\n\r\n<p>646484</p>\r\n', '3 Weeks', '<p>ZDFZZBFZ</p>\r\n', 1500, 0, 'download_(3).jpg', '', 1, '2023-05-16 00:02:47'),
(8, 6, 'General Awareness', 'general-awareness', 'Basic knowledge of comminication and interaction', 'How to communicate with other people beyond language boundaries', '', '<p>This course is a complement to the Introduction to Linguistics sequence. It can also be taken as an alternative to it by those students who are not majoring in Linguistics but are interested in learning something about language. It covers a selection from the following topics:</p>\r\n\r\n<ol>\r\n	<li>What is the position of spoken language in the usually multimodal forms of communication among humans?</li>\r\n	<li>In what ways does spoken language differ from signed language?</li>\r\n	<li>What features make spoken and signed language linguistic?</li>\r\n	<li>What features distinguish linguistic means of communication from animal communication?</li>\r\n	<li>How do humans communicate with animals?</li>\r\n	<li>From an evolutionary point of view, how can we account for the fact that spoken language is the dominant mode of communication in all human communities around the world?</li>\r\n	<li>Why cannot animals really communicate linguistically?</li>\r\n	<li>What do the terms language &quot;acquisition&quot; and &quot;transmission&quot; really mean?</li>\r\n	<li>What factors account for differences between language acquisition by children and by adults?</li>\r\n	<li>What does it mean to be a bilingual?</li>\r\n	<li>Are children really perfect language acquirers?</li>\r\n	<li>What factors bring about language evolution, including language loss and the emergence of new language varieties?</li>\r\n	<li>What is language contact and what are its manifestations?</li>\r\n	<li>This a general education course without any prerequisites.</li>\r\n</ol>\r\n', '<p>Grammar and Composition I</p>\r\n\r\n<p>Students learn the grammatical patterns and sentence construction used in academic writing and focus on improving sentence-level grammatical accuracy in the writing of coherent, well-developed paragraphs.</p>\r\n\r\n<p>Reading and Vocabulary</p>\r\n\r\n<p>Students develop vocabulary and reading strategies required to comprehend academic textbooks and literature in various fields of study.</p>\r\n\r\n<p>Grammar and Composition II</p>\r\n\r\n<p>Students learn how to write clear and well-developed multi-paragraph academic essays using various methods of organization through the process of planning, drafting, revising, editing and peer reviewing. Students also learn to work with sources. Grammatical structures relevant to the methods of organization are reviewed and practiced.</p>\r\n\r\n<p>Oral Communication</p>\r\n\r\n<p>This course emphasizes the development of fluency and intelligibility in spoken English. Through individual and group activities, students work on improving pronunciation, practicing conversation strategies and delivering oral presentations. Enrollment in ELSP_0400 is restricted to graduate students and scholars who have attained a satisfactory score on the TOEFL.</p>\r\n', '<p>Courses are graded as satisfactory or unsatisfactory. The course grades appear on students&rsquo; university transcripts as three-credit-hour courses. The credit hours do not count toward fulfilling graduation requirements for any degree programs. However, ELSP courses combined with an appropriate number of other MU courses satisfy full-time enrollment requirements for immigration purposes for students on an F-1 visa. For example, an undergraduate student who enrolls in one ELSP course must take at least nine credit hours of other university coursework; an undergraduate student who takes two ELSP courses must enroll in at least six additional credit hours.</p>\r\n', 'How do human languages (spoken and signed) differ from means of communication\r\nused by other animals?\r\n• “DESIGN FEATURES” of human languages\r\n• Innateness and (social) learning – “copying” and the spread of cultural\r\nphenomena\r\n• PATTERNS vs RULES vs ANALOGIES\r\n• What language “ACQUISITION” and “TRANSMISSION” really mean\r\n• Structural complexity of spoken languages – the significance of modularity\r\n• Speaker-INDEXICALITY – language and identity (race/ethnicity, socio-economic\r\nclass, gender, age group, education, professional affiliation, etc.)\r\nSpoken vs signed languages\r\n• Signed language vs gesture\r\n• How the medium constrains structure – the question of linearity\r\n• Contact of spoken and signed languages\r\n• Is there really a PHONOLOGY of signed language?\r\nThe origins of human language(s)\r\n• Gradualism vs punctuated equilibrium\r\n• Why the evolution of language is likely to have been gradual\r\n• Why it can be claimed that modern languages are not the end of the process yet\r\n• Why are there more spoken than signed languages? Why are there more people\r\nspeaking than signing? – non-structural, “ecological” aspects of language\r\nevolution\r\n• Why are there so many different languages in the world? (Preliminary\r\nconsiderations)\r\nHumans vs other animals (again)\r\n• Can humans learn to communicate with animals in the latter’s means of\r\ncommunication?\r\n• Can animals be taught to communicate with humans in spoken or signed\r\nlanguage?\r\n• Cross-species communication barriers\r\nWhy do human languages differ structurally, despite their architectural\r\nsimilarities? Trying to make sense of typology.\r\n• The significance of variation in populations – a population genetics perspective\r\n• The effects of population dispersals on variation\r\n• Variational vs transformational evolution\r\n• Implications for the proto-language – Was there ever a proto-language for\r\nmankind? (The Nostratic vs the Out-of-Africa hypotheses!)\r\nLanguage change/evolution\r\n• How do languages change/evolve?\r\n• Why do languages change/evolve?\r\n• Variation and the “ACTUATION QUESTION” (Why it need not be considered a\r\n“PROBLEM”?)\r\n• The ecology of language evolution\r\n• Language genetic families: what do they reflect?\r\n• Genetic vs typological classifications of languages\r\n• Typological heterogeneities within languages and language families\r\nThe coexistence of languages\r\n• Societal vs individual multilingualism\r\n• Societal multilingualism and language competition\r\n• Ecological factors leading to language endangerment and loss\r\n• Globalization vs glocalization – the real causes of language endangerment and\r\nloss (the significance of ‘POPULATION STRUCTURE’)\r\nLanguage and communicative media\r\n• Writing systems – The variation that matters or does not matter\r\n• The impact of writing on communication\r\n• The impact of other media on communication\r\n• Can animals benefit from communication technology?\r\nOther forms of communication\r\n• Traffic signs\r\n• Professional sign conventions\r\n• How NORMS/conventions arise (Norms and NORMALIZATION)\r\n• PATTERN EMERGENCE – “rule-governed” phenomena – SYSTEMS ', '6 months', '<p>The world is your playfields if you know who you are not!</p>\r\n', 500, 0, 'VideoCall.jpg', '', 1, '2023-05-25 09:44:54');

-- --------------------------------------------------------

--
-- Table structure for table `course_enrollment`
--

CREATE TABLE `course_enrollment` (
  `enrollment_id` bigint(20) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `enrollment_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `enrollment_price` double DEFAULT NULL,
  `price_cents` double DEFAULT NULL,
  `currency` varchar(100) DEFAULT NULL,
  `currency_symbol` varchar(100) DEFAULT NULL,
  `payment_status` varchar(255) DEFAULT NULL,
  `transaction_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course_enrollment`
--

INSERT INTO `course_enrollment` (`enrollment_id`, `course_id`, `user_id`, `order_id`, `enrollment_date`, `enrollment_price`, `price_cents`, `currency`, `currency_symbol`, `payment_status`, `transaction_id`) VALUES
(1, 1, 1, 2240, '2023-05-04 17:37:45', 29, 2900, 'USD', '$', 'COMPLETED', 'DxeRr8WFnZlhJ0upJWHKVAkd7EPZY'),
(2, 2, 1, 8551, '2023-05-04 17:44:49', 39, 3900, 'USD', '$', 'COMPLETED', 'R8qsKyZjz5sFaQua9O1Xu9uUJ7EZY'),
(3, 1, 2, 4823, '2023-05-04 17:52:00', 29, 2900, 'USD', '$', 'COMPLETED', 'heNVFIHUm91wfV1CsEyeWdgS0RdZY'),
(4, 6, 1, 3834, '2023-05-05 18:34:34', 1099, 109900, 'USD', '$', 'COMPLETED', '52b55ccasfRhQapzO79i9MaKtx7YY'),
(5, 8, 1, 7737, '2023-05-25 18:01:37', 500, 50000, 'USD', '$', 'COMPLETED', 'tUZ9MWwpfrY8KZBUtNY7jNOlC3LZY');

-- --------------------------------------------------------

--
-- Table structure for table `course_enrollment_status`
--

CREATE TABLE `course_enrollment_status` (
  `id` bigint(20) NOT NULL,
  `enrollment_id` int(11) DEFAULT NULL,
  `course_id` int(11) DEFAULT NULL,
  `module` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `material_id` int(11) DEFAULT NULL,
  `material_type` varchar(100) DEFAULT NULL,
  `completed_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course_enrollment_status`
--

INSERT INTO `course_enrollment_status` (`id`, `enrollment_id`, `course_id`, `module`, `user_id`, `material_id`, `material_type`, `completed_date`) VALUES
(1, 1, 1, 1, 1, 1, 'video', '2023-05-04 17:42:19'),
(2, 1, 1, 2, 1, 2, 'resource', '2023-05-04 17:42:40'),
(3, 1, 1, 3, 1, 3, 'quiz', '2023-05-04 17:43:00'),
(4, 1, 1, 4, 1, 4, 'video', '2023-05-04 17:43:15'),
(5, 1, 1, 5, 1, 5, 'quiz', '2023-05-04 17:43:36'),
(6, 1, 1, 6, 1, 6, 'video', '2023-05-04 17:43:44'),
(7, 4, 6, 17, 1, 16, 'resource', '2023-05-05 18:35:34'),
(8, 2, 2, 7, 1, 7, 'video', '2023-05-22 18:46:46'),
(9, 2, 2, 8, 1, 8, 'resource', '2023-05-22 18:46:54');

-- --------------------------------------------------------

--
-- Table structure for table `course_materials`
--

CREATE TABLE `course_materials` (
  `id` int(11) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `module` bigint(20) DEFAULT NULL,
  `material_type` varchar(100) DEFAULT NULL,
  `video_type` varchar(100) DEFAULT NULL,
  `video_url` text,
  `video_file` varchar(255) DEFAULT NULL,
  `material_description` longtext,
  `status` int(11) DEFAULT NULL,
  `position_order` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `course_materials`
--

INSERT INTO `course_materials` (`id`, `course_id`, `module`, `material_type`, `video_type`, `video_url`, `video_file`, `material_description`, `status`, `position_order`, `created_at`) VALUES
(1, 1, 1, 'video', 'video', '', 'f16d84904bcaa06b17aa97139a056e67.mp4', '', 1, 1, '2023-05-04 12:05:22'),
(2, 1, 2, 'resource', '', '', NULL, '&lt;p&gt;Learnbay offers live, interactive online sessions with professionals from top MNCs. Our artificial intelligence course feature practical training with real-time projects and case studies.&lt;/p&gt;', 1, 2, '2023-05-04 12:06:20'),
(3, 1, 3, 'quiz', '', '', NULL, '', 1, 3, '2023-05-04 12:12:18'),
(4, 1, 4, 'video', 'video', '', 'a9e75420bf6573f32ad139022382aa4d.mp4', '', 1, 4, '2023-05-04 12:13:04'),
(5, 1, 5, 'quiz', '', '', NULL, '', 1, 5, '2023-05-04 12:14:40'),
(6, 1, 6, 'video', 'video', '', '5d757ed524af8a6f2a8daf7eef3f472f.mp4', '', 1, 6, '2023-05-04 12:54:35'),
(7, 2, 7, 'video', 'video', '', 'f16d84904bcaa06b17aa97139a056e67.mp4', '', 1, 1, '2023-05-04 12:05:22'),
(8, 2, 8, 'resource', '', '', NULL, '&lt;p&gt;Learnbay offers live, interactive online sessions with professionals from top MNCs. Our artificial intelligence course feature practical training with real-time projects and case studies.&lt;/p&gt;', 1, 2, '2023-05-04 12:06:20'),
(9, 2, 9, 'quiz', '', '', NULL, '', 1, 3, '2023-05-04 12:12:18'),
(10, 2, 10, 'video', 'video', '', 'a9e75420bf6573f32ad139022382aa4d.mp4', '', 1, 4, '2023-05-04 12:13:04'),
(11, 2, 11, 'quiz', '', '', NULL, '', 1, 5, '2023-05-04 12:14:40'),
(12, 2, 12, 'video', 'video', '', '5d757ed524af8a6f2a8daf7eef3f472f.mp4', '', 1, 6, '2023-05-04 12:54:35'),
(13, 3, 13, 'resource', '', '', NULL, '', 1, 13, '2023-05-05 05:21:01'),
(14, 4, 15, 'resource', '', '', NULL, '&lt;p&gt;&lt;span dir=&quot;ltr&quot;&gt;A data structure is a specialized&lt;/span&gt;&lt;span dir=&quot;ltr&quot;&gt; &lt;/span&gt;&lt;span dir=&quot;ltr&quot;&gt;format&lt;/span&gt;&lt;span dir=&quot;ltr&quot;&gt; &lt;/span&gt;&lt;span dir=&quot;ltr&quot;&gt;for organizing and storing&lt;/span&gt;&lt;span dir=&quot;ltr&quot;&gt; &lt;/span&gt;&lt;span dir=&quot;ltr&quot;&gt;data&lt;/span&gt;&lt;span dir=&quot;ltr&quot;&gt;. General data&lt;/span&gt;&lt;br /&gt;\r\n&lt;span dir=&quot;ltr&quot;&gt;structure types include the&lt;/span&gt;&lt;span dir=&quot;ltr&quot;&gt; &lt;/span&gt;&lt;span dir=&quot;ltr&quot;&gt;array&lt;/span&gt;&lt;span dir=&quot;ltr&quot;&gt;, the&lt;/span&gt;&lt;span dir=&quot;ltr&quot;&gt; &lt;/span&gt;&lt;span dir=&quot;ltr&quot;&gt;file&lt;/span&gt;&lt;span dir=&quot;ltr&quot;&gt;, the&lt;/span&gt;&lt;span dir=&quot;ltr&quot;&gt; &lt;/span&gt;&lt;span dir=&quot;ltr&quot;&gt;record&lt;/span&gt;&lt;span dir=&quot;ltr&quot;&gt;, the&lt;/span&gt;&lt;span dir=&quot;ltr&quot;&gt; &lt;/span&gt;&lt;span dir=&quot;ltr&quot;&gt;table&lt;/span&gt;&lt;span dir=&quot;ltr&quot;&gt;, the tree, and so on. Any&lt;/span&gt;&lt;br /&gt;\r\n&lt;span dir=&quot;ltr&quot;&gt;data structure is designed to organize data to suit a specifi&lt;/span&gt;&lt;span dir=&quot;ltr&quot;&gt;c purpose so that it can be&lt;/span&gt;&lt;br /&gt;\r\n&lt;span dir=&quot;ltr&quot;&gt;accessed and worked with in appropriate ways. In computer programming, a data&lt;/span&gt;&lt;br /&gt;\r\n&lt;span dir=&quot;ltr&quot;&gt;structure may be selected or designed to store data for the purpose of working on it&lt;/span&gt;&lt;br /&gt;\r\n&lt;span dir=&quot;ltr&quot;&gt;with various&lt;/span&gt;&lt;span dir=&quot;ltr&quot;&gt; &lt;/span&gt;&lt;span dir=&quot;ltr&quot;&gt;algorithms&lt;/span&gt;&lt;/p&gt;', 1, 14, '2023-05-05 05:45:36'),
(15, 5, 16, 'resource', '', '', NULL, '', 1, 15, '2023-05-05 06:09:29'),
(16, 6, 17, 'resource', '', '', NULL, '&lt;p&gt;Java is popular among developers because of its simplicity, reliability, and security. It has a large and active community of developers who contribute to its development, libraries, and frameworks. Java is also used for developing web applications, mobile applications, desktop applications, and enterprise software.&lt;/p&gt;', 1, 16, '2023-05-05 06:33:18'),
(17, 7, 18, 'resource', 'video', '', NULL, '&lt;p&gt;sdGzfxfgngfxnfgxnfnfgfg&lt;/p&gt;', 1, 17, '2023-05-16 05:35:44'),
(18, 7, 18, 'quiz', '', '', NULL, '', 1, 18, '2023-05-16 05:49:12'),
(19, 8, 20, 'video', 'youtube', 'https://www.youtube.com/watch?v=twqysVcDFqI', NULL, '', 1, 19, '2023-05-25 03:17:08'),
(20, 8, 20, 'video', 'youtube', 'https://www.youtube.com/watch?v=kJyRVdnRwZA', NULL, '', 1, 20, '2023-05-25 03:17:30'),
(21, 8, 21, 'resource', '', '', NULL, 'How do human languages (spoken and signed) differ from means of communication\r\nused by other animals?\r\n• “DESIGN FEATURES” of human languages\r\n• Innateness and (social) learning – “copying” and the spread of cultural\r\nphenomena\r\n• PATTERNS vs RULES vs ANALOGIES\r\n• What language “ACQUISITION” and “TRANSMISSION” really mean\r\n• Structural complexity of spoken languages – the significance of modularity\r\n• Speaker-INDEXICALITY – language and identity (race/ethnicity, socio-economic\r\nclass, gender, age group, education, professional affiliation, etc.)', 1, 21, '2023-05-25 03:18:31'),
(22, 8, 22, 'quiz', '', '', NULL, '', 1, 22, '2023-05-25 03:20:10'),
(23, 7, 19, 'quiz', '', '', NULL, '', 1, 23, '2023-05-25 06:10:42');

-- --------------------------------------------------------

--
-- Table structure for table `course_modules`
--

CREATE TABLE `course_modules` (
  `id` bigint(20) NOT NULL,
  `course_id` int(11) NOT NULL,
  `position_order` int(11) DEFAULT NULL,
  `name` varchar(350) NOT NULL,
  `module_image` varchar(255) DEFAULT NULL,
  `module_descriptions` longtext,
  `status` int(11) NOT NULL,
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `course_modules`
--

INSERT INTO `course_modules` (`id`, `course_id`, `position_order`, `name`, `module_image`, `module_descriptions`, `status`, `created_at`) VALUES
(1, 1, 1, 'Preparatory Classes', '2d10dfca2694f71091f6fb9c614ffe2d.jpg', '<p>Learnbay offers live, interactive online sessions with professionals from top MNCs. Our artificial intelligence course feature practical training with real-time projects and case studies.</p>\r\n', 1, '2023-05-04'),
(2, 1, 2, 'Python for Data Science', '5fcffd07f07440f9e163bb1ee226aa77.jpg', '<p>Learnbay offers live, interactive online sessions with professionals from top MNCs. Our artificial intelligence course feature practical training with real-time projects and case studies.</p>\r\n', 1, '2023-05-04'),
(3, 1, 3, 'Statistics and Machine Learning', 'c330c8366ed958b789001f2cb63eb883.jpg', '<p>Learnbay offers live, interactive online sessions with professionals from top MNCs. Our artificial intelligence course feature practical training with real-time projects and case studies.</p>\r\n', 1, '2023-05-04'),
(4, 1, 4, 'Data Science Course Tools', '88ab368b5ca305e8e8a988aad29a218f.jpg', '<p>Learnbay offers live, interactive online sessions with professionals from top MNCs. Our artificial intelligence course feature practical training with real-time projects and case studies.</p>\r\n', 1, '2023-05-04'),
(5, 1, 5, 'Artificial Intelligence Tools', '74e765897dc05506d9c684877e8d4de3.jpg', '<p>Learnbay offers live, interactive online sessions with professionals from top MNCs. Our artificial intelligence course feature practical training with real-time projects and case studies.</p>\r\n', 1, '2023-05-04'),
(6, 1, 6, 'Demo Courses', '56f7ad5824f1d1c300982a5040ade7c2.jpg', '<p>Learnbay offers live, interactive online sessions with professionals from top MNCs. Our artificial intelligence course feature practical training with real-time projects and case studies.</p>\r\n', 1, '2023-05-04'),
(7, 2, 1, 'Preparatory Classes', '2d10dfca2694f71091f6fb9c614ffe2d.jpg', '<p>Learnbay offers live, interactive online sessions with professionals from top MNCs. Our artificial intelligence course feature practical training with real-time projects and case studies.</p>\r\n', 1, '2023-05-04'),
(8, 2, 2, 'Python for Data Science', '5fcffd07f07440f9e163bb1ee226aa77.jpg', '<p>Learnbay offers live, interactive online sessions with professionals from top MNCs. Our artificial intelligence course feature practical training with real-time projects and case studies.</p>\r\n', 1, '2023-05-04'),
(9, 2, 3, 'Statistics and Machine Learning', 'c330c8366ed958b789001f2cb63eb883.jpg', '<p>Learnbay offers live, interactive online sessions with professionals from top MNCs. Our artificial intelligence course feature practical training with real-time projects and case studies.</p>\r\n', 1, '2023-05-04'),
(10, 2, 4, 'Data Science Course Tools', '88ab368b5ca305e8e8a988aad29a218f.jpg', '<p>Learnbay offers live, interactive online sessions with professionals from top MNCs. Our artificial intelligence course feature practical training with real-time projects and case studies.</p>\r\n', 1, '2023-05-04'),
(11, 2, 5, 'Artificial Intelligence Tools', '74e765897dc05506d9c684877e8d4de3.jpg', '<p>Learnbay offers live, interactive online sessions with professionals from top MNCs. Our artificial intelligence course feature practical training with real-time projects and case studies.</p>\r\n', 1, '2023-05-04'),
(12, 2, 6, 'Demo Courses', '56f7ad5824f1d1c300982a5040ade7c2.jpg', '<p>Learnbay offers live, interactive online sessions with professionals from top MNCs. Our artificial intelligence course feature practical training with real-time projects and case studies.</p>\r\n', 1, '2023-05-04'),
(13, 3, 13, 'Getting Started', '235dabef3362324752157db83a4f2496.jpg', '<p><span dir=\"ltr\">The usefulness of computers is partly a result of their versatility in solving various problems and performing tasks. To</span><br />\r\n<span dir=\"ltr\">be able to take advantage of the speed and power of computers, one needs to know how to program. This module is</span><br />\r\n<span dir=\"ltr\">about computer programming and how it can be used to solve problems or perform useful tasks.</span><br />\r\n<span dir=\"ltr\">Our language of choice is Python &ndash; a recent language which has been found to be powerful, relatively easy to learn,</span><br />\r\n<span dir=\"ltr\">and able to provide a platform to advanced programming. In this module you will learn how to analyse a problem and</span><br />\r\n<span dir=\"ltr\">develop an effective solution for it using the Python programming language.</span></p>\r\n', 1, '2023-05-05'),
(15, 4, 15, 'MODULE 1', '1c0a4b9c0a485f3ab8b6601fade0ae8e.png', '<p><span dir=\"ltr\">A data structure is a specialized</span><span dir=\"ltr\"> </span><span dir=\"ltr\">format</span><span dir=\"ltr\"> </span><span dir=\"ltr\">for organizing and storing</span><span dir=\"ltr\"> </span><span dir=\"ltr\">data</span><span dir=\"ltr\">. General data</span><br />\r\n<span dir=\"ltr\">structure types include the</span><span dir=\"ltr\"> </span><span dir=\"ltr\">array</span><span dir=\"ltr\">, the</span><span dir=\"ltr\"> </span><span dir=\"ltr\">file</span><span dir=\"ltr\">, the</span><span dir=\"ltr\"> </span><span dir=\"ltr\">record</span><span dir=\"ltr\">, the</span><span dir=\"ltr\"> </span><span dir=\"ltr\">table</span><span dir=\"ltr\">, the tree, and so on. Any</span><br />\r\n<span dir=\"ltr\">data structure is designed to organize data to suit a specifi</span><span dir=\"ltr\">c purpose so that it can be</span><br />\r\n<span dir=\"ltr\">accessed and worked with in appropriate ways. In computer programming, a data</span><br />\r\n<span dir=\"ltr\">structure may be selected or designed to store data for the purpose of working on it</span><br />\r\n<span dir=\"ltr\">with various</span><span dir=\"ltr\"> </span><span dir=\"ltr\">algorithms</span></p>\r\n', 1, '2023-05-05'),
(16, 5, 16, 'MODULE 1', 'a132038c4f1c97c6a217f12bf7d51527.png', '<p>The results of the study of module student must:</p>\r\n\r\n<ol>\r\n	<li>To understand the architecture of web applications and how they work</li>\r\n	<li>Understand the purpose and ways of organizing the infrastructure of a web project</li>\r\n	<li>To understand the principle of interaction between client and server based on HTTP Protocol, know the format of HTTP requests and HTTP responses</li>\r\n	<li>To understand the principle of operation of web servers and methods of forming the content sent to the client</li>\r\n	<li>Know the basic technologies used on the client</li>\r\n	<li>Know the varieties of modern web applications</li>\r\n	<li>To understand the differences between multipage and single-page web applications (SPA and MPA)</li>\r\n	<li>To understand the principle of organizing a web application based on REST API</li>\r\n	<li>To be able to use tools for testing and debugging communication between web client and web server: the Chrome Developer Tools, Postman, Fiddler</li>\r\n	<li>To have an idea about organizing applications on the basis of microservices architecture</li>\r\n</ol>\r\n', 1, '2023-05-05'),
(17, 6, 17, 'Full Course', '8cdc9282a0dcb78f927b391fc7eeb43c.png', '<p>Java is popular among developers because of its simplicity, reliability, and security. It has a large and active community of developers who contribute to its development, libraries, and frameworks. Java is also used for developing web applications, mobile applications, desktop applications, and enterprise software.</p>\r\n', 1, '2023-05-05'),
(18, 7, 18, 'History Syllabus 1', NULL, '<p>sdDSdsDVzbzbf</p>\r\n', 1, '2023-05-16'),
(19, 7, 19, 'History Chapter 2 and Final', NULL, '<p>DSvzbzfrzdbb</p>\r\n', 1, '2023-05-16'),
(20, 8, 20, 'Chapter 1', 'ef6e778d9ef7ee65040e02002708acfa.jpg', '<p>This course emphasizes the development of fluency and intelligibility in spoken English. Through individual and group activities, students work on improving pronunciation, practicing conversation strategies and delivering oral presentations. Enrollment in ELSP_0400 is restricted to graduate students and scholars who have attained a satisfactory score on the TOEFL.</p>\r\n', 1, '2023-05-25'),
(21, 8, 21, 'Chapter 2', '55edbf792667210e0d676013729e1563.png', '<p>Students learn how to write clear and well-developed multi-paragraph academic essays using various methods of organization through the process of planning, drafting, revising, editing and peer reviewing. Students also learn to work with sources. Grammatical structures relevant to the methods of organization are reviewed and practiced.</p>\r\n', 1, '2023-05-25'),
(22, 8, 22, 'Chapter 3', '8f2f70e0390936a5d71c6cd031699d7b.jpg', '<p>Students develop vocabulary and reading strategies required to comprehend academic textbooks and literature in various fields of study.</p>\r\n', 1, '2023-05-25');

-- --------------------------------------------------------

--
-- Table structure for table `course_quiz`
--

CREATE TABLE `course_quiz` (
  `id` bigint(20) NOT NULL,
  `course_id` int(11) NOT NULL,
  `material_id` bigint(20) DEFAULT NULL,
  `question` text,
  `ans1` varchar(800) NOT NULL,
  `ans2` varchar(800) NOT NULL,
  `ans3` varchar(800) NOT NULL,
  `ans4` varchar(800) NOT NULL,
  `correct_answer` varchar(255) DEFAULT NULL,
  `quiz_file` text,
  `ans1_file` text,
  `ans2_file` text,
  `ans3_file` text,
  `ans4_file` text,
  `status` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `course_quiz`
--

INSERT INTO `course_quiz` (`id`, `course_id`, `material_id`, `question`, `ans1`, `ans2`, `ans3`, `ans4`, `correct_answer`, `quiz_file`, `ans1_file`, `ans2_file`, `ans3_file`, `ans4_file`, `status`, `created_at`) VALUES
(1, 1, 3, 'Which of the below is not supervised learning?', 'Spam email identification', 'House price prediction', 'Speech recognition', 'Amazon product suggestions', 'ans1', NULL, NULL, NULL, NULL, NULL, 1, '2023-05-04 12:12:18'),
(2, 1, 3, 'Which of the below is not unsupervised learning?', 'Anomaly detection', 'Object recognition', 'Customer segmentation', 'Clustering', 'ans2', NULL, NULL, NULL, NULL, NULL, 1, '2023-05-04 12:12:18'),
(3, 1, 3, 'Select the true statements', 'Machine learning takes input data and static rules to predict the output value', 'Traditional programming uses static rules to process input data to produce output', 'Traditional programming analyzes input data and comes up with rules and output data', 'Machine learning uses knowledge about input data and expected output to learn the rules for modelling data relationships', 'ans3', NULL, NULL, NULL, NULL, NULL, 1, '2023-05-04 12:12:18'),
(4, 1, 3, 'Select approaches for scaling data', 'Standardization', 'Noise removal', 'Normalization', 'Data encoding', 'ans4', NULL, NULL, NULL, NULL, NULL, 1, '2023-05-04 12:12:18'),
(5, 1, 3, 'Let’s say we have an image of size 45x55. It is a grayscale image. How many pixels do we need to represent this image in a numerical format?', '2240', '2420', '2152', '2340', 'ans1', NULL, NULL, NULL, NULL, NULL, 1, '2023-05-04 12:12:18'),
(6, 1, 5, 'What is the relationship between model and algorithm?', 'Algorithm + model = data', 'Algorithm = Model + data', 'Model = Algorithm(data)', 'Data = Algorithm(model)', 'ans1', NULL, NULL, NULL, NULL, NULL, 1, '2023-05-04 12:14:40'),
(7, 1, 5, 'Identify parametric machine learning algorithms', 'Linear regression', 'CNN', 'Logistic regression', 'Naïve Bayes', 'ans2', NULL, NULL, NULL, NULL, NULL, 1, '2023-05-04 12:14:40'),
(13, 2, 11, 'What is the relationship between model and algorithm?', 'Algorithm + model = data', 'Algorithm = Model + data', 'Model = Algorithm(data)', 'Data = Algorithm(model)', 'ans1', NULL, NULL, NULL, NULL, NULL, 1, '2023-05-04 12:14:40'),
(14, 2, 11, 'Identify parametric machine learning algorithms', 'Linear regression', 'CNN', 'Logistic regression', 'Naïve Bayes', 'ans2', NULL, NULL, NULL, NULL, NULL, 1, '2023-05-04 12:14:40'),
(15, 7, 18, 'Who invented Gravity Law', 'Newton', 'Edison', 'Ramanujam', 'Gallileo', 'ans1', NULL, NULL, NULL, NULL, NULL, 1, '2023-05-16 05:49:12'),
(16, 7, 18, 'Who invented Telephone', 'Einstein ', 'giiubkbf', 'Graham Bell', 'SDSDF', 'ans1', NULL, NULL, NULL, NULL, NULL, 1, '2023-05-16 05:49:12'),
(17, 8, 22, 'Spoken vs signed languages ', 'Signed language vs gesture ', 'How the medium constrains structure – the question of linearity ', 'Contact of spoken and signed languages ', 'Is there really a PHONOLOGY of signed language? ', 'ans4', '700.343.png', 'Flexible.jpg', 'TermsConditions_-_Copy_-_Copy.jpg', 'Ad_Banner.jpg', '720.405.jpg', 1, '2023-05-25 03:20:10'),
(20, 7, 23, 'Test Qs', 'test option 1', 'test option 2', 'test option 3', 'test option 4', 'ans1', '', 'about_(1)9.jpg', '', '', 'banner-bg15.jpg', 1, '2023-05-25 06:11:44'),
(21, 7, 23, 'Test Qs2', 'test option 11', 'test option 122', 'test option 13', 'test option 14', 'ans1', 'about_(1)2.jpg', '', 'about_(1)10.jpg', '', 'banner-bg16.jpg', 1, '2023-05-25 06:11:44'),
(22, 2, 9, 'Which of the below is not supervised learning?', 'Spam email identification', 'House price prediction', 'Speech recognition', 'Amazon product suggestions', 'ans1', '', 'banner-bg17.jpg', '', 'about_(1)11.jpg', '', 1, '2023-05-25 06:14:42'),
(23, 2, 9, 'Which of the below is not unsupervised learning?', 'Anomaly detection', 'Object recognition', 'Customer segmentation', 'Clustering', 'ans2', '', '', '', '', '', 1, '2023-05-25 06:14:42'),
(24, 2, 9, 'Select the true statements', 'Machine learning takes input data and static rules to predict the output value', 'Traditional programming uses static rules to process input data to produce output', 'Traditional programming analyzes input data and comes up with rules and output data', 'Machine learning uses knowledge about input data and expected output to learn the rules for modelling data relationships', 'ans3', '', '', '', '', '', 1, '2023-05-25 06:14:42'),
(25, 2, 9, 'Select approaches for scaling data', 'Standardization', 'Noise removal', 'Normalization', 'Data encoding', 'ans4', '', '', '', '', '', 1, '2023-05-25 06:14:42'),
(26, 2, 9, 'Let’s say we have an image of size 45x55. It is a grayscale image. How many pixels do we need to represent this image in a numerical format?', '2240', '2420', '2152', '2340', 'ans1', '', '', '', '', '', 1, '2023-05-25 06:14:42');

-- --------------------------------------------------------

--
-- Table structure for table `course_resources`
--

CREATE TABLE `course_resources` (
  `id` bigint(20) NOT NULL,
  `course_id` int(11) NOT NULL,
  `material_id` bigint(20) DEFAULT NULL,
  `resource_file` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `course_resources`
--

INSERT INTO `course_resources` (`id`, `course_id`, `material_id`, `resource_file`, `status`, `created_at`) VALUES
(1, 1, 2, '2612_4608_Dxampphtdocsdollar-discount_uploads_users_25-10-2021_orderid_6497.pdf', 1, '2023-05-04 12:06:20'),
(2, 2, 8, '2612_4608_Dxampphtdocsdollar-discount_uploads_users_25-10-2021_orderid_6497.pdf', 1, '2023-05-04 12:06:20'),
(3, 3, 13, 'Python_3_-_python3_tutorial.pdf', 1, '2023-05-05 05:21:01'),
(4, 4, 14, 'introduction.pdf', 1, '2023-05-05 05:45:36'),
(5, 5, 15, 'webprog_top.pdf', 1, '2023-05-05 06:09:29'),
(6, 6, 16, 'java_tutorial.pdf', 1, '2023-05-05 06:33:18'),
(7, 7, 17, 'Expired_Scripts.pdf', 1, '2023-05-16 05:35:44'),
(8, 8, 21, 'Activate_Google_Location_API.pdf', 1, '2023-05-25 03:18:31');

-- --------------------------------------------------------

--
-- Table structure for table `course_reviews`
--

CREATE TABLE `course_reviews` (
  `review_id` bigint(20) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `rating` float DEFAULT NULL,
  `review_message` text,
  `review_status` varchar(255) DEFAULT NULL,
  `review_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `course_reviews`
--

INSERT INTO `course_reviews` (`review_id`, `course_id`, `user_id`, `rating`, `review_message`, `review_status`, `review_date`) VALUES
(1, 2, 1, 3.5, 'No comment', '1', '2023-05-04 17:48:24'),
(2, 1, 1, 4, 'No comments', '1', '2023-05-04 17:48:48'),
(3, 5, 1, NULL, 'This is demo comment for java tutorial', '1', '2023-05-05 18:36:15'),
(4, 4, 1, 4.5, 'Great Course to Learn in', '1', '2023-05-16 05:12:05');

-- --------------------------------------------------------

--
-- Table structure for table `cr_category`
--

CREATE TABLE `cr_category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(300) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `cr_category`
--

INSERT INTO `cr_category` (`id`, `name`, `slug`, `status`) VALUES
(1, 'Artificial Intelligence', 'artificial-intelligence', 1),
(2, 'Python', 'python', 1),
(3, 'Data Structure', 'data-structure', 1),
(4, 'Web Development', 'web-development', 1),
(5, 'History', 'history', 1),
(6, 'Humanities', 'humanities', 1);

-- --------------------------------------------------------

--
-- Table structure for table `email_unsubscribe_list`
--

CREATE TABLE `email_unsubscribe_list` (
  `id` int(11) NOT NULL,
  `email_id` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `status` int(11) DEFAULT '0' COMMENT '1 for subscribe and 0 for unsubscribe'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `email_unsubscribe_list`
--

INSERT INTO `email_unsubscribe_list` (`id`, `email_id`, `created_at`, `status`) VALUES
(1, 'goutampaul@goigi.in', '2023-05-24 19:43:38', 0),
(2, 'gp@gmail.com', '2023-05-25 06:03:53', 0);

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `gallery_photos`
--

CREATE TABLE `gallery_photos` (
  `id` int(11) NOT NULL,
  `gallery_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `homecourse`
--

CREATE TABLE `homecourse` (
  `id` int(11) NOT NULL,
  `heading` longtext NOT NULL,
  `sub_heading` longtext NOT NULL,
  `course_icon` longtext NOT NULL,
  `course_url` longtext NOT NULL,
  `status` enum('1','2') NOT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `homecourse`
--

INSERT INTO `homecourse` (`id`, `heading`, `sub_heading`, `course_icon`, `course_url`, `status`, `created_at`) VALUES
(2, 'Creativity Concepts', 'Recreate the Universe!', 'professor-svgrepo-com1.png', 'https://dev.igiapp.com/concepttocreation/course-detail/4', '1', '2023-05-04 16:42:01'),
(3, 'Digitalization', 'Automation concepts and more!', 'Icon11.png', 'https://dev.igiapp.com/concepttocreation/course-detail/1', '1', '2023-05-04 16:44:09'),
(4, 'Augmented Reality', 'Challenge the Creator!', 'a1.png', 'https://dev.igiapp.com/concepttocreation/course-detail/2', '1', '2023-05-16 05:23:03');

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(64) NOT NULL DEFAULT '',
  `option_value` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`option_id`, `option_name`, `option_value`) VALUES
(1, 'logo', 'logo.png'),
(2, 'meta_title', NULL),
(6, 'twitter', 'https://www.twitter.com/'),
(7, 'facebook', 'https://www.facebook.com/'),
(8, 'google_plus', 'javascript:void(0);'),
(9, 'linkdin', 'javascript:void(0);'),
(11, 'address', '215 Palm Street, Orlando, FL 2721, USA'),
(12, 'phone', '(+01) 987-654-321'),
(13, 'email', 'support@concept2creation.com'),
(14, 'web', 'https://qramerca.com'),
(15, 'hc', ''),
(16, 'aws', ''),
(17, 'aw', ''),
(18, 'oy', '27 years in Arlington, Texas'),
(19, 'course_price', NULL),
(20, 'pint', NULL),
(21, 'linked', 'https://www.linkedin.com/'),
(22, 'lt', 'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.'),
(23, 'insta', 'https://www.instagram.com/'),
(24, 'l1', NULL),
(25, 'l2', NULL),
(26, 'l3', NULL),
(27, 'l4', NULL),
(28, 'l5', NULL),
(29, 'l6', NULL),
(30, 'hth1', NULL),
(31, 'hd1', NULL),
(32, 'hth2', NULL),
(33, 'hd2', NULL),
(34, 'hth3', NULL),
(35, 'hd3', NULL),
(36, 'hth4', NULL),
(37, 'hd4', NULL),
(38, 'cemail', NULL),
(39, 'wemail', NULL),
(40, 'youtube', 'https://www.youtube.com/'),
(41, 'openh', NULL),
(42, 'map', '<iframe src=\"https://maps.google.com/maps?q=Fort%20Miley&t=&z=13&ie=UTF8&iwloc=&output=embed\"></iframe>'),
(43, 'tollfree', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `payment_status` int(11) NOT NULL,
  `c_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `txn_id` text NOT NULL,
  `order_id` int(11) NOT NULL,
  `chapter_id` int(11) NOT NULL,
  `payment_gross` int(11) NOT NULL,
  `total_pay` varchar(255) NOT NULL,
  `payment_status` varchar(255) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `quiz_bank`
--

CREATE TABLE `quiz_bank` (
  `id` bigint(20) NOT NULL,
  `course_id` int(11) NOT NULL,
  `ques` varchar(1000) NOT NULL,
  `ans1` varchar(800) NOT NULL,
  `ans2` varchar(800) NOT NULL,
  `ans3` varchar(800) NOT NULL,
  `ans4` varchar(800) NOT NULL,
  `cor_ans` varchar(1000) NOT NULL,
  `status` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `id` bigint(20) NOT NULL,
  `rating` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `descr` longtext NOT NULL,
  `status` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  `created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `rply_text` longtext NOT NULL,
  `rply_status` int(11) NOT NULL,
  `rply_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `short_description` text NOT NULL,
  `description` text NOT NULL,
  `image` varchar(255) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `option_id` bigint(20) NOT NULL,
  `option_name` varchar(250) DEFAULT NULL,
  `option_value` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `setting`
--

INSERT INTO `setting` (`option_id`, `option_name`, `option_value`) VALUES
(1, 'hth1', 'Incredible Infrastructure'),
(2, 'hd1', 'Lorem ipsum dolor amet, adipiscing, sed do eiusmod tempor incididunt ut labore dolore magna aliqua.'),
(3, 'hth2', 'Email Notifications'),
(4, 'hd2', 'Lorem ipsum dolor amet, adipiscing, sed do eiusmod tempor incididunt ut labore dolore magna aliqua.'),
(5, 'hth3', 'Simple Dashboard'),
(6, 'hd3', 'Lorem ipsum dolor amet, adipiscing, sed do eiusmod tempor incididunt ut labore dolore magna aliqua.'),
(7, 'hth4', 'Information Retrieval'),
(8, 'hd4', 'Lorem ipsum dolor amet, adipiscing, sed do eiusmod tempor incididunt ut labore dolore magna aliqua.'),
(9, 'hth5', 'Drag and Drop Functionality'),
(10, 'hd5', 'Lorem ipsum dolor amet, adipiscing, sed do eiusmod tempor incididunt ut labore dolore magna aliqua.'),
(11, 'hth6', 'Deadline Reminders'),
(12, 'hd6', 'Lorem ipsum dolor amet, adipiscing, sed do eiusmod tempor incididunt ut labore dolore magna aliqua.');

-- --------------------------------------------------------

--
-- Table structure for table `set_exam_test`
--

CREATE TABLE `set_exam_test` (
  `id` bigint(20) NOT NULL,
  `courseid` int(11) NOT NULL,
  `quesid` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `set_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `subscriptions`
--

CREATE TABLE `subscriptions` (
  `subscription_id` bigint(20) NOT NULL,
  `price_id` varchar(255) DEFAULT NULL,
  `currency` varchar(255) DEFAULT NULL,
  `currency_symbol` varchar(255) DEFAULT NULL,
  `product` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `amount` varchar(255) DEFAULT NULL,
  `unit_amount` varchar(255) DEFAULT NULL,
  `unit_amount_decimal` varchar(255) DEFAULT NULL,
  `subscription` tinyint(4) DEFAULT NULL,
  `subscription_name` varchar(255) DEFAULT NULL,
  `subscription_type` varchar(255) DEFAULT NULL,
  `subscription_duration` int(11) DEFAULT NULL,
  `subscription_description` text,
  `plan_discount` float DEFAULT NULL,
  `subscription_created_at` datetime DEFAULT NULL,
  `subscription_status` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `desig` varchar(255) NOT NULL,
  `descr` longtext NOT NULL,
  `img` varchar(200) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `testimonials`
--

CREATE TABLE `testimonials` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `designation` varchar(200) NOT NULL,
  `description` text NOT NULL,
  `rating` int(11) NOT NULL,
  `image` varchar(200) NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `currency` varchar(100) DEFAULT NULL,
  `currency_symbol` varchar(100) DEFAULT NULL,
  `fname` varchar(255) DEFAULT NULL,
  `lname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `phone_full` varchar(255) DEFAULT NULL,
  `phone_code` int(11) DEFAULT NULL,
  `phone_country` varchar(100) DEFAULT NULL,
  `phone_st_country` int(11) DEFAULT NULL,
  `user_bio` text,
  `email_verified` smallint(6) NOT NULL DEFAULT '0',
  `status` smallint(6) DEFAULT '0',
  `image` text,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `otp` varchar(100) DEFAULT NULL,
  `token` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `currency`, `currency_symbol`, `fname`, `lname`, `email`, `password`, `phone`, `phone_full`, `phone_code`, `phone_country`, `phone_st_country`, `user_bio`, `email_verified`, `status`, `image`, `created_at`, `otp`, `token`) VALUES
(1, 'USD', '$', 'Emily', 'Johnson', 'goutampaul@goigi.in', 'e10adc3949ba59abbe56e057f20f883e', '098765 43210', '+919876543210', 91, 'India (भारत)', 0, 'Emily is a first-year college student pursuing a degree in English Literature. She grew up in Seattle, WA, where she developed a love for rainy days and good books. Emily is an avid reader and writer, and she spends much of her free time exploring the works of classic and contemporary authors. She is also a talented soccer player and has been playing competitively since she was six years old.\r\n\r\nWhen she&#039;s not on the soccer field or studying, Emily enjoys hiking in the mountains surrounding Seattle and traveling to new places. She has visited several countries, including France, Spain, and Italy, and hopes to study abroad during her time in college.\r\n\r\nEmily is passionate about social justice and is actively involved in several community service organizations on campus. She hopes to use her degree to advocate for marginalized communities and contribute to the ongoing conversation surrounding equity and inclusion.', 1, 1, 'young-beautiful-woman-pink-warm-sweater-natural-look-smiling-portrait-isolated-long-hair.jpg', '2023-05-04 17:36:07', '893604', NULL),
(2, 'USD', '$', 'John', 'Smith', 'john.smith@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '098765 43211', '+919876543211', 91, 'India (भारत)', 0, 'My name is John Smith and I am a 21-year-old student currently pursuing a Bachelor&#039;s degree in Computer Science from XYZ University. I have always been interested in technology and programming, which led me to choose this field of study.\r\n\r\nApart from academics, I enjoy playing basketball and reading books in my free time. I am also an active member of the university&#039;s coding club where I participate in various coding competitions and collaborate with my peers on coding projects.\r\n\r\nDuring my academic journey, I have worked on several programming projects, including developing a mobile application for a local business and designing a website for a nonprofit organization. I have also completed an internship as a software developer at a leading tech company, which gave me hands-on experience in the industry.\r\n\r\nMy ultimate goal is to become a successful software engineer and contribute to the development of innovative technologies that can make a positive impact on society.', 1, 1, 'bohemian-man-with-his-arms-crossed.jpg', '2023-05-04 17:50:30', '358465', NULL),
(3, 'USD', '$', 'design', 'igi', 'designigi@gmail.com', '85064efb60a9601805dcea56ec5402f7', '1234567890', '+911234567890', 91, 'India (भारत)', 0, NULL, 0, 0, NULL, '2023-05-05 18:17:18', '371142', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_final_ques`
--

CREATE TABLE `user_final_ques` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `courseid` int(11) NOT NULL,
  `quesid` int(11) NOT NULL,
  `ansid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `corans` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_ques`
--

CREATE TABLE `user_ques` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `courseid` int(11) NOT NULL,
  `quesid` int(11) NOT NULL,
  `ansid` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `corans` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user_subscriptions`
--

CREATE TABLE `user_subscriptions` (
  `usr_subid` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `customer` varchar(255) DEFAULT NULL,
  `recurring_price_id` varchar(255) DEFAULT NULL,
  `recurring_price_currency` varchar(255) DEFAULT NULL,
  `recurring_price_amount` varchar(255) DEFAULT NULL,
  `subscription_id` varchar(255) DEFAULT NULL,
  `latest_invoice` varchar(255) DEFAULT NULL,
  `invoice_pdf` text,
  `current_period_end` date DEFAULT NULL,
  `current_period_start` date DEFAULT NULL,
  `stripe_period_end` int(11) DEFAULT NULL,
  `stripe_period_start` varchar(255) DEFAULT NULL,
  `subscriptions_amount` varchar(255) DEFAULT NULL,
  `subscriptions_status` varchar(255) DEFAULT NULL,
  `subscriptions_cancel` enum('1','0') NOT NULL DEFAULT '0',
  `subscriptions_canceled_at` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `add_cart`
--
ALTER TABLE `add_cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cert_payments`
--
ALTER TABLE `cert_payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cert_verify`
--
ALTER TABLE `cert_verify`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cms`
--
ALTER TABLE `cms`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `consulting_form`
--
ALTER TABLE `consulting_form`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_enrollment`
--
ALTER TABLE `course_enrollment`
  ADD PRIMARY KEY (`enrollment_id`);

--
-- Indexes for table `course_enrollment_status`
--
ALTER TABLE `course_enrollment_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_materials`
--
ALTER TABLE `course_materials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_modules`
--
ALTER TABLE `course_modules`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_quiz`
--
ALTER TABLE `course_quiz`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_resources`
--
ALTER TABLE `course_resources`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `course_reviews`
--
ALTER TABLE `course_reviews`
  ADD PRIMARY KEY (`review_id`);

--
-- Indexes for table `cr_category`
--
ALTER TABLE `cr_category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `email_unsubscribe_list`
--
ALTER TABLE `email_unsubscribe_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `faqs`
--
ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gallery_photos`
--
ALTER TABLE `gallery_photos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `homecourse`
--
ALTER TABLE `homecourse`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`option_id`),
  ADD UNIQUE KEY `option_name` (`option_name`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `quiz_bank`
--
ALTER TABLE `quiz_bank`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `setting`
--
ALTER TABLE `setting`
  ADD PRIMARY KEY (`option_id`);

--
-- Indexes for table `set_exam_test`
--
ALTER TABLE `set_exam_test`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`subscription_id`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `testimonials`
--
ALTER TABLE `testimonials`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_final_ques`
--
ALTER TABLE `user_final_ques`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_ques`
--
ALTER TABLE `user_ques`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_subscriptions`
--
ALTER TABLE `user_subscriptions`
  ADD PRIMARY KEY (`usr_subid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `add_cart`
--
ALTER TABLE `add_cart`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `banner`
--
ALTER TABLE `banner`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cert_payments`
--
ALTER TABLE `cert_payments`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cert_verify`
--
ALTER TABLE `cert_verify`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cms`
--
ALTER TABLE `cms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `consulting_form`
--
ALTER TABLE `consulting_form`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `course_enrollment`
--
ALTER TABLE `course_enrollment`
  MODIFY `enrollment_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `course_enrollment_status`
--
ALTER TABLE `course_enrollment_status`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `course_materials`
--
ALTER TABLE `course_materials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `course_modules`
--
ALTER TABLE `course_modules`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `course_quiz`
--
ALTER TABLE `course_quiz`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `course_resources`
--
ALTER TABLE `course_resources`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `course_reviews`
--
ALTER TABLE `course_reviews`
  MODIFY `review_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `cr_category`
--
ALTER TABLE `cr_category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `email_unsubscribe_list`
--
ALTER TABLE `email_unsubscribe_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `faqs`
--
ALTER TABLE `faqs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `gallery_photos`
--
ALTER TABLE `gallery_photos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `homecourse`
--
ALTER TABLE `homecourse`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `option_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `quiz_bank`
--
ALTER TABLE `quiz_bank`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `setting`
--
ALTER TABLE `setting`
  MODIFY `option_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `set_exam_test`
--
ALTER TABLE `set_exam_test`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `subscriptions`
--
ALTER TABLE `subscriptions`
  MODIFY `subscription_id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `testimonials`
--
ALTER TABLE `testimonials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_final_ques`
--
ALTER TABLE `user_final_ques`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_ques`
--
ALTER TABLE `user_ques`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_subscriptions`
--
ALTER TABLE `user_subscriptions`
  MODIFY `usr_subid` bigint(20) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 07, 2023 at 09:20 AM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `concepttocreation`
--

-- --------------------------------------------------------

--
-- Table structure for table `add_cart`
--

CREATE TABLE `add_cart` (
  `id` bigint(20) NOT NULL,
  `userid` int(11) NOT NULL,
  `courseid` int(11) NOT NULL,
  `cdate` datetime NOT NULL DEFAULT current_timestamp(),
  `payment_date` datetime NOT NULL DEFAULT current_timestamp(),
  `payment_status` varchar(255) NOT NULL,
  `price` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
  `last_login` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `banner`
--

INSERT INTO `banner` (`id`, `heading`, `sub_heading`, `banner_image`, `banner_url`, `status`, `created_at`) VALUES
(1, 'World Leading Learning Platform', 'People expect to be&lt;br&gt;\r\nBoard eLearning', 'istockphoto-1352603244-1024x1024.jpg', 'https://dev.igiapp.com/concepttocreation/', 1, '2023-05-04 10:45:16');

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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cert_payments`
--

CREATE TABLE `cert_payments` (
  `id` bigint(20) NOT NULL,
  `userid` int(11) NOT NULL,
  `courseid` int(11) NOT NULL,
  `shiped_price` varchar(50) NOT NULL,
  `payment_status` varchar(255) NOT NULL,
  `trans_id` varchar(255) NOT NULL,
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
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `rply_text` longtext NOT NULL,
  `rply_status` int(11) NOT NULL,
  `rply_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `cms`
--

INSERT INTO `cms` (`id`, `page`, `title`, `meta_title`, `slug`, `meta_description`, `description`, `image`, `image1`, `status`, `created_at`) VALUES
(1, 'About us', 'Welcome to The Concept To Creation', 'Welcome to The Concept To Creation', 'welcome-to-the-concept-to-creation', 'Recogizing the need is the primary than we expected Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sint ipsa voluptatibus,', '<p><strong>Recogizing the need is the primary than we expected Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sint ipsa voluptatibus,</strong></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisic ing elit, sed eius to mod tempors incididunt ut labore et dolore magna this aliqua enims ad minim. Lorem ipsum dolor sit amet, consectetur adipisic ing elit, sed eius to mod tempor. Lorem ipsum dolor sit amet.</p>\r\n', 'image1.png', '', 1, '2019-01-30 02:28:24'),
(2, 'Privacy Policy', 'Privacy Policy', 'Privacy Policy', 'privacy-policy', '', '<p>In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.</p>\r\n\r\n<p>In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.</p>\r\n\r\n<p>In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.</p>\r\n\r\n<p>In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.</p>\r\n\r\n<p>In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.</p>\r\n', '', '', 1, '2019-04-10 06:10:58'),
(4, 'Why students choose us', 'Why students choose us?', 'Why students choose us?', 'why-students-choose-us', 'Why students choose us?', '<p>Leverage our experience and collaborations.</p>\r\n', '', '', 1, '2020-10-30 04:40:10'),
(5, 'Self Paced online', 'Self Paced online', 'Self Paced online', 'self-paced-online', 'Self Paced online', '<p>Online industry standard certifications, thoroughly prepared by experts.</p>\r\n', '', '', 1, '2020-10-30 04:40:50'),
(6, 'Mentorship', 'Mentorship', 'Mentorship', 'mentorship', 'Mentorship', '<p>One on one mentorship access to professionals with decades of experience in pharmaceuticals.</p>\r\n', '', '', 1, '2020-10-30 04:41:35'),
(12, 'Terms of Service', 'Terms of Service', '', 'terms-of-service', '', '<p>In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.</p>\r\n\r\n<p>In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.</p>\r\n\r\n<p>In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.</p>\r\n\r\n<p>In publishing and graphic design, Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document or a typeface without relying on meaningful content. Lorem ipsum may be used as a placeholder before final copy is available.</p>\r\n', '', '', 1, '2020-12-10 06:24:08'),
(13, 'Hands on work experience', 'Hands on work experience', 'Hands on work experience', 'hands-on-work-experience', 'Hands on work experience', '<p>With safety databases, CTMS, eTMF, EDC applications.</p>\r\n', '', '', 1, '2021-01-08 01:20:44'),
(14, 'Collaborations', 'Collaborations', 'Collaborations', 'collaborations', 'Collaborations', '<p>with hiring agencies, Pharmaceutical/CRO companies.</p>\r\n', '', '', 1, '2021-01-15 04:27:15'),
(15, 'Job place assistance', '100% Job place assistance', '100% Job place assistance', '100-job-place-assistance', '100% Job place assistance', '<p>End to end assistance with resume writing, mock screens and interview questionnaire.</p>\r\n', '', '', 1, '2021-01-15 04:30:30'),
(16, 'Get In Touch', 'Get In Touch', 'Get In Touch', 'get-in-touch', 'Get In Touch', '<p>Have some suggestions or just want to say hi? Our support team are ready to help you 24/7.</p>\r\n', '', '', 1, '2021-01-15 04:31:05'),
(20, 'Job readiness', 'Job readiness', 'Job readiness', 'job-readiness', 'Curriculum drafted for current market needs.', '<p>Curriculum drafted for current market needs.</p>\r\n', '', '', 1, '2023-01-19 09:15:40'),
(21, 'Consulting', 'Consulting', 'Welcome to The Concept To Creation', 'consulting', 'Recogizing the need is the primary than we expected Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sint ipsa voluptatibus,', '<p><strong>Recogizing the need is the primary than we expected Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sint ipsa voluptatibus,</strong></p>\r\n\r\n<p>Lorem ipsum dolor sit amet, consectetur adipisic ing elit, sed eius to mod tempors incididunt ut labore et dolore magna this aliqua enims ad minim. Lorem ipsum dolor sit amet, consectetur adipisic ing elit, sed eius to mod tempor. Lorem ipsum dolor sit amet.</p>\r\n', 'image11.png', 'image11.jpg', 1, '2023-05-05 06:22:32');

-- --------------------------------------------------------

--
-- Table structure for table `consulting_form`
--

CREATE TABLE `consulting_form` (
  `id` bigint(20) NOT NULL,
  `fname` varchar(30) NOT NULL,
  `lname` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` int(15) NOT NULL,
  `msg` text NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `rply_text` longtext NOT NULL,
  `rply_status` int(11) NOT NULL,
  `rply_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `consulting_form`
--

INSERT INTO `consulting_form` (`id`, `fname`, `lname`, `email`, `phone`, `msg`, `created`, `rply_text`, `rply_status`, `rply_date`) VALUES
(1, 'demo', '', 'demo@gmail.com', 2147483647, 'Hello.\r\nTest message from consulting page.', '2023-05-05 13:40:23', '', 0, NULL);

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
  `crested_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `rply_text` longtext NOT NULL,
  `rply_status` int(11) NOT NULL,
  `rply_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`id`, `fname`, `lname`, `email`, `phone`, `subject`, `message`, `crested_at`, `rply_text`, `rply_status`, `rply_date`) VALUES
(1, 'demo', '', 'demo@gmail.com', 2147483647, 'Demo Subject', 'Hello.\r\nThis is a test message', '2023-05-05 07:55:10', '', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `heading_1` text DEFAULT NULL,
  `heading_2` text DEFAULT NULL,
  `meta_descr` varchar(1000) NOT NULL,
  `description` text NOT NULL,
  `program_overview` longtext DEFAULT NULL,
  `objectives` longtext DEFAULT NULL,
  `curriculam` longtext DEFAULT NULL,
  `duration` longtext DEFAULT NULL,
  `career_paths` longtext DEFAULT NULL,
  `price` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `video` text NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` (`id`, `cat_id`, `title`, `slug`, `heading_1`, `heading_2`, `meta_descr`, `description`, `program_overview`, `objectives`, `curriculam`, `duration`, `career_paths`, `price`, `rating`, `image`, `video`, `status`, `created_at`) VALUES
(1, 1, 'ADVANCED CERTIFICATE PROGRAMME IN MACHINE LEARNING & NLP', 'advanced-certificate-programme-in-machine-learning-nlp', 'Competing in the Age of AI—Virtual', 'Eligibility: Bachelor’s degree with a minimum ofThe program fee covers tuition, e-books, and online case materials.\r\n\r\nThis program includes live online classes, self-paced work, discussion groups, and virtual networking. Download brochure for detailed schedule.\r\n\r\nSummary\r\n\r\nArtificial intelligence (AI) is revolutionizing the way today\'s businesses compete and operate. By putting AI and data at the center of their capabilities, companies are redefining how they create, capture, and share value—and are achieving impressive growth as a result. Whatever your industry or business model, you cannot afford to ignore this exciting, highly disruptive trend.\r\n\r\nIn this live online program, you will delve into new AI-based business models and operational approaches. As you explore a range of capabilities that can help your business succeed in today\'s data-driven environments, you will discover how you can lead your company\'s transformation into an AI-first leader. Along with learning how to unlock new growth potential, you will deepen your understanding of ethical challenges that come with leveraging massive amounts of data and sophisticated analytics. 50% or equivalent passing marks.', '', '<p>The program fee covers tuition, e-books, and online case materials.</p>\r\n\r\n<p>This program includes live online classes, self-paced work, discussion groups, and virtual networking. Download brochure for detailed schedule.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Summary</h2>\r\n\r\n<p>Artificial intelligence (AI) is revolutionizing the way today&#39;s businesses compete and operate. By putting AI and data at the center of their capabilities, companies are redefining how they create, capture, and share value&mdash;and are achieving impressive growth as a result. Whatever your industry or business model, you cannot afford to ignore this exciting, highly disruptive trend.</p>\r\n\r\n<p>In this live online program, you will delve into new AI-based business models and operational approaches. As you explore a range of capabilities that can help your business succeed in today&#39;s data-driven environments, you will discover how you can lead your company&#39;s transformation into an AI-first leader. Along with learning how to unlock new growth potential, you will deepen your understanding of ethical challenges that come with leveraging massive amounts of data and sophisticated analytics.</p>\r\n\r\n<p>&nbsp;</p>\r\n', '<p>Key Benefits</p>\r\n\r\n<p>This online artificial intelligence course is a &quot;how-to&quot; guide that demystifies AI and its practical implications for business advantage. You will delve into diverse applications of AI, machine learning, predictive modeling, and data science; explore network effects and platform strategies; and learn how to build an AI factory that enables your company to compete successfully in existing and new markets. You will also analyze your organization&#39;s current business models and AI capabilities, identify new opportunities, and create specific plans for growth.</p>\r\n\r\n<p>&nbsp;</p>\r\n', '<p><a href=\"https://www.exed.hbs.edu/competing-age-ai-virtual/?utm_source=google&amp;utm_medium=paid-search&amp;utm_campaign=exed-non-brand-program-aiv-global-none-exact-cross-device-india&amp;utm_id=core&amp;gclid=EAIaIQobChMIjprq84TZ_gIV-JlmAh3u6wuoEAAYASAAEgIA4PD_BwE&amp;gclsrc=aw.ds#\">Move toward an AI-based business model</a></p>\r\n\r\n<ul>\r\n	<li>Choose how best to apply AI in your industry and your business</li>\r\n	<li>Redesign key components of your organization and operating model</li>\r\n	<li>Lead the creation of algorithms, software infrastructure, data pipelines, and experimentation platforms</li>\r\n	<li>Guide your organization in the development of sophisticated data platforms and artificial intelligence capabilities and enable higher levels of automation</li>\r\n	<li>Ensure an ethical approach to AI and manage inherent risks</li>\r\n</ul>\r\n\r\n<p><a href=\"https://www.exed.hbs.edu/competing-age-ai-virtual/?utm_source=google&amp;utm_medium=paid-search&amp;utm_campaign=exed-non-brand-program-aiv-global-none-exact-cross-device-india&amp;utm_id=core&amp;gclid=EAIaIQobChMIjprq84TZ_gIV-JlmAh3u6wuoEAAYASAAEgIA4PD_BwE&amp;gclsrc=aw.ds#\">Create opportunities to build competitive advantage</a></p>\r\n\r\n<ul>\r\n	<li>Reimagine your company&#39;s value propositions to create new revenue streams</li>\r\n	<li>Redesign organizational systems, processes, and roles to be AI driven</li>\r\n	<li>Build the skills, capabilities, and culture to manage an AI-first operating model</li>\r\n	<li>Recognize and benefit from network effects and learning effects</li>\r\n</ul>\r\n\r\n<p><a href=\"https://www.exed.hbs.edu/competing-age-ai-virtual/?utm_source=google&amp;utm_medium=paid-search&amp;utm_campaign=exed-non-brand-program-aiv-global-none-exact-cross-device-india&amp;utm_id=core&amp;gclid=EAIaIQobChMIjprq84TZ_gIV-JlmAh3u6wuoEAAYASAAEgIA4PD_BwE&amp;gclsrc=aw.ds#\">Expand your personal and professional network</a></p>\r\n\r\n<ul>\r\n	<li>Extend your network by connecting and working with accomplished executives from various backgrounds, industries, and countries around the globe</li>\r\n	<li>Build relationships with a diverse group of peers who can provide wide-ranging insights into your business challenges and career decisions</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n', '<h2>What You Will Learn</h2>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Through a rich experience that includes live online sessions with faculty, new case studies, self-paced learning, small-group discussions, and insights from experts, you will discover how artificial intelligence is transforming today&#39;s businesses&mdash;and how your business can benefit. These lessons feature all new material developed by the faculty, and focus on leading companies such as Ant Financial and Moderna. This online artificial intelligence course releases AI from the black box and provides a blueprint to help all businesses&mdash;from startups to long-established companies&mdash;compete successfully and thrive in the age of AI.</p>\r\n\r\n<p>This program is based on the findings summarized in the groundbreaking and critically acclaimed book&nbsp;<em>Competing in the Age of AI: Strategy and Leadership When Algorithms and Networks Run the World</em>.</p>\r\n\r\n<h2>Program Format</h2>\r\n\r\n<p>Each week of the program includes one live online session (interactive case discussion, simulation, or expert panel) and three to five hours of self-paced learning and small-group discussions. Class sessions and discussions will take place via the Zoom platform. Carefully curated small groups of peers will facilitate learning, idea exchange, and networking throughout the course.</p>\r\n\r\n<p>The program will also leverage an extensive network of analytics and AI mentors to help you contextualize and apply your learning. Collaborative learning is an integral part of this virtual experience. To maximize the benefit for everyone, participants are expected to attend every session, complete all assignments, and contribute effectively in the Zoom classroom and in small peer groups.</p>\r\n\r\n<p>Participants should expect to spend at least 9-12 hours on self-paced case preparation prior to attending the program. Case materials will be made available approximately two weeks prior to program start.</p>\r\n\r\n<p>&nbsp;</p>\r\n', '13 Months', '<p><a href=\"https://www.exed.hbs.edu/competing-age-ai-virtual/curriculum#\">The age of AI</a></p>\r\n\r\n<ul>\r\n	<li>Tracing digitization of the economy and the (re)emergence of AI</li>\r\n	<li>Understanding the impact of AI on business and operating models</li>\r\n	<li>Developing a framework for driving business and industry transformation</li>\r\n	<li>Evolving leadership in the era of AI</li>\r\n	<li>Exploring surprising uses of AI today</li>\r\n</ul>\r\n\r\n<p><a href=\"https://www.exed.hbs.edu/competing-age-ai-virtual/curriculum#\">Network effects and learning effects</a></p>\r\n\r\n<ul>\r\n	<li>Overcoming the challenge of developing strategy in today&#39;s AI landscape</li>\r\n	<li>Comparing AI-first firms to traditional product and/or service-based organizations</li>\r\n	<li>Implementing powerful innovation frameworks</li>\r\n	<li>Building network effects, using them to accelerate competitive advantage&mdash;and competing against them</li>\r\n	<li>Taking full advantage of learning effects as you scale your operations</li>\r\n</ul>\r\n\r\n<p><a href=\"https://www.exed.hbs.edu/competing-age-ai-virtual/curriculum#\">The AI factory</a></p>\r\n\r\n<ul>\r\n	<li>Developing a data pipeline to gather, clean, integrate, and safeguard data in a systematic, sustainable, and scalable way</li>\r\n	<li>Developing algorithms</li>\r\n	<li>Deploying personalization for maximum effectiveness</li>\r\n	<li>Using predictive modeling to anticipate future states or actions of the business</li>\r\n	<li>Testing hypotheses with an experimentation platform</li>\r\n	<li>Ensuring that your infrastructure supports key processes and connects them to both internal and external users</li>\r\n</ul>\r\n\r\n<p><a href=\"https://www.exed.hbs.edu/competing-age-ai-virtual/curriculum#\">The AI-first company</a></p>\r\n\r\n<ul>\r\n	<li>Accruing the advantages of scale, scope, learning, and speed to innovate and go to market</li>\r\n	<li>Understanding how companies with an AI factory core deliver significant value to customers</li>\r\n	<li>Designing and implementing organizational and technological architectures needed to achieve success</li>\r\n	<li>Navigating the inherent challenges of AI and capturing strategic opportunities</li>\r\n</ul>\r\n\r\n<p><a href=\"https://www.exed.hbs.edu/competing-age-ai-virtual/curriculum#\">Ethics of AI and data</a></p>\r\n\r\n<ul>\r\n	<li>Building and scaling a responsible AI framework</li>\r\n	<li>Ensuring privacy and cybersecurity</li>\r\n	<li>Avoiding algorithmic bias</li>\r\n	<li>Managing risks related to inclusiveness and transparency</li>\r\n</ul>\r\n\r\n<p><a href=\"https://www.exed.hbs.edu/competing-age-ai-virtual/curriculum#\">Driving organizational transformation</a></p>\r\n\r\n<ul>\r\n	<li>Leading a new kind of digital transformation</li>\r\n	<li>Assessing your organization&#39;s AI readiness and maturity</li>\r\n	<li>Developing your AI-first Scorecard</li>\r\n	<li>Rearchitecting your operating model</li>\r\n	<li>Providing effective, unbiased service that protects consumers</li>\r\n	<li>Intensifying the value of data</li>\r\n	<li>Mitigating collisions between traditional and digital operating models</li>\r\n</ul>\r\n\r\n<p><a href=\"https://www.exed.hbs.edu/competing-age-ai-virtual/curriculum#\">AI Application Deep Dives</a></p>\r\n\r\n<p>HBS faculty will curate interactive cases and panels with industry experts that examine the wide range of AI applications being put into use in today&#39;s enterprises. You will have the opportunity to choose at least two of these live sessions, and the remaining sessions will be available to view asynchronously.</p>\r\n\r\n<p><a href=\"https://www.exed.hbs.edu/competing-age-ai-virtual/curriculum#\">AI Readiness Survey</a></p>\r\n\r\n<p>You will evaluate your own organization&#39;s AI readiness and learn how your organization compares with other firms in similar industries and geographies. The survey serves as a research tool, a diagnostic tool, and a benchmark tool. You will review survey results with peers and faculty.</p>\r\n', 29, 0, 'programpage_banner1.jpg', '', 1, '2023-05-04 06:12:20'),
(2, 1, 'MASTER CERTIFICATE PROGRAMME IN MACHINE LEARNING & NLP', 'advanced-certificate-programme-in-machine-learning-nlp', 'Age of AI—Virtual', 'Eligibility: Bachelor’s degree with a minimum ofThe program fee covers tuition, e-books, and online case materials.\r\n\r\nThis program includes live online classes, self-paced work, discussion groups, and virtual networking. Download brochure for detailed schedule.\r\n\r\nSummary\r\n\r\nArtificial intelligence (AI) is revolutionizing the way today\'s businesses compete and operate. By putting AI and data at the center of their capabilities, companies are redefining how they create, capture, and share value—and are achieving impressive growth as a result. Whatever your industry or business model, you cannot afford to ignore this exciting, highly disruptive trend.\r\n\r\nIn this live online program, you will delve into new AI-based business models and operational approaches. As you explore a range of capabilities that can help your business succeed in today\'s data-driven environments, you will discover how you can lead your company\'s transformation into an AI-first leader. Along with learning how to unlock new growth potential, you will deepen your understanding of ethical challenges that come with leveraging massive amounts of data and sophisticated analytics. 50% or equivalent passing marks.', '', '<p>The program fee covers tuition, e-books, and online case materials.</p>\r\n\r\n<p>This program includes live online classes, self-paced work, discussion groups, and virtual networking. Download brochure for detailed schedule.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<h2>Summary</h2>\r\n\r\n<p>Artificial intelligence (AI) is revolutionizing the way today&#39;s businesses compete and operate. By putting AI and data at the center of their capabilities, companies are redefining how they create, capture, and share value&mdash;and are achieving impressive growth as a result. Whatever your industry or business model, you cannot afford to ignore this exciting, highly disruptive trend.</p>\r\n\r\n<p>In this live online program, you will delve into new AI-based business models and operational approaches. As you explore a range of capabilities that can help your business succeed in today&#39;s data-driven environments, you will discover how you can lead your company&#39;s transformation into an AI-first leader. Along with learning how to unlock new growth potential, you will deepen your understanding of ethical challenges that come with leveraging massive amounts of data and sophisticated analytics.</p>\r\n\r\n<p>&nbsp;</p>\r\n', '<p>Key Benefits</p>\r\n\r\n<p>This online artificial intelligence course is a &quot;how-to&quot; guide that demystifies AI and its practical implications for business advantage. You will delve into diverse applications of AI, machine learning, predictive modeling, and data science; explore network effects and platform strategies; and learn how to build an AI factory that enables your company to compete successfully in existing and new markets. You will also analyze your organization&#39;s current business models and AI capabilities, identify new opportunities, and create specific plans for growth.</p>\r\n\r\n<p>&nbsp;</p>\r\n', '<p><a href=\"https://www.exed.hbs.edu/competing-age-ai-virtual/?utm_source=google&amp;utm_medium=paid-search&amp;utm_campaign=exed-non-brand-program-aiv-global-none-exact-cross-device-india&amp;utm_id=core&amp;gclid=EAIaIQobChMIjprq84TZ_gIV-JlmAh3u6wuoEAAYASAAEgIA4PD_BwE&amp;gclsrc=aw.ds#\">Move toward an AI-based business model</a></p>\r\n\r\n<ul>\r\n	<li>Choose how best to apply AI in your industry and your business</li>\r\n	<li>Redesign key components of your organization and operating model</li>\r\n	<li>Lead the creation of algorithms, software infrastructure, data pipelines, and experimentation platforms</li>\r\n	<li>Guide your organization in the development of sophisticated data platforms and artificial intelligence capabilities and enable higher levels of automation</li>\r\n	<li>Ensure an ethical approach to AI and manage inherent risks</li>\r\n</ul>\r\n\r\n<p><a href=\"https://www.exed.hbs.edu/competing-age-ai-virtual/?utm_source=google&amp;utm_medium=paid-search&amp;utm_campaign=exed-non-brand-program-aiv-global-none-exact-cross-device-india&amp;utm_id=core&amp;gclid=EAIaIQobChMIjprq84TZ_gIV-JlmAh3u6wuoEAAYASAAEgIA4PD_BwE&amp;gclsrc=aw.ds#\">Create opportunities to build competitive advantage</a></p>\r\n\r\n<ul>\r\n	<li>Reimagine your company&#39;s value propositions to create new revenue streams</li>\r\n	<li>Redesign organizational systems, processes, and roles to be AI driven</li>\r\n	<li>Build the skills, capabilities, and culture to manage an AI-first operating model</li>\r\n	<li>Recognize and benefit from network effects and learning effects</li>\r\n</ul>\r\n\r\n<p><a href=\"https://www.exed.hbs.edu/competing-age-ai-virtual/?utm_source=google&amp;utm_medium=paid-search&amp;utm_campaign=exed-non-brand-program-aiv-global-none-exact-cross-device-india&amp;utm_id=core&amp;gclid=EAIaIQobChMIjprq84TZ_gIV-JlmAh3u6wuoEAAYASAAEgIA4PD_BwE&amp;gclsrc=aw.ds#\">Expand your personal and professional network</a></p>\r\n\r\n<ul>\r\n	<li>Extend your network by connecting and working with accomplished executives from various backgrounds, industries, and countries around the globe</li>\r\n	<li>Build relationships with a diverse group of peers who can provide wide-ranging insights into your business challenges and career decisions</li>\r\n</ul>\r\n\r\n<p>&nbsp;</p>\r\n', '<h2>What You Will Learn</h2>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Through a rich experience that includes live online sessions with faculty, new case studies, self-paced learning, small-group discussions, and insights from experts, you will discover how artificial intelligence is transforming today&#39;s businesses&mdash;and how your business can benefit. These lessons feature all new material developed by the faculty, and focus on leading companies such as Ant Financial and Moderna. This online artificial intelligence course releases AI from the black box and provides a blueprint to help all businesses&mdash;from startups to long-established companies&mdash;compete successfully and thrive in the age of AI.</p>\r\n\r\n<p>This program is based on the findings summarized in the groundbreaking and critically acclaimed book&nbsp;<em>Competing in the Age of AI: Strategy and Leadership When Algorithms and Networks Run the World</em>.</p>\r\n\r\n<h2>Program Format</h2>\r\n\r\n<p>Each week of the program includes one live online session (interactive case discussion, simulation, or expert panel) and three to five hours of self-paced learning and small-group discussions. Class sessions and discussions will take place via the Zoom platform. Carefully curated small groups of peers will facilitate learning, idea exchange, and networking throughout the course.</p>\r\n\r\n<p>The program will also leverage an extensive network of analytics and AI mentors to help you contextualize and apply your learning. Collaborative learning is an integral part of this virtual experience. To maximize the benefit for everyone, participants are expected to attend every session, complete all assignments, and contribute effectively in the Zoom classroom and in small peer groups.</p>\r\n\r\n<p>Participants should expect to spend at least 9-12 hours on self-paced case preparation prior to attending the program. Case materials will be made available approximately two weeks prior to program start.</p>\r\n\r\n<p>&nbsp;</p>\r\n', '13 Months', '<p><a href=\"https://www.exed.hbs.edu/competing-age-ai-virtual/curriculum#\">The age of AI</a></p>\r\n\r\n<ul>\r\n	<li>Tracing digitization of the economy and the (re)emergence of AI</li>\r\n	<li>Understanding the impact of AI on business and operating models</li>\r\n	<li>Developing a framework for driving business and industry transformation</li>\r\n	<li>Evolving leadership in the era of AI</li>\r\n	<li>Exploring surprising uses of AI today</li>\r\n</ul>\r\n\r\n<p><a href=\"https://www.exed.hbs.edu/competing-age-ai-virtual/curriculum#\">Network effects and learning effects</a></p>\r\n\r\n<ul>\r\n	<li>Overcoming the challenge of developing strategy in today&#39;s AI landscape</li>\r\n	<li>Comparing AI-first firms to traditional product and/or service-based organizations</li>\r\n	<li>Implementing powerful innovation frameworks</li>\r\n	<li>Building network effects, using them to accelerate competitive advantage&mdash;and competing against them</li>\r\n	<li>Taking full advantage of learning effects as you scale your operations</li>\r\n</ul>\r\n\r\n<p><a href=\"https://www.exed.hbs.edu/competing-age-ai-virtual/curriculum#\">The AI factory</a></p>\r\n\r\n<ul>\r\n	<li>Developing a data pipeline to gather, clean, integrate, and safeguard data in a systematic, sustainable, and scalable way</li>\r\n	<li>Developing algorithms</li>\r\n	<li>Deploying personalization for maximum effectiveness</li>\r\n	<li>Using predictive modeling to anticipate future states or actions of the business</li>\r\n	<li>Testing hypotheses with an experimentation platform</li>\r\n	<li>Ensuring that your infrastructure supports key processes and connects them to both internal and external users</li>\r\n</ul>\r\n\r\n<p><a href=\"https://www.exed.hbs.edu/competing-age-ai-virtual/curriculum#\">The AI-first company</a></p>\r\n\r\n<ul>\r\n	<li>Accruing the advantages of scale, scope, learning, and speed to innovate and go to market</li>\r\n	<li>Understanding how companies with an AI factory core deliver significant value to customers</li>\r\n	<li>Designing and implementing organizational and technological architectures needed to achieve success</li>\r\n	<li>Navigating the inherent challenges of AI and capturing strategic opportunities</li>\r\n</ul>\r\n\r\n<p><a href=\"https://www.exed.hbs.edu/competing-age-ai-virtual/curriculum#\">Ethics of AI and data</a></p>\r\n\r\n<ul>\r\n	<li>Building and scaling a responsible AI framework</li>\r\n	<li>Ensuring privacy and cybersecurity</li>\r\n	<li>Avoiding algorithmic bias</li>\r\n	<li>Managing risks related to inclusiveness and transparency</li>\r\n</ul>\r\n\r\n<p><a href=\"https://www.exed.hbs.edu/competing-age-ai-virtual/curriculum#\">Driving organizational transformation</a></p>\r\n\r\n<ul>\r\n	<li>Leading a new kind of digital transformation</li>\r\n	<li>Assessing your organization&#39;s AI readiness and maturity</li>\r\n	<li>Developing your AI-first Scorecard</li>\r\n	<li>Rearchitecting your operating model</li>\r\n	<li>Providing effective, unbiased service that protects consumers</li>\r\n	<li>Intensifying the value of data</li>\r\n	<li>Mitigating collisions between traditional and digital operating models</li>\r\n</ul>\r\n\r\n<p><a href=\"https://www.exed.hbs.edu/competing-age-ai-virtual/curriculum#\">AI Application Deep Dives</a></p>\r\n\r\n<p>HBS faculty will curate interactive cases and panels with industry experts that examine the wide range of AI applications being put into use in today&#39;s enterprises. You will have the opportunity to choose at least two of these live sessions, and the remaining sessions will be available to view asynchronously.</p>\r\n\r\n<p><a href=\"https://www.exed.hbs.edu/competing-age-ai-virtual/curriculum#\">AI Readiness Survey</a></p>\r\n\r\n<p>You will evaluate your own organization&#39;s AI readiness and learn how your organization compares with other firms in similar industries and geographies. The survey serves as a research tool, a diagnostic tool, and a benchmark tool. You will review survey results with peers and faculty.</p>\r\n', 29, 0, 'programpage_banner1.jpg', '', 1, '2023-05-04 06:12:20');

-- --------------------------------------------------------

--
-- Table structure for table `course_enrollment`
--

CREATE TABLE `course_enrollment` (
  `enrollment_id` bigint(20) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `enrollment_date` datetime DEFAULT current_timestamp(),
  `enrollment_price` double DEFAULT NULL,
  `price_cents` double DEFAULT NULL,
  `currency` varchar(100) DEFAULT NULL,
  `currency_symbol` varchar(100) DEFAULT NULL,
  `payment_status` varchar(255) DEFAULT NULL,
  `transaction_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course_enrollment`
--

INSERT INTO `course_enrollment` (`enrollment_id`, `course_id`, `user_id`, `order_id`, `enrollment_date`, `enrollment_price`, `price_cents`, `currency`, `currency_symbol`, `payment_status`, `transaction_id`) VALUES
(1, 1, 1, 8062, '2023-05-04 12:26:43', 29, 2900, 'USD', '$', 'COMPLETED', '9Oi54ppmttWpXbYZjDuHIXgbFPYZY'),
(2, 1, 2, 7563, '2023-05-04 16:03:33', 29, 2900, 'USD', '$', 'COMPLETED', 'RWLiux9NlPY3vWBRg06m0Dt3FyFZY'),
(3, 2, 2, 6705, '2023-05-04 16:04:20', 29, 2900, 'USD', '$', 'COMPLETED', 'x6daiK5006JzCnT75RSNj8xCpNAZY'),
(5, 2, 1, 2238, '2023-05-15 13:51:47', 29, 2900, 'USD', '$', 'COMPLETED', 'rNKdvIMJEID2eAzkz48W8kNW5lHZY');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course_enrollment_status`
--

INSERT INTO `course_enrollment_status` (`id`, `enrollment_id`, `course_id`, `module`, `user_id`, `material_id`, `material_type`, `completed_date`) VALUES
(1, 1, 1, 1, 1, 1, 'video', '2023-05-04 12:31:31'),
(2, 1, 1, 2, 1, 2, 'resource', '2023-05-04 12:46:40'),
(3, 1, 1, 3, 1, 3, 'quiz', '2023-05-04 12:50:24'),
(4, 1, 1, 4, 1, 4, 'video', '2023-05-04 12:53:17'),
(5, 1, 1, 5, 1, 5, 'quiz', '2023-05-04 12:53:45'),
(6, 1, 1, 6, 1, 6, 'video', '2023-05-04 12:54:42'),
(7, 2, 1, 1, 2, 1, 'video', '2023-05-05 11:24:35');

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
  `video_url` text DEFAULT NULL,
  `video_file` varchar(255) DEFAULT NULL,
  `material_description` longtext DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `position_order` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
(13, 1, 1, 'quiz', '', '', NULL, '', 1, 13, '2023-05-05 11:24:10');

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
  `module_descriptions` longtext DEFAULT NULL,
  `status` int(11) NOT NULL,
  `created_at` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
(12, 2, 6, 'Demo Courses', '56f7ad5824f1d1c300982a5040ade7c2.jpg', '<p>Learnbay offers live, interactive online sessions with professionals from top MNCs. Our artificial intelligence course feature practical training with real-time projects and case studies.</p>\r\n', 1, '2023-05-04');

-- --------------------------------------------------------

--
-- Table structure for table `course_quiz`
--

CREATE TABLE `course_quiz` (
  `id` bigint(20) NOT NULL,
  `course_id` int(11) NOT NULL,
  `material_id` bigint(20) DEFAULT NULL,
  `question` text DEFAULT NULL,
  `ans1` varchar(800) NOT NULL,
  `ans2` varchar(800) NOT NULL,
  `ans3` varchar(800) NOT NULL,
  `ans4` varchar(800) NOT NULL,
  `correct_answer` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `course_quiz`
--

INSERT INTO `course_quiz` (`id`, `course_id`, `material_id`, `question`, `ans1`, `ans2`, `ans3`, `ans4`, `correct_answer`, `status`, `created_at`) VALUES
(1, 1, 3, 'Which of the below is not supervised learning?', 'Spam email identification', 'House price prediction', 'Speech recognition', 'Amazon product suggestions', 'ans1', 1, '2023-05-04 12:12:18'),
(2, 1, 3, 'Which of the below is not unsupervised learning?', 'Anomaly detection', 'Object recognition', 'Customer segmentation', 'Clustering', 'ans2', 1, '2023-05-04 12:12:18'),
(3, 1, 3, 'Select the true statements', 'Machine learning takes input data and static rules to predict the output value', 'Traditional programming uses static rules to process input data to produce output', 'Traditional programming analyzes input data and comes up with rules and output data', 'Machine learning uses knowledge about input data and expected output to learn the rules for modelling data relationships', 'ans3', 1, '2023-05-04 12:12:18'),
(4, 1, 3, 'Select approaches for scaling data', 'Standardization', 'Noise removal', 'Normalization', 'Data encoding', 'ans4', 1, '2023-05-04 12:12:18'),
(5, 1, 3, 'Let’s say we have an image of size 45x55. It is a grayscale image. How many pixels do we need to represent this image in a numerical format?', '2240', '2420', '2152', '2340', 'ans1', 1, '2023-05-04 12:12:18'),
(6, 1, 5, 'What is the relationship between model and algorithm?', 'Algorithm + model = data', 'Algorithm = Model + data', 'Model = Algorithm(data)', 'Data = Algorithm(model)', 'ans1', 1, '2023-05-04 12:14:40'),
(7, 1, 5, 'Identify parametric machine learning algorithms', 'Linear regression', 'CNN', 'Logistic regression', 'Naïve Bayes', 'ans2', 1, '2023-05-04 12:14:40'),
(8, 2, 9, 'Which of the below is not supervised learning?', 'Spam email identification', 'House price prediction', 'Speech recognition', 'Amazon product suggestions', 'ans1', 1, '2023-05-04 12:12:18'),
(9, 2, 9, 'Which of the below is not unsupervised learning?', 'Anomaly detection', 'Object recognition', 'Customer segmentation', 'Clustering', 'ans2', 1, '2023-05-04 12:12:18'),
(10, 2, 9, 'Select the true statements', 'Machine learning takes input data and static rules to predict the output value', 'Traditional programming uses static rules to process input data to produce output', 'Traditional programming analyzes input data and comes up with rules and output data', 'Machine learning uses knowledge about input data and expected output to learn the rules for modelling data relationships', 'ans3', 1, '2023-05-04 12:12:18'),
(11, 2, 9, 'Select approaches for scaling data', 'Standardization', 'Noise removal', 'Normalization', 'Data encoding', 'ans4', 1, '2023-05-04 12:12:18'),
(12, 2, 9, 'Let’s say we have an image of size 45x55. It is a grayscale image. How many pixels do we need to represent this image in a numerical format?', '2240', '2420', '2152', '2340', 'ans1', 1, '2023-05-04 12:12:18'),
(13, 2, 11, 'What is the relationship between model and algorithm?', 'Algorithm + model = data', 'Algorithm = Model + data', 'Model = Algorithm(data)', 'Data = Algorithm(model)', 'ans1', 1, '2023-05-04 12:14:40'),
(14, 2, 11, 'Identify parametric machine learning algorithms', 'Linear regression', 'CNN', 'Logistic regression', 'Naïve Bayes', 'ans2', 1, '2023-05-04 12:14:40'),
(15, 1, 13, 'Test', 'option 1', 'option 2', 'option 3', 'option 4', 'ans1', 1, '2023-05-05 11:24:10');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `course_resources`
--

INSERT INTO `course_resources` (`id`, `course_id`, `material_id`, `resource_file`, `status`, `created_at`) VALUES
(1, 1, 2, '2612_4608_Dxampphtdocsdollar-discount_uploads_users_25-10-2021_orderid_6497.pdf', 1, '2023-05-04 12:06:20'),
(2, 2, 8, '2612_4608_Dxampphtdocsdollar-discount_uploads_users_25-10-2021_orderid_6497.pdf', 1, '2023-05-04 12:06:20');

-- --------------------------------------------------------

--
-- Table structure for table `course_reviews`
--

CREATE TABLE `course_reviews` (
  `review_id` bigint(20) NOT NULL,
  `course_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `rating` float DEFAULT NULL,
  `review_message` text DEFAULT NULL,
  `review_status` varchar(255) DEFAULT NULL,
  `review_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `course_reviews`
--

INSERT INTO `course_reviews` (`review_id`, `course_id`, `user_id`, `rating`, `review_message`, `review_status`, `review_date`) VALUES
(1, 1, 1, 5, 'This is test review  for AI Courses', '1', '2023-05-04 13:00:29');

-- --------------------------------------------------------

--
-- Table structure for table `cr_category`
--

CREATE TABLE `cr_category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(300) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `cr_category`
--

INSERT INTO `cr_category` (`id`, `name`, `slug`, `status`) VALUES
(1, 'AI Courses', 'ai-courses', 1);

-- --------------------------------------------------------

--
-- Table structure for table `faqs`
--

CREATE TABLE `faqs` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `gallery_photos`
--

CREATE TABLE `gallery_photos` (
  `id` int(11) NOT NULL,
  `gallery_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `homecourse`
--

INSERT INTO `homecourse` (`id`, `heading`, `sub_heading`, `course_icon`, `course_url`, `status`, `created_at`) VALUES
(1, 'Job Readiness', 'Curriculum drafted for current market needs', 'work-svgrepo-com1.png', '', '1', '2023-05-04 10:51:48'),
(2, 'Consulting', 'Let\'s collaborate to find the best solutions to find your needs and goals', 'professor-svgrepo-com1.png', '', '1', '2023-05-04 10:53:25'),
(3, 'Self placed online', 'Online industry standard certifications, thoroughly prepared by experts', 'Icon111.png', '', '1', '2023-05-04 10:55:20');

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `option_id` bigint(20) UNSIGNED NOT NULL,
  `option_name` varchar(64) NOT NULL DEFAULT '',
  `option_value` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`option_id`, `option_name`, `option_value`) VALUES
(1, 'logo', 'Footer_Logo.png'),
(2, 'meta_title', NULL),
(6, 'twitter', 'https://www.twitter.com/'),
(7, 'facebook', 'https://www.facebook.com/'),
(8, 'google_plus', 'javascript:void(0);'),
(9, 'linkdin', 'javascript:void(0);'),
(11, 'address', '215 Palm Street, Orlando, FL 2721, USA'),
(12, 'phone', '(+01) 987-654-321'),
(13, 'email', 'support@c2c.com'),
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
(43, 'tollfree', '(+01) 987-654-321');

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
  `c_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
  `created` datetime NOT NULL DEFAULT current_timestamp(),
  `rply_text` longtext NOT NULL,
  `rply_status` int(11) NOT NULL,
  `rply_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `setting`
--

CREATE TABLE `setting` (
  `option_id` bigint(20) NOT NULL,
  `option_name` varchar(250) DEFAULT NULL,
  `option_value` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
  `set_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
  `subscription_description` text DEFAULT NULL,
  `plan_discount` float DEFAULT NULL,
  `subscription_created_at` datetime DEFAULT NULL,
  `subscription_status` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

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
  `user_bio` text DEFAULT NULL,
  `email_verified` smallint(6) NOT NULL DEFAULT 0,
  `status` smallint(6) DEFAULT 0,
  `image` text DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `otp` varchar(100) DEFAULT NULL,
  `token` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `currency`, `currency_symbol`, `fname`, `lname`, `email`, `password`, `phone`, `phone_full`, `phone_code`, `phone_country`, `phone_st_country`, `user_bio`, `email_verified`, `status`, `image`, `created_at`, `otp`, `token`) VALUES
(1, 'USD', '$', 'Demo', 'Student', 'student@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '098765 43210', '+919876543210', 91, 'India (भारत)', 0, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 1, 1, 'istockphoto-1399565382-170667a.jpg', '2023-05-04 12:19:06', '328158', NULL),
(2, 'USD', '$', 'Demo', 'Student 1', 'student1@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '3231546454', '+913231546454', 91, 'India (भारत)', 0, NULL, 1, 1, NULL, '2023-05-04 15:45:52', '675300', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_final_ques`
--

CREATE TABLE `user_final_ques` (
  `id` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `courseid` int(11) NOT NULL,
  `quesid` int(11) NOT NULL,
  `ansid` varchar(255) NOT NULL,
  `corans` varchar(255) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
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
  `ansid` varchar(255) NOT NULL,
  `corans` varchar(255) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
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
  `invoice_pdf` text DEFAULT NULL,
  `current_period_end` date DEFAULT NULL,
  `current_period_start` date DEFAULT NULL,
  `stripe_period_end` int(11) DEFAULT NULL,
  `stripe_period_start` varchar(255) DEFAULT NULL,
  `subscriptions_amount` varchar(255) DEFAULT NULL,
  `subscriptions_status` varchar(255) DEFAULT NULL,
  `subscriptions_cancel` enum('1','0') NOT NULL DEFAULT '0',
  `subscriptions_canceled_at` date DEFAULT NULL,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

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
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `courses`
--
ALTER TABLE `courses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `course_enrollment`
--
ALTER TABLE `course_enrollment`
  MODIFY `enrollment_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `course_enrollment_status`
--
ALTER TABLE `course_enrollment_status`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `course_materials`
--
ALTER TABLE `course_materials`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `course_modules`
--
ALTER TABLE `course_modules`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `course_quiz`
--
ALTER TABLE `course_quiz`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `course_resources`
--
ALTER TABLE `course_resources`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `course_reviews`
--
ALTER TABLE `course_reviews`
  MODIFY `review_id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cr_category`
--
ALTER TABLE `cr_category`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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

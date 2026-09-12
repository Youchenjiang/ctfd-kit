/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.18-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: ctfd
-- ------------------------------------------------------
-- Server version	10.11.18-MariaDB-ubu2204

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alembic_version`
--

DROP TABLE IF EXISTS `alembic_version`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `alembic_version` (
  `version_num` varchar(32) NOT NULL,
  PRIMARY KEY (`version_num`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alembic_version`
--

LOCK TABLES `alembic_version` WRITE;
/*!40000 ALTER TABLE `alembic_version` DISABLE KEYS */;
INSERT INTO `alembic_version` VALUES
('8275865e5992');
/*!40000 ALTER TABLE `alembic_version` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audience_members`
--

DROP TABLE IF EXISTS `audience_members`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `audience_members` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `audience_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_audience_team` (`audience_id`,`team_id`),
  UNIQUE KEY `uq_audience_user` (`audience_id`,`user_id`),
  KEY `team_id` (`team_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `audience_members_ibfk_1` FOREIGN KEY (`audience_id`) REFERENCES `audiences` (`id`) ON DELETE CASCADE,
  CONSTRAINT `audience_members_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE,
  CONSTRAINT `audience_members_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audience_members`
--

LOCK TABLES `audience_members` WRITE;
/*!40000 ALTER TABLE `audience_members` DISABLE KEYS */;
/*!40000 ALTER TABLE `audience_members` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audiences`
--

DROP TABLE IF EXISTS `audiences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `audiences` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `description` text DEFAULT NULL,
  `type` varchar(80) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audiences`
--

LOCK TABLES `audiences` WRITE;
/*!40000 ALTER TABLE `audiences` DISABLE KEYS */;
/*!40000 ALTER TABLE `audiences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `awards`
--

DROP TABLE IF EXISTS `awards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `awards` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `name` varchar(80) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `date` datetime(6) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `category` varchar(80) DEFAULT NULL,
  `icon` text DEFAULT NULL,
  `requirements` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`requirements`)),
  `type` varchar(80) DEFAULT 'standard',
  PRIMARY KEY (`id`),
  KEY `awards_ibfk_1` (`team_id`),
  KEY `awards_ibfk_2` (`user_id`),
  CONSTRAINT `awards_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE,
  CONSTRAINT `awards_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `awards`
--

LOCK TABLES `awards` WRITE;
/*!40000 ALTER TABLE `awards` DISABLE KEYS */;
INSERT INTO `awards` VALUES
(1,1,NULL,'Hint 28','Hint for 後台管理員登入','2026-08-24 22:16:04.828769',0,'hints',NULL,NULL,'standard'),
(2,1,NULL,'Hint 35','Hint for 這隻貓吃掉了碩士論文 (Forensics)','2026-08-27 06:47:51.618110',0,'hints',NULL,NULL,'standard'),
(3,1,NULL,'Hint 46','Hint for 這隻貓吃掉了碩士論文 (Forensics)','2026-08-27 12:27:56.982072',-20,'hints',NULL,NULL,'standard'),
(4,1,NULL,'Hint 47','Hint for 這隻貓吃掉了碩士論文 (Forensics)','2026-08-27 12:28:07.393698',-50,'hints',NULL,NULL,'standard'),
(5,1,NULL,'Hint 44','Hint for 咪挺出席與成績系統 (SQLi)','2026-08-29 15:34:19.365523',-20,'hints',NULL,NULL,'standard'),
(6,1,NULL,'Hint 45','Hint for 咪挺出席與成績系統 (SQLi)','2026-08-29 15:34:31.269422',-50,'hints',NULL,NULL,'standard'),
(7,1,NULL,'Hint 50','Hint for 中央資管歡迎你！(Welcome)','2026-08-29 17:27:41.132802',0,'hints',NULL,NULL,'standard'),
(8,1,NULL,'Hint 63','Hint for 中央資管歡迎你！(Welcome)','2026-08-29 17:31:45.747454',0,'hints',NULL,NULL,'standard'),
(9,1,NULL,'Hint 72','Hint for 這隻貓吃掉了碩士論文 (Forensics)','2026-08-29 17:41:06.121109',-20,'hints',NULL,NULL,'standard'),
(10,1,NULL,'Hint 94','Hint for 教授的機密加簽信','2026-08-29 18:15:58.163534',-20,'hints',NULL,NULL,'standard'),
(11,1,NULL,'Hint 95','Hint for 教授的機密加簽信','2026-08-29 18:16:41.099109',-50,'hints',NULL,NULL,'standard'),
(12,1,NULL,'Hint 113','Hint for 中央資管碩士生存戰','2026-08-29 19:42:05.714551',-20,'hints',NULL,NULL,'standard'),
(13,1,NULL,'Hint 114','Hint for 中央資管碩士生存戰','2026-08-29 19:42:12.056118',-50,'hints',NULL,NULL,'standard'),
(14,1,NULL,'Hint 103','Hint for 學長的最後目擊照片','2026-08-29 20:29:52.436105',-20,'hints',NULL,NULL,'standard'),
(15,1,NULL,'Hint 104','Hint for 學長的最後目擊照片','2026-08-29 20:29:57.475064',-50,'hints',NULL,NULL,'standard'),
(16,1,NULL,'Hint 110','Hint for 咪挺出席與成績系統','2026-08-29 20:30:51.834823',-50,'hints',NULL,NULL,'standard'),
(17,1,NULL,'Hint 109','Hint for 咪挺出席與成績系統','2026-08-29 20:32:01.542036',-20,'hints',NULL,NULL,'standard'),
(22,1,NULL,'Hint 105','Hint for 學長留下的屎山代碼','2026-09-01 04:23:59.201918',-20,'hints',NULL,NULL,'standard'),
(23,1,NULL,'Hint 106','Hint for 學長留下的屎山代碼','2026-09-01 04:24:04.075256',-50,'hints',NULL,NULL,'standard'),
(24,6,NULL,'Hint 102','Hint for 中央資管歡迎你！','2026-09-03 11:02:17.322495',0,'hints',NULL,NULL,'standard'),
(25,7,NULL,'Hint 102','Hint for 中央資管歡迎你！','2026-09-03 18:00:15.597945',0,'hints',NULL,NULL,'standard'),
(26,6,NULL,'🥇 一血首殺 (+50) - 中央資管歡迎你！','恭喜以第 1 名解出「中央資管歡迎你！」獲得額外加分！','2026-09-03 10:10:38.746466',50,'bonus','fas fa-medal',NULL,'standard'),
(27,7,NULL,'🥈 二血先鋒 (+30) - 中央資管歡迎你！','恭喜以第 2 名解出「中央資管歡迎你！」獲得額外加分！','2026-09-03 18:00:29.029698',30,'bonus','fas fa-medal',NULL,'standard'),
(28,9,NULL,'🥉 三血新星 (+10) - 中央資管歡迎你！','恭喜以第 3 名解出「中央資管歡迎你！」獲得額外加分！','2026-09-04 16:38:59.161794',10,'bonus','fas fa-medal',NULL,'standard'),
(29,6,NULL,'🥇 一血首殺 (+50) - 學長的最後目擊照片','恭喜以第 1 名解出「學長的最後目擊照片」獲得額外加分！','2026-09-03 11:09:29.149516',50,'bonus','fas fa-medal',NULL,'standard'),
(30,7,NULL,'🥈 二血先鋒 (+30) - 學長的最後目擊照片','恭喜以第 2 名解出「學長的最後目擊照片」獲得額外加分！','2026-09-03 18:21:45.038251',30,'bonus','fas fa-medal',NULL,'standard'),
(31,9,NULL,'🥉 三血新星 (+10) - 學長的最後目擊照片','恭喜以第 3 名解出「學長的最後目擊照片」獲得額外加分！','2026-09-04 16:41:00.612321',10,'bonus','fas fa-medal',NULL,'standard'),
(32,6,NULL,'🥇 一血首殺 (+50) - 學長留下的屎山代碼','恭喜以第 1 名解出「學長留下的屎山代碼」獲得額外加分！','2026-09-03 11:18:57.731047',50,'bonus','fas fa-medal',NULL,'standard'),
(33,7,NULL,'🥈 二血先鋒 (+30) - 學長留下的屎山代碼','恭喜以第 2 名解出「學長留下的屎山代碼」獲得額外加分！','2026-09-03 18:18:13.118176',30,'bonus','fas fa-medal',NULL,'standard'),
(34,9,NULL,'🥉 三血新星 (+10) - 學長留下的屎山代碼','恭喜以第 3 名解出「學長留下的屎山代碼」獲得額外加分！','2026-09-04 16:42:49.756942',10,'bonus','fas fa-medal',NULL,'standard'),
(35,6,NULL,'🥇 一血首殺 (+50) - 教授的機密加簽信','恭喜以第 1 名解出「教授的機密加簽信」獲得額外加分！','2026-09-03 11:27:10.884111',50,'bonus','fas fa-medal',NULL,'standard'),
(36,7,NULL,'🥈 二血先鋒 (+30) - 教授的機密加簽信','恭喜以第 2 名解出「教授的機密加簽信」獲得額外加分！','2026-09-03 18:35:26.320134',30,'bonus','fas fa-medal',NULL,'standard'),
(37,9,NULL,'🥉 三血新星 (+10) - 教授的機密加簽信','恭喜以第 3 名解出「教授的機密加簽信」獲得額外加分！','2026-09-04 16:49:13.009668',10,'bonus','fas fa-medal',NULL,'standard'),
(38,6,NULL,'🥇 一血首殺 (+50) - 咪挺出席與成績系統','恭喜以第 1 名解出「咪挺出席與成績系統」獲得額外加分！','2026-09-03 11:24:07.908638',50,'bonus','fas fa-medal',NULL,'standard'),
(39,7,NULL,'🥈 二血先鋒 (+30) - 咪挺出席與成績系統','恭喜以第 2 名解出「咪挺出席與成績系統」獲得額外加分！','2026-09-03 18:31:17.607541',30,'bonus','fas fa-medal',NULL,'standard'),
(40,9,NULL,'🥉 三血新星 (+10) - 咪挺出席與成績系統','恭喜以第 3 名解出「咪挺出席與成績系統」獲得額外加分！','2026-09-04 16:45:30.715785',10,'bonus','fas fa-medal',NULL,'standard'),
(41,6,NULL,'🥇 一血首殺 (+50) - 這隻貓吃掉了碩士論文','恭喜以第 1 名解出「這隻貓吃掉了碩士論文」獲得額外加分！','2026-09-03 11:28:44.496166',50,'bonus','fas fa-medal',NULL,'standard'),
(42,7,NULL,'🥈 二血先鋒 (+30) - 這隻貓吃掉了碩士論文','恭喜以第 2 名解出「這隻貓吃掉了碩士論文」獲得額外加分！','2026-09-03 18:43:42.326401',30,'bonus','fas fa-medal',NULL,'standard'),
(43,9,NULL,'🥉 三血新星 (+10) - 這隻貓吃掉了碩士論文','恭喜以第 3 名解出「這隻貓吃掉了碩士論文」獲得額外加分！','2026-09-04 16:51:08.758131',10,'bonus','fas fa-medal',NULL,'standard'),
(44,6,NULL,'🥇 一血首殺 (+50) - 咪挺、肝與黑咖啡','恭喜以第 1 名解出「咪挺、肝與黑咖啡」獲得額外加分！','2026-09-03 11:34:36.120476',50,'bonus','fas fa-medal',NULL,'standard'),
(45,7,NULL,'🥈 二血先鋒 (+30) - 咪挺、肝與黑咖啡','恭喜以第 2 名解出「咪挺、肝與黑咖啡」獲得額外加分！','2026-09-03 18:53:23.112539',30,'bonus','fas fa-medal',NULL,'standard'),
(46,9,NULL,'🥉 三血新星 (+10) - 咪挺、肝與黑咖啡','恭喜以第 3 名解出「咪挺、肝與黑咖啡」獲得額外加分！','2026-09-04 17:01:08.311029',10,'bonus','fas fa-medal',NULL,'standard'),
(47,11,NULL,'Hint 102','Hint for 中央資管歡迎你！','2026-09-07 01:02:26.511883',0,'hints',NULL,NULL,'standard'),
(48,11,NULL,'Hint 103','Hint for 學長的最後目擊照片','2026-09-07 01:04:05.617162',-20,'hints',NULL,NULL,'standard'),
(49,11,NULL,'Hint 104','Hint for 學長的最後目擊照片','2026-09-07 01:04:54.759080',-50,'hints',NULL,NULL,'standard'),
(50,11,NULL,'Hint 109','Hint for 咪挺出席與成績系統','2026-09-07 01:11:19.869382',-20,'hints',NULL,NULL,'standard'),
(51,11,NULL,'Hint 110','Hint for 咪挺出席與成績系統','2026-09-07 01:12:25.109757',-50,'hints',NULL,NULL,'standard'),
(52,11,NULL,'Hint 108','Hint for 教授的機密加簽信','2026-09-07 01:16:14.182063',-50,'hints',NULL,NULL,'standard'),
(53,11,NULL,'Hint 111','Hint for 這隻貓吃掉了碩士論文','2026-09-07 01:19:40.368802',-20,'hints',NULL,NULL,'standard'),
(54,11,NULL,'Hint 112','Hint for 這隻貓吃掉了碩士論文','2026-09-07 01:23:08.377583',-50,'hints',NULL,NULL,'standard'),
(55,13,NULL,'Hint 103','Hint for 學長的最後目擊照片','2026-09-08 03:50:59.860039',-20,'hints',NULL,NULL,'standard'),
(56,13,NULL,'Hint 109','Hint for 咪挺出席與成績系統','2026-09-08 04:55:43.917540',-20,'hints',NULL,NULL,'standard'),
(57,13,NULL,'Hint 111','Hint for 這隻貓吃掉了碩士論文','2026-09-08 05:04:32.704533',-20,'hints',NULL,NULL,'standard'),
(58,13,NULL,'Hint 112','Hint for 這隻貓吃掉了碩士論文','2026-09-08 05:09:25.246798',-50,'hints',NULL,NULL,'standard'),
(59,15,NULL,'Hint 103','Hint for 學長的最後目擊照片','2026-09-08 09:32:28.889637',-20,'hints',NULL,NULL,'standard'),
(60,15,NULL,'Hint 104','Hint for 學長的最後目擊照片','2026-09-08 09:33:37.919616',-50,'hints',NULL,NULL,'standard'),
(61,15,NULL,'Hint 106','Hint for 學長留下的屎山代碼','2026-09-08 09:43:35.218836',-50,'hints',NULL,NULL,'standard'),
(62,15,NULL,'Hint 105','Hint for 學長留下的屎山代碼','2026-09-08 09:43:46.243701',-20,'hints',NULL,NULL,'standard');
/*!40000 ALTER TABLE `awards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brackets`
--

DROP TABLE IF EXISTS `brackets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `brackets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `type` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brackets`
--

LOCK TABLES `brackets` WRITE;
/*!40000 ALTER TABLE `brackets` DISABLE KEYS */;
/*!40000 ALTER TABLE `brackets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `challenge_topics`
--

DROP TABLE IF EXISTS `challenge_topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `challenge_topics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge_id` int(11) DEFAULT NULL,
  `topic_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `challenge_id` (`challenge_id`),
  KEY `topic_id` (`topic_id`),
  CONSTRAINT `challenge_topics_ibfk_1` FOREIGN KEY (`challenge_id`) REFERENCES `challenges` (`id`) ON DELETE CASCADE,
  CONSTRAINT `challenge_topics_ibfk_2` FOREIGN KEY (`topic_id`) REFERENCES `topics` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `challenge_topics`
--

LOCK TABLES `challenge_topics` WRITE;
/*!40000 ALTER TABLE `challenge_topics` DISABLE KEYS */;
/*!40000 ALTER TABLE `challenge_topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `challenges`
--

DROP TABLE IF EXISTS `challenges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `challenges` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `max_attempts` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `category` varchar(80) DEFAULT NULL,
  `type` varchar(80) DEFAULT NULL,
  `state` varchar(80) NOT NULL,
  `requirements` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`requirements`)),
  `connection_info` text DEFAULT NULL,
  `next_id` int(11) DEFAULT NULL,
  `attribution` text DEFAULT NULL,
  `logic` varchar(80) NOT NULL,
  `initial` int(11) DEFAULT NULL,
  `minimum` int(11) DEFAULT NULL,
  `decay` int(11) DEFAULT NULL,
  `function` varchar(32) DEFAULT NULL,
  `position` int(11) NOT NULL DEFAULT 0,
  `module_id` int(11) DEFAULT NULL,
  `scheduled_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `next_id` (`next_id`),
  KEY `module_id` (`module_id`),
  CONSTRAINT `challenges_ibfk_1` FOREIGN KEY (`next_id`) REFERENCES `challenges` (`id`) ON DELETE SET NULL,
  CONSTRAINT `challenges_ibfk_2` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `challenges`
--

LOCK TABLES `challenges` WRITE;
/*!40000 ALTER TABLE `challenges` DISABLE KEYS */;
INSERT INTO `challenges` VALUES
(37,'中央資管歡迎你！','【任務目標】\n這是你的第一道破冰簽到題！請直接複製下方這串通關碼，貼到底下的輸入框並點擊提交，即可完成第一次得分：\n\n`NCUMIS{welcome_to_central_mis}`',0,100,'Misc','standard','visible',NULL,NULL,NULL,NULL,'any',NULL,NULL,NULL,'static',0,NULL,NULL),
(38,'學長的最後目擊照片','【任務目標】\n學弟妹請學長交接設備，學長留下一句「自己找去吧」便狂奔逃跑。請下載這張目擊照片，找出隱藏在照片中的通關 Flag！\n\n★ **[點此下載目擊照片 (campus.jpg)](https://im2026ctf.duckdns.org/download/campus)**',0,500,'Misc','standard','visible',NULL,NULL,NULL,NULL,'any',NULL,NULL,NULL,'static',0,NULL,NULL),
(39,'學長留下的屎山代碼','【任務目標】\n進入測試網頁後畫面看似空無一物。請仔細探索網頁內部細節，找出學長當年留下的通關 Flag 碎片！\n\n★ **[點此開啟網頁系統實驗室](https://im2026ctf.duckdns.org/labs/f12)**',0,500,'Web','standard','visible',NULL,NULL,NULL,NULL,'any',NULL,NULL,NULL,'static',0,NULL,NULL),
(40,'教授的機密加簽信','【任務目標】\n教授把今年最後一份加簽授權碼加密在機密信件中。請打開信件，解開層層密文以獲取通關 Flag！\n\n★ **[點此開啟機密加簽信件](https://im2026ctf.duckdns.org/labs/crypto)**',0,500,'Crypto','standard','visible',NULL,NULL,NULL,NULL,'any',NULL,NULL,NULL,'static',0,NULL,NULL),
(41,'咪挺出席與成績系統','【任務目標】\n這台內部伺服器管理密碼極長無法破解。請設法繞過身分驗證登入後台，取得通關 Flag！\n\n★ **[點此前往出席系統登入頁](https://im2026ctf.duckdns.org/labs/sqli)**',0,500,'Web','standard','visible',NULL,NULL,NULL,NULL,'any',NULL,NULL,NULL,'static',0,NULL,NULL),
(42,'這隻貓吃掉了碩士論文','【任務目標】\n學長宣稱論文被這隻貓吃掉了。請下載這張貓咪圖檔，救出隱藏在圖檔裡的論文檔案以取得通關 Flag！\n\n★ **[點此下載貓咪圖檔 (cat.jpg)](https://im2026ctf.duckdns.org/download/cat)**',0,500,'Forensics','standard','visible',NULL,NULL,NULL,NULL,'any',NULL,NULL,NULL,'static',0,NULL,NULL),
(43,'咪挺、肝與黑咖啡','【任務目標】\n這是一款 12 回合的碩士生涯文字冒險遊戲。你可以透過策略平衡體力與論文進度達成口試畢業，或分析執行檔邏輯直接解出 Flag！\n\n★ **[下載 Windows 執行檔 (mis_survival_game.exe)](https://im2026ctf.duckdns.org/download/check_graduation.exe)**\n*(Windows 使用者下載後雙擊即可開始遊玩)*\n\n★ **[下載 Mac 執行檔 (mis_survival_game_mac)](https://im2026ctf.duckdns.org/download/check_graduation_mac)**\n*(Mac 使用者下載後在終端機執行 chmod +x ./mis_survival_game* 並輸入 ./mis_survival_game* 即可遊玩)*\n\n★ **[下載 Linux 執行檔 (mis_survival_game)](https://im2026ctf.duckdns.org/download/check_graduation)**\n*(Linux / WSL 使用者請使用 chmod +x 賦予權限後執行)*',0,500,'Reverse','standard','visible',NULL,NULL,NULL,NULL,'any',NULL,NULL,NULL,'static',0,NULL,NULL);
/*!40000 ALTER TABLE `challenges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(80) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `date` datetime(6) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `challenge_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `page_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `author_id` (`author_id`),
  KEY `challenge_id` (`challenge_id`),
  KEY `page_id` (`page_id`),
  KEY `team_id` (`team_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `users` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`challenge_id`) REFERENCES `challenges` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comments_ibfk_3` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comments_ibfk_4` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE,
  CONSTRAINT `comments_ibfk_5` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config`
--

DROP TABLE IF EXISTS `config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` text DEFAULT NULL,
  `value` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config`
--

LOCK TABLES `config` WRITE;
/*!40000 ALTER TABLE `config` DISABLE KEYS */;
INSERT INTO `config` VALUES
(1,'ctf_version','3.8.7'),
(2,'dynamic_challenges_alembic_version','93284ed9c099'),
(3,'ctf_name','駭進碩士班：2026'),
(4,'ctf_description','# 🚩【駭進碩士班】2026 碩一新生茶會 Mini-CTF 闖關賽\r\n\r\n歡迎各位碩一新生加入！🎉 \r\n為了讓大家快速熟悉彼此與未來的研究生活，本次新生茶會特別準備了兼具趣味與挑戰的 **「資安 Lab 闖關賽（Mini-CTF）」**。\r\n無論你是資安高手還是跨考/零基礎新手，都能在隊友合作與學長姐的提示下享受解題與搶分的快感！\r\n\r\n---\r\n\r\n### 📅 活動資訊\r\n* **活動時間**：2026 年 X 月 X 日（星期X）14:00 - 16:00\r\n* **活動地點**：[例如：系館 301 教室 / 實驗室]\r\n* **必備裝備**：每組至少攜帶 **1~2 台筆記型電腦**、充飽電（現場提供 Wi-Fi 與延長線）\r\n* **競賽平台**：CTFd（現場發放組別帳號與桌卡，免繁瑣註冊）\r\n\r\n---\r\n\r\n### 🎮 賽制與玩法\r\n\r\n1. **團隊組隊**：\r\n   * 現場抽籤／自由組隊，每隊 **2～3 人**。\r\n   * 各組配有一位「碩二學長姐顧問」，遇到卡關隨時有專人送暖！\r\n2. **尋找 Flag**：\r\n   * 在各道題目中尋找隱藏的關鍵字串，格式為：`FLAG{This_Is_An_Example}`。\r\n   * 將字串提交至 CTFd 平台即可獲取分數。\r\n3. **動態計分與提示機制**：\r\n   * 題目分數會隨解出人數動態調整（越多人解開的分數越低，難題越值錢！）。\r\n   * 題目內建「提示（Hints）」，卡關時可消耗少量分數購買提示。\r\n\r\n---\r\n\r\n### 🧩 題目領域（難度由淺入深）\r\n\r\n* 🌟 **簽到與校園彩蛋 (Misc / OSINT)**：考驗觀察力，把實驗室教授與校園迷因找出來！\r\n* 🌐 **網頁安全 (Web)**：檢視網頁原始碼、繞過登入頁面，體驗駭客視角。\r\n* 🔐 **密碼與編碼 (Crypto)**：破解摩斯密碼、Base64 與古典加密謎題。\r\n* 🔍 **數位取證 (Forensics)**：找出藏在梗圖與檔案深處的秘密。\r\n* 🏆 **魔王挑戰 (Pwn / Reverse)**：專為技術狂熱者準備的壓軸加分題！\r\n\r\n---\r\n\r\n### 🎁 豐厚獎項與福利\r\n\r\n* 🥇 **總積分前三名**：頒發【資安大師 / 冠亞季軍獎品】\r\n* ⚡ **首殺王（First Blood）**：最快解開特定題目的神速隊伍\r\n* 💡 **神之思路獎（Best Writeup）**：賽後分享最精彩／最爆笑解題思路的隊伍\r\n* 🍕 **全員補給**：現場提供無限量披薩、點心、手搖飲，歡迎邊吃邊駭！\r\n\r\n> 💡 **新手不用怕！** \r\n> 本活動旨在破冰與交流，題目設計包含大量初學者能輕鬆上手的趣味題，現場也有學長姐全程協助，放輕鬆來玩即可！'),
(5,'user_mode','users'),
(6,'ctf_logo','2c911375c9674891c85345470c550e09/favicon.svg'),
(7,'ctf_small_icon','6dc8cc9b0fe2eab996884f3a566129aa/favicon.svg'),
(8,'ctf_theme','core'),
(9,'start','1788400800'),
(10,'end','1789005600'),
(11,'freeze',''),
(12,'ctf_banner','bffe1907888759c88ac477a57ab5ba73/mis_newlogo_compressor.png'),
(13,'challenge_visibility','public'),
(14,'registration_visibility','public'),
(15,'score_visibility','public'),
(16,'account_visibility','public'),
(17,'verify_emails','0'),
(18,'social_shares','true'),
(19,'team_size','3'),
(20,'mail_server',NULL),
(21,'mail_port',NULL),
(22,'mail_tls',NULL),
(23,'mail_ssl',NULL),
(24,'mail_username',NULL),
(25,'mail_password',NULL),
(26,'mail_useauth',NULL),
(27,'setup','1'),
(28,'version_latest',NULL),
(29,'next_update_check','1789005333'),
(30,'default_locale','zh_TW'),
(31,'domain_whitelist',''),
(32,'domain_blacklist',''),
(33,'password_min_length',''),
(34,'num_users','80'),
(35,'incorrect_submissions_per_min',''),
(36,'name_changes','0'),
(37,'team_creation','1'),
(38,'num_teams',''),
(39,'team_disbanding','inactive_only'),
(40,'view_after_ctf','0'),
(41,'html_sanitization','1'),
(42,'registration_code','');
/*!40000 ALTER TABLE `config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dynamic_challenge`
--

DROP TABLE IF EXISTS `dynamic_challenge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `dynamic_challenge` (
  `id` int(11) NOT NULL,
  `dynamic_initial` int(11) DEFAULT NULL,
  `dynamic_minimum` int(11) DEFAULT NULL,
  `dynamic_decay` int(11) DEFAULT NULL,
  `dynamic_function` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `dynamic_challenge_ibfk_1` FOREIGN KEY (`id`) REFERENCES `challenges` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dynamic_challenge`
--

LOCK TABLES `dynamic_challenge` WRITE;
/*!40000 ALTER TABLE `dynamic_challenge` DISABLE KEYS */;
/*!40000 ALTER TABLE `dynamic_challenge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `field_entries`
--

DROP TABLE IF EXISTS `field_entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `field_entries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(80) DEFAULT NULL,
  `value` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`value`)),
  `field_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `field_id` (`field_id`),
  KEY `team_id` (`team_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `field_entries_ibfk_1` FOREIGN KEY (`field_id`) REFERENCES `fields` (`id`) ON DELETE CASCADE,
  CONSTRAINT `field_entries_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE,
  CONSTRAINT `field_entries_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `field_entries`
--

LOCK TABLES `field_entries` WRITE;
/*!40000 ALTER TABLE `field_entries` DISABLE KEYS */;
/*!40000 ALTER TABLE `field_entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fields`
--

DROP TABLE IF EXISTS `fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `fields` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text DEFAULT NULL,
  `type` varchar(80) DEFAULT NULL,
  `field_type` varchar(80) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `required` tinyint(1) DEFAULT NULL,
  `public` tinyint(1) DEFAULT NULL,
  `editable` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fields`
--

LOCK TABLES `fields` WRITE;
/*!40000 ALTER TABLE `fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(80) DEFAULT NULL,
  `location` text DEFAULT NULL,
  `challenge_id` int(11) DEFAULT NULL,
  `page_id` int(11) DEFAULT NULL,
  `sha1sum` varchar(40) DEFAULT NULL,
  `solution_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `page_id` (`page_id`),
  KEY `files_ibfk_1` (`challenge_id`),
  KEY `files_ibfk_3` (`solution_id`),
  CONSTRAINT `files_ibfk_1` FOREIGN KEY (`challenge_id`) REFERENCES `challenges` (`id`) ON DELETE CASCADE,
  CONSTRAINT `files_ibfk_2` FOREIGN KEY (`page_id`) REFERENCES `pages` (`id`),
  CONSTRAINT `files_ibfk_3` FOREIGN KEY (`solution_id`) REFERENCES `solutions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
INSERT INTO `files` VALUES
(1,'standard','320d8ef4e5b5753ab2fd52f62b61d502/images.png',NULL,NULL,'50354c8c80475142a5d4c05e23d359dc072cfe90',NULL),
(2,'standard','22b6d5178f6755f525d0bd43de2e91c4/images.png',NULL,NULL,'50354c8c80475142a5d4c05e23d359dc072cfe90',NULL),
(3,'standard','bffe1907888759c88ac477a57ab5ba73/mis_newlogo_compressor.png',NULL,NULL,'e801a9adae23dafc6731721b76fc34493b1d1238',NULL),
(4,'standard','2c911375c9674891c85345470c550e09/favicon.svg',NULL,NULL,'e33ccdf398aaa676736dc3ff199ddb82ac3119f3',NULL),
(5,'standard','6dc8cc9b0fe2eab996884f3a566129aa/favicon.svg',NULL,NULL,'e33ccdf398aaa676736dc3ff199ddb82ac3119f3',NULL);
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `flags`
--

DROP TABLE IF EXISTS `flags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `flags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge_id` int(11) DEFAULT NULL,
  `type` varchar(80) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `data` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `flags_ibfk_1` (`challenge_id`),
  CONSTRAINT `flags_ibfk_1` FOREIGN KEY (`challenge_id`) REFERENCES `challenges` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `flags`
--

LOCK TABLES `flags` WRITE;
/*!40000 ALTER TABLE `flags` DISABLE KEYS */;
INSERT INTO `flags` VALUES
(40,37,'static','NCUMIS{welcome_to_central_mis}',''),
(41,38,'dynamic_shuffle','senior_fled_to_kenting',''),
(42,39,'dynamic_shuffle','do_not_touch_this_trash',''),
(43,40,'dynamic_shuffle','prof_please_sign_course',''),
(44,41,'dynamic_shuffle','prof_also_overslept',''),
(45,42,'dynamic_shuffle','the_cat_is_innocent',''),
(46,43,'dynamic_shuffle','graduation_is_a_lie','');
/*!40000 ALTER TABLE `flags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hints`
--

DROP TABLE IF EXISTS `hints`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `hints` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(80) DEFAULT NULL,
  `challenge_id` int(11) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `cost` int(11) DEFAULT NULL,
  `requirements` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`requirements`)),
  `title` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hints_ibfk_1` (`challenge_id`),
  CONSTRAINT `hints_ibfk_1` FOREIGN KEY (`challenge_id`) REFERENCES `challenges` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hints`
--

LOCK TABLES `hints` WRITE;
/*!40000 ALTER TABLE `hints` DISABLE KEYS */;
INSERT INTO `hints` VALUES
(102,'standard',37,'將題目中的 `NCUMIS{welcome_to_central_mis}` 完整複製（包含大括號），貼到下方的輸入框並點擊「提交」即可獲得分數！',0,NULL,'🎁【新手錦囊】：操作指引'),
(103,'standard',38,'【線索方向】數位相機或手機在拍攝照片時，除了記錄可見像素外，通常還會將拍攝時間、相機型號、甚至主旨備註等「中繼資料 (Metadata / EXIF)」一併寫入圖檔內。',20,NULL,'💡【學長錦囊】：線索方向'),
(104,'standard',38,'【解題手法】在 Windows 下對下載的照片檔案點「右鍵 -> 內容 -> 詳細資料 (Details)」，在「備註 / 註解 (Comments)」欄位即可直接看見 Flag！亦可使用線上 EXIF 工具（如 exiftool、jimpl.com）解析中繼資料。',50,NULL,'📜【教授秘笈】：實戰手法'),
(105,'standard',39,'【第一段碎片】現代瀏覽器都內建開發者工具。按下鍵盤 F12（或右鍵點擊檢查），在 Elements（元素）分頁仔細翻找 HTML 原始碼與綠色的註解文字！',20,NULL,'💡【學長錦囊】：第一段碎片'),
(106,'standard',39,'【第二段碎片】第二段碎片並沒有寫在 HTML 中，而是被存放在瀏覽器的本地儲存區。請在 F12 開發者工具中切換至「Application (應用程式)」分頁，展開左側「Storage -> Cookies」，查看名為 `flag_part2` 的值，將兩段碎片拼湊為完整的 `NCUMIS{...}` 送出！',50,NULL,'📜【教授秘笈】：第二段碎片'),
(107,'standard',40,'【第一層解密】觀察信件中的密文特徵：末尾有 `=` 填充符號，字元由大小寫英文字母與數字組成。這是一種極常見的編碼方式（Base64）。推薦使用線上解密神器 CyberChef (From Base64) 進行第一層解碼！',20,NULL,'💡【學長錦囊】：第一層解密'),
(108,'standard',40,'【第二層解密】Base64 解碼後會看到類似 `QFXPLV{...}` 的文字，字母似乎都被固定位移了（古典密碼學的凱撒密碼 Caesar Cipher / ROT）。因為 N 被移成了 Q（位移 +3），請嘗試使用 Caesar Cipher (ROT -3 / Shift -3) 即可還原出 `NCUMIS{...}` 通關 Flag！',50,NULL,'📜【教授秘笈】：第二層解密'),
(109,'standard',41,'【攻擊思路】登入驗證後台通常使用 SQL 查詢比對帳號密碼（如 `SELECT * FROM users WHERE user=\'$user\' AND pass=\'$pass\'`）。若未妥善過濾輸入，可透過單引號 \' 提前閉合字串，構造出恆真 (Always True) 的邏輯條件。',20,NULL,'💡【學長錦囊】：攻擊思路'),
(110,'standard',41,'【通關語法】在「管理員帳號」欄位直接輸入經典萬能密碼：`\' OR 1=1 --` 或 `\' OR \'\'=\'`，後方的 `--` 或 `#` 註解符號會將密碼比對邏輯略過，使系統判定登入成功！',50,NULL,'📜【教授秘笈】：通關語法'),
(111,'standard',42,'【隱寫原理】在檔案隱寫術 (Steganography) 中，常有人利用 JPEG 檔案結尾標記（FF D9）之後的空間附加其他檔案（例如 ZIP 壓縮包）。這使得檔案在看圖軟體中是一張正常圖片，但同時也是一個壓縮檔！',20,NULL,'💡【學長錦囊】：隱寫原理'),
(112,'standard',42,'【提取手法】\\n1. 最簡單的方式：直接將 `cat.jpg` 檔案重新命名為 `cat.zip`，然後解壓縮！\\n2. 或使用 7-Zip / WinRAR 對圖片按右鍵選擇「開啟壓縮檔」。\\n3. Linux 使用者亦可使用 `unzip cat.jpg` 或 `binwalk -e cat.jpg` 進行提取。',50,NULL,'📜【教授秘笈】：提取手法'),
(113,'standard',43,'【破關策略】這是一款 12 回合的資源管理遊戲！初期先建立研究基礎，過勞時適時休息補眠，在論文有進展時把握 Meeting 提升進度，並在關鍵時刻喝下特濃黑咖啡回血！',20,NULL,'💡【學長錦囊】：破關策略指南'),
(114,'standard',43,'【資安逆向解法】若想跳過遊戲直接破解，請使用 Ghidra / IDA 等逆向工具載入執行檔，分析口試通過判定函數，你會發現 Flag 是由一組位元組透過 XOR 運算即時還原出來的，逆向推導或除錯跟蹤即可取得！',50,NULL,'📜【教授秘笈】：逆向工程分析');
/*!40000 ALTER TABLE `hints` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module_audience_access`
--

DROP TABLE IF EXISTS `module_audience_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `module_audience_access` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `module_id` int(11) NOT NULL,
  `audience_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_module_audience` (`module_id`,`audience_id`),
  KEY `audience_id` (`audience_id`),
  CONSTRAINT `module_audience_access_ibfk_1` FOREIGN KEY (`audience_id`) REFERENCES `audiences` (`id`) ON DELETE CASCADE,
  CONSTRAINT `module_audience_access_ibfk_2` FOREIGN KEY (`module_id`) REFERENCES `modules` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module_audience_access`
--

LOCK TABLES `module_audience_access` WRITE;
/*!40000 ALTER TABLE `module_audience_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `module_audience_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modules`
--

DROP TABLE IF EXISTS `modules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `modules` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modules`
--

LOCK TABLES `modules` WRITE;
/*!40000 ALTER TABLE `modules` DISABLE KEYS */;
/*!40000 ALTER TABLE `modules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text DEFAULT NULL,
  `content` text DEFAULT NULL,
  `date` datetime(6) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `team_id` (`team_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`),
  CONSTRAINT `notifications_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text DEFAULT NULL,
  `route` varchar(128) DEFAULT NULL,
  `content` mediumtext DEFAULT NULL,
  `draft` tinyint(1) DEFAULT NULL,
  `hidden` tinyint(1) DEFAULT NULL,
  `auth_required` tinyint(1) DEFAULT NULL,
  `format` varchar(80) DEFAULT NULL,
  `link_target` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `route` (`route`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES
(1,'2026 中央資管碩一新生茶會：Mini-CTF 資安破冰賽','index','<div class=\"container pt-2 pb-1\">\n  <!-- 主標題與雙按鈕引導 -->\n  <div class=\"text-center my-3\">\n    <h1 class=\"display-6 fw-bold mb-2 adaptive-title\">2026 中央資管碩一新生茶會</h1>\n    <h3 class=\"fw-bold mb-3 adaptive-subtitle\">Mini-CTF 資安破冰挑戰賽 ☕</h3>\n    <p class=\"fs-6 mx-auto mb-3 adaptive-desc\" style=\"max-width: 580px; line-height: 1.6;\">\n      解鎖學長姐留下的神秘謎題，零基礎也能輕鬆破關！<br>\n      <span class=\"fw-bold adaptive-starbucks\">賽後前 10 名直接送星巴克飲料券 🥤✨</span>\n    </p>\n    \n    <!-- 質感雙按鈕 -->\n    <div class=\"d-flex flex-wrap justify-content-center gap-3 mb-2\">\n      <a href=\"/register\" class=\"btn btn-primary btn-lg btn-premium-register fs-5\" style=\"background: linear-gradient(135deg, #2563eb 0%, #1d4ed8 100%); border-radius: 12px; padding: 10px 28px; font-weight: 700; color: #fff; box-shadow: 0 4px 14px rgba(37,99,235,0.38);\">\n        🚀 立即註冊開戰\n      </a>\n      <a href=\"/login?next=/challenges\" class=\"btn btn-outline-primary btn-lg btn-premium-login fs-5\" style=\"border-radius: 12px; padding: 10px 28px; font-weight: 700; border-width: 2px;\">\n        🎯 已註冊？直接登入\n      </a>\n    </div>\n  </div>\n\n  <hr class=\"my-3\" style=\"opacity: 0.2;\">\n\n  <!-- 3步驟快速上手指南 -->\n  <div class=\"text-center mb-2\">\n    <h5 class=\"fw-bold mb-3 adaptive-title\">新手 3 步驟快速上手</h5>\n  </div>\n  <div class=\"row g-2 mb-3 align-items-center justify-content-center text-center\">\n    <!-- Step 1 -->\n    <div class=\"col-lg-3 col-md-3 col-12\">\n      <div class=\"card h-100 p-3 adaptive-step-card\" style=\"border-radius: 12px;\">\n        <div class=\"fw-bold fs-5 mb-1 text-primary\">Step 1. 建立身分</div>\n        <p class=\"small mb-0 adaptive-step-text\" style=\"line-height: 1.5;\">\n          火速註冊帳號，準備出發！\n        </p>\n      </div>\n    </div>\n\n    <!-- Arrow 1 -> 2 -->\n    <div class=\"col-lg-1 col-md-1 col-12 my-1 text-center\">\n      <span class=\"d-none d-md-inline fs-2 fw-bold\" style=\"color: #64748b; opacity: 0.7;\">&rarr;</span>\n      <span class=\"d-inline d-md-none fs-3 fw-bold\" style=\"color: #64748b; opacity: 0.7;\">&darr;</span>\n    </div>\n\n    <!-- Step 2 -->\n    <div class=\"col-lg-3 col-md-3 col-12\">\n      <div class=\"card h-100 p-3 adaptive-step-card\" style=\"border-radius: 12px;\">\n        <div class=\"fw-bold fs-5 mb-1 text-success\">Step 2. 挖掘 Flag</div>\n        <p class=\"small mb-0 adaptive-step-text\" style=\"line-height: 1.5;\">\n          在各關卡找尋線索與通關碼 <code class=\"fw-bold adaptive-code\" style=\"padding: 2px 6px; border-radius: 4px;\">NCUMIS{...}</code>\n        </p>\n      </div>\n    </div>\n\n    <!-- Arrow 2 -> 3 -->\n    <div class=\"col-lg-1 col-md-1 col-12 my-1 text-center\">\n      <span class=\"d-none d-md-inline fs-2 fw-bold\" style=\"color: #64748b; opacity: 0.7;\">&rarr;</span>\n      <span class=\"d-inline d-md-none fs-3 fw-bold\" style=\"color: #64748b; opacity: 0.7;\">&darr;</span>\n    </div>\n\n    <!-- Step 3 -->\n    <div class=\"col-lg-3 col-md-3 col-12\">\n      <div class=\"card h-100 p-3 adaptive-step-card\" style=\"border-radius: 12px;\">\n        <div class=\"fw-bold fs-5 mb-1 text-warning\">Step 3. 爽賺積分</div>\n        <p class=\"small mb-0 adaptive-step-text\" style=\"line-height: 1.5;\">\n          貼上密碼拿下得分，搶進前十！\n        </p>\n      </div>\n    </div>\n  </div>\n\n  <!-- 活動資訊與規則 -->\n  <div class=\"card p-3 mx-auto mb-1 adaptive-info-card\" style=\"max-width: 800px; border-radius: 12px;\">\n    <h5 class=\"fw-bold mb-2 adaptive-title\">活動資訊</h5>\n    <ul class=\"list-unstyled mb-0 small adaptive-info-text\" style=\"line-height: 2.2;\">\n      <li><i class=\"fas fa-clock text-info me-2\"></i><strong class=\"adaptive-title\">時間</strong>：9/3 (四) 10:00 ～ 9/10 (四) 10:00（全天候開放，隨時想玩就上線！）</li>\n      <li><i class=\"fas fa-gift text-warning me-2\"></i><strong class=\"adaptive-title\">獎勵</strong>：<span class=\"fw-bold adaptive-starbucks\">賽後結算前 10 名通通可領「星巴克飲料券」！☕🎉</span></li>\n      <li><i class=\"fas fa-lightbulb text-primary me-2\"></i><strong class=\"adaptive-title\">提示</strong>：卡關不用慌，每題都有「提示」助你一臂之力。</li>\n      <li><i class=\"fas fa-envelope text-success me-2\"></i><strong class=\"adaptive-title\">求助</strong>：遇到疑難雜症或系統異常，請聯絡主辦人：<a href=\"mailto:g1014308@gmail.com\" class=\"fw-bold text-info\" style=\"text-decoration: underline;\">g1014308@gmail.com</a></li>\n    </ul>\n  </div>\n</div>',0,0,0,'html',NULL);
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `ratings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `challenge_id` int(11) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `review` varchar(2000) DEFAULT NULL,
  `date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`challenge_id`),
  KEY `challenge_id` (`challenge_id`),
  CONSTRAINT `ratings_ibfk_1` FOREIGN KEY (`challenge_id`) REFERENCES `challenges` (`id`) ON DELETE CASCADE,
  CONSTRAINT `ratings_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratings`
--

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
INSERT INTO `ratings` VALUES
(3,6,37,1,NULL,'2026-09-03 10:10:51.767737'),
(4,7,43,1,'嘿嘿 好玩！','2026-09-03 18:54:13.535390'),
(5,8,37,1,NULL,'2026-09-04 17:46:13.774149'),
(6,9,43,1,'我是沉眠的死神 很想睡覺的夜晚解出的','2026-09-04 17:46:53.056028'),
(7,1,37,1,'還是資管好','2026-09-04 17:47:04.184133'),
(8,9,42,1,'貓貓雖然可愛，但有點脾氣','2026-09-04 17:47:34.813594'),
(9,9,40,1,'永遠不要相信教授有機密這件事情','2026-09-04 17:47:56.953523'),
(10,9,41,1,'有些時候不要看得太重 肝是自己的','2026-09-04 17:48:33.243433'),
(11,9,39,1,'看看就好','2026-09-04 17:48:44.302905'),
(12,9,38,1,'永遠不要回頭，因為過去很美好','2026-09-04 17:49:11.648425'),
(13,9,37,1,'NCU CCC','2026-09-04 17:50:07.733108'),
(14,11,38,1,'對mac仔不友善🥲','2026-09-07 01:09:29.439055'),
(15,13,37,1,NULL,'2026-09-08 03:48:45.674450'),
(16,13,38,1,NULL,'2026-09-08 03:53:35.244789'),
(17,13,39,1,NULL,'2026-09-08 04:49:52.116342'),
(18,13,41,1,NULL,'2026-09-08 04:59:46.623781'),
(19,13,40,1,NULL,'2026-09-08 05:02:44.254457'),
(20,13,42,1,NULL,'2026-09-08 05:16:00.621247'),
(21,15,37,1,NULL,'2026-09-08 09:31:04.199607'),
(22,13,43,1,NULL,'2026-09-08 16:39:03.649261');
/*!40000 ALTER TABLE `ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solutions`
--

DROP TABLE IF EXISTS `solutions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `solutions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge_id` int(11) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `state` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `challenge_id` (`challenge_id`),
  CONSTRAINT `solutions_ibfk_1` FOREIGN KEY (`challenge_id`) REFERENCES `challenges` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solutions`
--

LOCK TABLES `solutions` WRITE;
/*!40000 ALTER TABLE `solutions` DISABLE KEYS */;
/*!40000 ALTER TABLE `solutions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solves`
--

DROP TABLE IF EXISTS `solves`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `solves` (
  `id` int(11) NOT NULL,
  `challenge_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `challenge_id` (`challenge_id`,`team_id`),
  UNIQUE KEY `challenge_id_2` (`challenge_id`,`user_id`),
  KEY `team_id` (`team_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `solves_ibfk_1` FOREIGN KEY (`challenge_id`) REFERENCES `challenges` (`id`) ON DELETE CASCADE,
  CONSTRAINT `solves_ibfk_2` FOREIGN KEY (`id`) REFERENCES `submissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `solves_ibfk_3` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE,
  CONSTRAINT `solves_ibfk_4` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solves`
--

LOCK TABLES `solves` WRITE;
/*!40000 ALTER TABLE `solves` DISABLE KEYS */;
INSERT INTO `solves` VALUES
(73,37,6,NULL),
(77,38,6,NULL),
(92,39,6,NULL),
(93,41,6,NULL),
(98,40,6,NULL),
(99,42,6,NULL),
(100,43,6,NULL),
(101,37,7,NULL),
(111,39,7,NULL),
(112,38,7,NULL),
(113,41,7,NULL),
(115,40,7,NULL),
(116,42,7,NULL),
(117,43,7,NULL),
(118,37,9,NULL),
(119,38,9,NULL),
(120,37,8,NULL),
(122,39,9,NULL),
(123,41,9,NULL),
(130,38,8,NULL),
(131,40,9,NULL),
(132,42,9,NULL),
(133,39,8,NULL),
(134,41,8,NULL),
(135,40,8,NULL),
(136,42,8,NULL),
(141,43,9,NULL),
(144,43,8,NULL),
(145,37,1,NULL),
(147,37,11,NULL),
(148,38,11,NULL),
(149,39,11,NULL),
(150,41,11,NULL),
(152,40,11,NULL),
(153,37,12,NULL),
(154,38,12,NULL),
(156,39,12,NULL),
(157,41,12,NULL),
(158,40,12,NULL),
(160,42,12,NULL),
(161,43,12,NULL),
(162,37,13,NULL),
(164,38,13,NULL),
(166,39,13,NULL),
(167,41,13,NULL),
(168,40,13,NULL),
(169,42,13,NULL),
(170,37,14,NULL),
(171,37,15,NULL),
(172,38,15,NULL),
(190,38,14,NULL),
(191,39,14,NULL),
(192,41,14,NULL),
(204,40,14,NULL),
(205,42,14,NULL),
(206,43,14,NULL),
(230,43,13,NULL),
(231,37,16,NULL);
/*!40000 ALTER TABLE `solves` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `submissions`
--

DROP TABLE IF EXISTS `submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `submissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `ip` varchar(46) DEFAULT NULL,
  `provided` text DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL,
  `date` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `challenge_id` (`challenge_id`),
  KEY `team_id` (`team_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `submissions_ibfk_1` FOREIGN KEY (`challenge_id`) REFERENCES `challenges` (`id`) ON DELETE CASCADE,
  CONSTRAINT `submissions_ibfk_2` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE,
  CONSTRAINT `submissions_ibfk_3` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=232 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `submissions`
--

LOCK TABLES `submissions` WRITE;
/*!40000 ALTER TABLE `submissions` DISABLE KEYS */;
INSERT INTO `submissions` VALUES
(73,37,6,NULL,'42.73.132.5','NCUMIS{welcome_to_central_mis}','correct','2026-09-03 10:10:38.746466'),
(74,38,6,NULL,'42.73.132.5','NCUMIS{senior_fled_to_kenting}','incorrect','2026-09-03 11:08:22.020953'),
(75,38,6,NULL,'42.73.132.5','kenting','incorrect','2026-09-03 11:08:59.373781'),
(76,38,6,NULL,'42.73.132.5','kenting','incorrect','2026-09-03 11:09:07.947151'),
(77,38,6,NULL,'42.73.132.5','NCUMIS{se阿nior_fled_to_kenti柳ng}','correct','2026-09-03 11:09:29.149516'),
(78,39,6,NULL,'42.73.132.5','NCUMIS{do_柳n阿ot_ -->\"touch_this_trash}\"','incorrect','2026-09-03 11:12:53.715885'),
(79,39,6,NULL,'42.73.132.5','NCUMIS{do_柳n阿ot_ -->\"touch_this_trash}','incorrect','2026-09-03 11:13:00.107533'),
(80,39,6,NULL,'42.73.132.5','NCUMIS{do_柳n阿ot_ -->\"touch_this_trash\"}}','incorrect','2026-09-03 11:13:11.232319'),
(81,39,6,NULL,'42.73.132.5','NCUMIS{do_柳n阿ot_ -->\"touch_this_trash\"}}','incorrect','2026-09-03 11:13:12.764011'),
(82,39,6,NULL,'42.73.132.5','NCUMIS{do_柳n阿ot_ -->\"touch_this_trash\"}','incorrect','2026-09-03 11:13:20.049058'),
(83,39,6,NULL,'42.73.132.5','NCUMIS{do_柳n阿ot_ -->\"touch_this_trash\"}','incorrect','2026-09-03 11:13:21.119474'),
(84,39,6,NULL,'42.73.132.5','NCUMIS{do_柳n阿ot_ -->\"touch_this_trash}\"}','incorrect','2026-09-03 11:13:53.889419'),
(85,39,6,NULL,'42.73.132.5','NCUMIS{do_柳n阿ot_ --> \"touch_this_trash}\"','incorrect','2026-09-03 11:14:23.242688'),
(86,39,6,NULL,'42.73.132.5','NCUMIS{do_柳n阿ot_ -->\"touch_this_trash}\"','incorrect','2026-09-03 11:14:27.681319'),
(87,39,6,NULL,'42.73.132.5','NCUMIS{do_柳n阿ot_ -->\"touch_this_trash}\"','incorrect','2026-09-03 11:14:29.634412'),
(88,39,6,NULL,'42.73.132.5','NCUMIS{do_柳n阿ot_ --> \"touch_this_trash}','incorrect','2026-09-03 11:15:24.748836'),
(89,39,6,NULL,'42.73.132.5','NCUMIS{do_柳n阿ot_ -->touch_this_trash}','incorrect','2026-09-03 11:17:07.724935'),
(90,39,6,NULL,'42.73.132.5','NCUMIS{do_柳n阿ot_ -->\"touch_this_trash}\"','incorrect','2026-09-03 11:17:44.210083'),
(91,39,6,NULL,'42.73.132.5','NCUMIS{do_柳n阿ot_ -->\"touch_this_trash}\"','incorrect','2026-09-03 11:17:45.608448'),
(92,39,6,NULL,'42.73.132.5','NCUMIS{do_柳n阿ot_touch_this_trash}','correct','2026-09-03 11:18:57.731047'),
(93,41,6,NULL,'42.73.132.5','NCUMIS{prof_al阿s柳o_overslept}','correct','2026-09-03 11:24:07.908638'),
(94,40,6,NULL,'42.73.132.5','NCUMIS{prof_please_sign_course}','incorrect','2026-09-03 11:25:51.890584'),
(95,40,6,NULL,'42.73.132.5','NCUMIS{prof_please_sign_course}','incorrect','2026-09-03 11:25:56.061672'),
(96,40,6,NULL,'42.73.132.5','NCUMIS{prof_please_sign_course}','incorrect','2026-09-03 11:26:27.434163'),
(97,40,6,NULL,'42.73.132.5','NCUMIS{prof_please_sign_course}','incorrect','2026-09-03 11:26:29.979448'),
(98,40,6,NULL,'42.73.132.5','NCUMIS{pro柳f阿_please_sign_course}','correct','2026-09-03 11:27:10.884111'),
(99,42,6,NULL,'42.73.132.5','NCUMIS{the_cat_阿is_innocen柳t}','correct','2026-09-03 11:28:44.496166'),
(100,43,6,NULL,'42.73.132.5','NCUMIS{graduat阿ion_is_a_li柳e}','correct','2026-09-03 11:34:36.120476'),
(101,37,7,NULL,'49.218.138.156','NCUMIS{welcome_to_central_mis}','correct','2026-09-03 18:00:29.029698'),
(102,39,7,NULL,'49.218.138.156','NCUMIS{d魚o_not_touch_this_\\346\\232\\250trash}','incorrect','2026-09-03 18:07:02.619463'),
(103,39,7,NULL,'49.218.138.156','NCUMIS{do_not_touch_this_\\346\\232\\250trash}','incorrect','2026-09-03 18:07:11.003809'),
(104,39,7,NULL,'49.218.138.156','NCUMIS{do_not_touch_this_\\346\\232\\250trash}','incorrect','2026-09-03 18:07:13.331931'),
(105,39,7,NULL,'49.218.138.156','NCUMIS{d魚o_not_touch_this_\\346\\232\\250trash}','incorrect','2026-09-03 18:09:12.324256'),
(106,39,7,NULL,'49.218.138.156','NCUMIS{d魚o_not_touch_this_\\346\\232\\250trash}','incorrect','2026-09-03 18:10:45.413637'),
(107,39,7,NULL,'49.218.138.156','NCUMIS{d魚o_not_touch_this_\\346\\232\\250trash}','incorrect','2026-09-03 18:10:52.058586'),
(108,39,7,NULL,'49.218.138.156','NCUMIS{do_not_touch_this_\\346\\232\\250trash}','incorrect','2026-09-03 18:11:05.163284'),
(109,39,7,NULL,'49.218.138.156','NCUMIS{d魚o_not_t ouch_this_\\346\\232\\250trash}','incorrect','2026-09-03 18:14:39.811524'),
(110,39,7,NULL,'49.218.138.156','NCUMIS{d魚o_not_touch_this_\\346\\232\\250trash}','incorrect','2026-09-03 18:14:55.869500'),
(111,39,7,NULL,'49.218.138.156','NCUMIS{d魚o_not_touch_this_暨trash}','correct','2026-09-03 18:18:13.118176'),
(112,38,7,NULL,'49.218.138.156','NCUMIS{se魚ni暨or_fled_to_kenting}','correct','2026-09-03 18:21:45.038251'),
(113,41,7,NULL,'49.218.138.156','NCUMIS{prof_al魚so_o暨verslept}','correct','2026-09-03 18:31:17.607541'),
(114,40,7,NULL,'49.218.138.156','NCUIM{魚suri_sohdvh_vljq_f暨rxuvh}','incorrect','2026-09-03 18:34:58.866767'),
(115,40,7,NULL,'49.218.138.156','NCUMIS{魚prof_please_sign_c暨ourse}','correct','2026-09-03 18:35:26.320134'),
(116,42,7,NULL,'49.218.138.156','NCUMIS{the魚_cat_is_innoc暨ent}','correct','2026-09-03 18:43:42.326401'),
(117,43,7,NULL,'49.218.138.156','NCUMIS{暨graduation_is_a_l魚ie}','correct','2026-09-03 18:53:23.112539'),
(118,37,9,NULL,'211.23.197.201','NCUMIS{welcome_to_central_mis}','correct','2026-09-04 16:38:59.161794'),
(119,38,9,NULL,'211.23.197.201','NCUMIS{senior_fled_to_kentisngT}','correct','2026-09-04 16:41:00.612321'),
(120,37,8,NULL,'111.249.23.149','NCUMIS{welcome_to_central_mis}','correct','2026-09-04 16:41:52.908642'),
(121,39,9,NULL,'211.23.197.201','NCUMIS{do_not_tTo -->huch_this_tsrash}','incorrect','2026-09-04 16:42:41.425405'),
(122,39,9,NULL,'211.23.197.201','NCUMIS{do_not_tTohuch_this_tsrash}','correct','2026-09-04 16:42:49.756942'),
(123,41,9,NULL,'211.23.197.201','NCUMIS{sprof_also_ovTerslept}','correct','2026-09-04 16:45:30.715785'),
(124,38,8,NULL,'111.249.23.149','N C U M I S { s c e n i o r _ f l e d n _ t o _ k e n t i n g }','incorrect','2026-09-04 16:46:40.137379'),
(125,38,8,NULL,'111.249.23.149','NCUMIS{senior_fledn_to_kenting}','incorrect','2026-09-04 16:47:42.915776'),
(126,38,8,NULL,'111.249.23.149','NCUMIS{senior_fledn_to_kenting}','incorrect','2026-09-04 16:47:44.307960'),
(127,38,8,NULL,'111.249.23.149','NCUMIS{senior_fledn_to_kenting}','incorrect','2026-09-04 16:47:45.065002'),
(128,38,8,NULL,'111.249.23.149','NCUMIS{senior_fledn_to_kenting}','incorrect','2026-09-04 16:47:46.063831'),
(129,38,8,NULL,'111.249.23.149','NCUMIS{senior_fledn_to_kenting}','incorrect','2026-09-04 16:47:48.036187'),
(130,38,8,NULL,'111.249.23.149','NCUMIS{scenior_fledn_to_kenting}','correct','2026-09-04 16:47:58.257625'),
(131,40,9,NULL,'211.23.197.201','NCUMIS{prof_please_siTgn_cosuorse}','correct','2026-09-04 16:49:13.009668'),
(132,42,9,NULL,'211.23.197.201','NCUMIS{tohe_cat_is_hTsinnocent}','correct','2026-09-04 16:51:08.758131'),
(133,39,8,NULL,'111.249.23.149','NCUMIS{do_not_ctouch_tehish_trasnh}','correct','2026-09-04 16:51:39.899041'),
(134,41,8,NULL,'111.249.23.149','NCUMIS{pnrof_calso_overslept}','correct','2026-09-04 16:53:38.357994'),
(135,40,8,NULL,'111.249.23.149','NCUMIS{prof_please_sciegn_conurse}','correct','2026-09-04 16:55:25.839925'),
(136,42,8,NULL,'111.249.23.149','NCUMIS{the_cat_is_ninnocecnt}','correct','2026-09-04 16:56:08.352053'),
(137,43,8,NULL,'111.249.23.149','NCUMIS{ilovecentralmis2026}','incorrect','2026-09-04 16:58:44.224432'),
(138,43,8,NULL,'111.249.23.149','NCUMIS{ilove_central_mis2026}','incorrect','2026-09-04 16:59:14.573031'),
(139,43,8,NULL,'111.249.23.149','NCUMIS{ilove_central_mis2026}','incorrect','2026-09-04 16:59:15.926471'),
(140,43,8,NULL,'111.249.23.149','NCUMIS{ilove_central_mis2026}','incorrect','2026-09-04 16:59:17.096815'),
(141,43,9,NULL,'211.23.197.201','NCUMIS{graduaTtions_is_a_hlioe}','correct','2026-09-04 17:01:08.273818'),
(142,43,8,NULL,'111.249.23.149','NCUMIS{i_love_central_mis2026}','incorrect','2026-09-04 17:01:44.060550'),
(143,43,8,NULL,'111.249.23.149','NCUMIS{i_love_central_mis2026}','incorrect','2026-09-04 17:01:45.555127'),
(144,43,8,NULL,'111.249.23.149','NCUMIS{graduation_ins_a_lcie}','correct','2026-09-04 17:01:58.939654'),
(145,37,1,NULL,'140.115.220.7','NCUMIS{welcome_to_central_mis}','correct','2026-09-04 17:46:35.711237'),
(146,37,11,NULL,'27.247.5.64','','incorrect','2026-09-07 01:02:17.695109'),
(147,37,11,NULL,'27.247.5.64','NCUMIS{welcome_to_central_mis}','correct','2026-09-07 01:02:30.479962'),
(148,38,11,NULL,'27.247.5.64','NCUMIS{seniorm_fled_tok_kenting}','correct','2026-09-07 01:05:34.350095'),
(149,39,11,NULL,'27.247.5.64','NCUMIS{do_not_atouch_this_tomkrash}','correct','2026-09-07 01:08:05.205688'),
(150,41,11,NULL,'27.247.5.64','NCUMIS{prof_also_omversolekpt}','correct','2026-09-07 01:12:53.418263'),
(151,40,11,NULL,'27.247.5.64','ncumis{pkrof_pleasea_soign_coumrse}','incorrect','2026-09-07 01:18:07.248626'),
(152,40,11,NULL,'27.247.5.64','NCUMIS{pkrof_pleasea_soign_coumrse}','correct','2026-09-07 01:18:14.115360'),
(153,37,12,NULL,'118.231.145.194','NCUMIS{welcome_to_central_mis}','correct','2026-09-07 07:15:07.449663'),
(154,38,12,NULL,'118.231.145.194','NCUMIS{senior_fleunJd_to_kenting}','correct','2026-09-07 07:15:51.504959'),
(155,39,12,NULL,'118.231.145.194','NCUMIS{do_not_toucJh_nthis_trash','incorrect','2026-09-07 07:18:01.270206'),
(156,39,12,NULL,'118.231.145.194','NCUMIS{do_not_toucJh_nthis_trash}','correct','2026-09-07 07:18:12.720076'),
(157,41,12,NULL,'118.231.145.194','NCUMIS{pronf_also_oveJrsleptu}','correct','2026-09-07 07:19:58.211332'),
(158,40,12,NULL,'118.231.145.194','NCUMIS{prof_pleasJe_signu_conurse}','correct','2026-09-07 07:23:39.183283'),
(159,42,12,NULL,'118.231.145.194','tar -xf cat_ate_my_thesis_for_Jun.jpg','incorrect','2026-09-07 07:35:27.932946'),
(160,42,12,NULL,'118.231.145.194','NCUMIS{theJn_cat_is_innocuent}','correct','2026-09-07 07:35:36.827483'),
(161,43,12,NULL,'118.231.145.194','NCUMIS{graduation_niJs_a_luie}','correct','2026-09-07 07:48:25.375919'),
(162,37,13,NULL,'111.248.1.19','NCUMIS{welcome_to_central_mis}','correct','2026-09-08 03:48:24.419068'),
(163,38,13,NULL,'111.248.1.19','disappeared_senior_for_kk','incorrect','2026-09-08 03:50:52.715999'),
(164,38,13,NULL,'111.248.1.19','NCUMIS{ksenior_fled_to_kkenting}','correct','2026-09-08 03:52:20.778889'),
(165,39,13,NULL,'111.248.1.19','NCUMIS{do_notk_tuch_this_trkash}','incorrect','2026-09-08 04:49:31.442495'),
(166,39,13,NULL,'111.248.1.19','NCUMIS{do_notk_touch_this_trkash}','correct','2026-09-08 04:49:41.503132'),
(167,41,13,NULL,'111.248.1.19','NCUMIS{profk_also_overkslept}','correct','2026-09-08 04:59:33.933485'),
(168,40,13,NULL,'111.248.1.19','NCUMIS{prof_plkeakse_sign_course}','correct','2026-09-08 05:02:33.542229'),
(169,42,13,NULL,'111.248.1.19','NCUMIS{the_catk_is_innokcent}','correct','2026-09-08 05:15:52.636711'),
(170,37,14,NULL,'49.216.205.246','NCUMIS{welcome_to_central_mis}','correct','2026-09-08 09:30:15.456893'),
(171,37,15,NULL,'219.69.231.106','NCUMIS{welcome_to_central_mis}','correct','2026-09-08 09:30:52.212426'),
(172,38,15,NULL,'219.69.231.106','NCUMIS{s王e閎nior_fle立d_to_kenting}','correct','2026-09-08 09:37:06.208574'),
(173,39,15,NULL,'219.69.231.106','NCUMIS{do_not_立touc\\347\\216\\213h_this_trash}','incorrect','2026-09-08 09:42:07.848658'),
(174,39,15,NULL,'219.69.231.106','{do_not_立touc\\347\\216\\213h_this_trash}','incorrect','2026-09-08 09:42:13.035056'),
(175,39,15,NULL,'219.69.231.106','{do_not_立touc\\347\\216\\213h_this_trash}','incorrect','2026-09-08 09:42:15.176062'),
(176,39,15,NULL,'219.69.231.106','NCUMIS{do_not_立t -->ouc\\347\\216\\213h_this_trash}','incorrect','2026-09-08 09:43:19.053320'),
(177,39,15,NULL,'219.69.231.106','NCUMIS{do_not_立touc\\347\\216\\213h_this_trash}','incorrect','2026-09-08 09:43:29.456659'),
(178,39,15,NULL,'219.69.231.106','NCUMIS{do_not_立t -->ouc\\347\\216\\213h_this_trash}','incorrect','2026-09-08 09:44:35.606967'),
(179,39,15,NULL,'219.69.231.106','NCUMIS{do_not_立t -->ouc\\347\\216\\213h_this_trash}','incorrect','2026-09-08 09:44:37.237753'),
(180,39,15,NULL,'219.69.231.106','NCUMIS{do_not_touch_this_trash}','incorrect','2026-09-08 09:45:13.973099'),
(181,39,15,NULL,'219.69.231.106','NCUMIS{do_not_立touc\\347\\216\\213h_this_trash}','incorrect','2026-09-08 09:46:21.317973'),
(182,39,15,NULL,'219.69.231.106','NCUMIS{do_not_立touch_this_trash}','incorrect','2026-09-08 09:46:30.322631'),
(183,39,15,NULL,'219.69.231.106','NCUMIS{do_not_立t\"ouc\\347\\216\\213h_this_trash}\"','incorrect','2026-09-08 09:47:48.174751'),
(184,39,15,NULL,'219.69.231.106','NCUMIS{do_not_立touc\\347\\216\\213h_this_trash}','incorrect','2026-09-08 09:47:54.763431'),
(185,39,15,NULL,'219.69.231.106','NCUMIS{do_not_立touc\\347\\216\\213h_this_trash}','incorrect','2026-09-08 09:47:57.103116'),
(186,39,15,NULL,'219.69.231.106','NCUMIS{do_not_立touc\\347\\216\\213h_this_trash}','incorrect','2026-09-08 09:48:03.647680'),
(187,39,15,NULL,'219.69.231.106','NCUMIS{do_not_立touc\\347\\216\\213h_this_trash}','incorrect','2026-09-08 09:48:09.660192'),
(188,39,15,NULL,'219.69.231.106','NCUMIS{do_not_touch_this_trash}','incorrect','2026-09-08 09:49:37.439495'),
(189,39,15,NULL,'219.69.231.106','NCUMIS{do_not_touch_this_trash}','incorrect','2026-09-08 09:49:40.735371'),
(190,38,14,NULL,'140.115.220.199','NCUMIS{senMhior_flead_to_kentinga}','correct','2026-09-08 10:22:49.803302'),
(191,39,14,NULL,'140.115.220.199','NCUMIS{do_naot_toMuch_thais_trash}','correct','2026-09-08 10:24:28.316414'),
(192,41,14,NULL,'140.115.220.199','NCUMIS{prohf_also_Moverslepta}','correct','2026-09-08 10:41:58.407786'),
(193,40,14,NULL,'140.115.220.199','NCUMIS{proif_please_sign_courseM}','incorrect','2026-09-08 10:43:51.352758'),
(194,40,14,NULL,'140.115.220.199','NCUMIS{proif_please_sign_course}','incorrect','2026-09-08 10:43:55.806485'),
(195,40,14,NULL,'140.115.220.199','NCUMIS{proif_please_sign_course}','incorrect','2026-09-08 10:44:00.905706'),
(196,40,14,NULL,'140.115.220.199','NCUMIS{prof_please_sign_courseM}','incorrect','2026-09-08 10:45:06.178980'),
(197,40,14,NULL,'140.115.220.199','NCUMIS{prof_please_sign_course}','incorrect','2026-09-08 10:45:10.008413'),
(198,40,14,NULL,'140.115.220.199','NCUMIS{prof_please_sign_coursem}','incorrect','2026-09-08 10:45:21.241720'),
(199,40,14,NULL,'140.115.220.199','NCUMIR{prof_please_sign_courseM}','incorrect','2026-09-08 10:45:25.918872'),
(200,40,14,NULL,'140.115.220.199','NCUMIS{prof_please_sign_course}','incorrect','2026-09-08 10:48:13.848835'),
(201,40,14,NULL,'140.115.220.199','NCUMIS{prof_please_sign_courseM}','incorrect','2026-09-08 10:48:26.075957'),
(202,40,14,NULL,'140.115.220.199','NCUMIR{prof_pleaase_sign_courseM}','incorrect','2026-09-08 10:50:37.392439'),
(203,40,14,NULL,'140.115.220.199','NCUMIR{prof_please_sign_courseM}','incorrect','2026-09-08 10:52:06.145075'),
(204,40,14,NULL,'140.115.220.199','NCUMIS{prof_pleaase_sign_courseM}','correct','2026-09-08 10:52:15.360914'),
(205,42,14,NULL,'140.115.220.199','NCUMIS{tMhae_cat_is_innoceant}','correct','2026-09-08 10:57:49.715513'),
(206,43,14,NULL,'140.115.220.199','NCUMIS{gradauation_ias_Ma_lie}','correct','2026-09-08 11:04:24.713401'),
(207,39,15,NULL,'219.69.231.106','NCUMIS{do_not_立touc\\347\\216\\213h_this_trash}','incorrect','2026-09-08 14:47:17.437012'),
(208,39,15,NULL,'219.69.231.106','NCUMIS{do_not_立touc\\347\\216\\213h_this_trash}','incorrect','2026-09-08 14:47:18.780977'),
(209,39,15,NULL,'219.69.231.106','NCUMIS{do_not_立ouc\\347\\216\\213h_this_trash}','incorrect','2026-09-08 14:48:22.819917'),
(210,39,15,NULL,'219.69.231.106','NCUMIS{do_not_立touc\\347\\216\\213h_this_trash}','incorrect','2026-09-08 14:48:35.341625'),
(211,39,15,NULL,'219.69.231.106','NCUMIS{do_not_立touc\\347\\216\\213h_this_trash}','incorrect','2026-09-08 14:48:38.923476'),
(212,39,15,NULL,'219.69.231.106','NCUMIS{do_not_立touc\\347\\216\\213h_this_trash}','incorrect','2026-09-08 14:48:48.537093'),
(213,39,15,NULL,'219.69.231.106','NCUMIS{do_not_立touc\\347\\216\\213h_this_trash}','incorrect','2026-09-08 14:50:42.711203'),
(214,39,15,NULL,'219.69.231.106','NCUMIS{do_not_立touc\\347\\216\\213h_this_trash}','incorrect','2026-09-08 14:51:01.228516'),
(215,39,15,NULL,'219.69.231.106','NCUMIS{do_not_立\"ouc\\347\\216\\213h_this_trash}\"','incorrect','2026-09-08 14:52:41.863503'),
(216,39,15,NULL,'219.69.231.106','NCUMIS{do_not_立\"ouc\\347\\216\\213h_this_trash}\"','incorrect','2026-09-08 14:52:44.121061'),
(217,39,15,NULL,'219.69.231.106','NCUMIS{do_not_立t\"ouc\\347\\216\\213h_this_trash}\"','incorrect','2026-09-08 14:52:52.175725'),
(218,39,15,NULL,'219.69.231.106','NCUMIS{do_not_立t\"ouc\\347\\216\\213h_this_trash}\"','incorrect','2026-09-08 14:53:04.164565'),
(219,39,15,NULL,'219.69.231.106','NCUMIS{do_not_立touc\\347\\216\\213h_this_trash}','incorrect','2026-09-08 14:53:09.585754'),
(220,39,15,NULL,'219.69.231.106','NCUMIS{do_not_立touc\\347\\216\\213h_this_trash}','incorrect','2026-09-08 14:53:17.472528'),
(221,39,15,NULL,'219.69.231.106','{do_not_立touc\\347\\216\\213h_this_trash}','incorrect','2026-09-08 14:53:28.871908'),
(222,39,15,NULL,'219.69.231.106','do_not_立touc\\347\\216\\213h_this_trash','incorrect','2026-09-08 14:53:32.452480'),
(223,39,15,NULL,'219.69.231.106','do_not_touch_this_trash','incorrect','2026-09-08 14:53:39.119006'),
(224,39,15,NULL,'219.69.231.106','NCUMIS{do_not_立touc\\347\\216\\213h_this_trash}','incorrect','2026-09-08 14:55:23.323558'),
(225,39,15,NULL,'219.69.231.106','NCUMIS{do_not_立tthis_trash}','incorrect','2026-09-08 14:57:35.745502'),
(226,39,15,NULL,'219.69.231.106','NCUMIS{do_not_立touc\\347\\216\\213h_this_trash}','incorrect','2026-09-08 14:59:21.021455'),
(227,39,15,NULL,'219.69.231.106','NCUMIS{do_not_touch_this_trash}','incorrect','2026-09-08 14:59:30.013063'),
(228,39,15,NULL,'219.69.231.106','NCUMIS{do_not_touch_this_trash}','incorrect','2026-09-08 14:59:34.576325'),
(229,39,15,NULL,'219.69.231.106','NCUMIS{do_not_立touc\\347\\216\\213h_this_trash}','incorrect','2026-09-08 15:03:49.106338'),
(230,43,13,NULL,'111.248.1.19','NCUMIS{grkaduation_is_a_like}','correct','2026-09-08 16:38:50.426178'),
(231,37,16,NULL,'42.73.136.51','NCUMIS{welcome_to_central_mis}','correct','2026-09-10 00:19:05.634993');
/*!40000 ALTER TABLE `submissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge_id` int(11) DEFAULT NULL,
  `value` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tags_ibfk_1` (`challenge_id`),
  CONSTRAINT `tags_ibfk_1` FOREIGN KEY (`challenge_id`) REFERENCES `challenges` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=128 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES
(107,37,'Welcome'),
(108,37,'Beginner'),
(109,37,'Misc'),
(110,38,'OSINT'),
(111,38,'Campus'),
(112,38,'Misc'),
(113,39,'Web'),
(114,39,'DevTools'),
(115,39,'Beginner'),
(116,40,'Crypto'),
(117,40,'Base64'),
(118,40,'Caesar'),
(119,41,'Web'),
(120,41,'SQLi'),
(121,41,'Injection'),
(122,42,'Forensics'),
(123,42,'Stego'),
(124,42,'Zip'),
(125,43,'Reverse'),
(126,43,'Binary'),
(127,43,'Strings');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `teams` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oauth_id` int(11) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `secret` varchar(128) DEFAULT NULL,
  `website` varchar(128) DEFAULT NULL,
  `affiliation` varchar(128) DEFAULT NULL,
  `country` varchar(32) DEFAULT NULL,
  `hidden` tinyint(1) DEFAULT NULL,
  `banned` tinyint(1) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `captain_id` int(11) DEFAULT NULL,
  `bracket_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `id` (`id`,`oauth_id`),
  UNIQUE KEY `oauth_id` (`oauth_id`),
  KEY `team_captain_id` (`captain_id`),
  KEY `bracket_id` (`bracket_id`),
  CONSTRAINT `team_captain_id` FOREIGN KEY (`captain_id`) REFERENCES `users` (`id`) ON DELETE SET NULL,
  CONSTRAINT `teams_ibfk_1` FOREIGN KEY (`bracket_id`) REFERENCES `brackets` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tokens`
--

DROP TABLE IF EXISTS `tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `expiration` datetime(6) DEFAULT NULL,
  `value` varchar(128) DEFAULT NULL,
  `description` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `value` (`value`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tokens`
--

LOCK TABLES `tokens` WRITE;
/*!40000 ALTER TABLE `tokens` DISABLE KEYS */;
INSERT INTO `tokens` VALUES
(1,'user',1,'2026-09-04 17:52:02.473344','2026-09-05 00:00:00.000000','ctfd_293a3695bfeda95fa67a86569d9d7831da49cfd01872576f5286a65a3cf39d3f','1213456');
/*!40000 ALTER TABLE `tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `topics`
--

DROP TABLE IF EXISTS `topics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `topics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `value` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `value` (`value`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `topics`
--

LOCK TABLES `topics` WRITE;
/*!40000 ALTER TABLE `topics` DISABLE KEYS */;
INSERT INTO `topics` VALUES
(1,'簽到題');
/*!40000 ALTER TABLE `topics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tracking`
--

DROP TABLE IF EXISTS `tracking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tracking` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) DEFAULT NULL,
  `ip` varchar(46) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date` datetime(6) DEFAULT NULL,
  `target` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tracking_ibfk_1` (`user_id`),
  CONSTRAINT `tracking_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tracking`
--

LOCK TABLES `tracking` WRITE;
/*!40000 ALTER TABLE `tracking` DISABLE KEYS */;
INSERT INTO `tracking` VALUES
(2,NULL,'140.115.220.7',1,'2026-09-09 13:52:07.281132',NULL),
(3,NULL,'138.199.22.100',1,'2026-08-25 12:56:24.370921',NULL),
(4,NULL,'146.70.246.170',1,'2026-08-26 14:57:44.517567',NULL),
(31,NULL,'42.73.132.5',6,'2026-09-03 11:34:36.030809',NULL),
(32,'challenges.open','42.73.132.5',6,'2026-09-03 10:10:21.231614',37),
(33,'challenges.open','42.73.132.5',6,'2026-09-03 10:11:02.018591',38),
(34,'challenges.open','42.73.132.5',6,'2026-09-03 10:13:00.254825',43),
(35,'challenges.open','42.73.132.5',6,'2026-09-03 10:13:11.029543',39),
(36,'challenges.open','42.73.132.5',6,'2026-09-03 11:19:16.630686',41),
(37,'challenges.open','42.73.132.5',6,'2026-09-03 11:24:21.539958',40),
(38,'challenges.open','42.73.132.5',6,'2026-09-03 11:27:19.620566',42),
(39,NULL,'49.218.138.156',7,'2026-09-03 18:54:13.516804',NULL),
(40,'challenges.open','49.218.138.156',7,'2026-09-03 18:00:05.924163',37),
(41,'challenges.open','49.218.138.156',7,'2026-09-03 18:01:00.663122',38),
(42,'challenges.open','49.218.138.156',7,'2026-09-03 18:02:58.239644',39),
(43,'challenges.open','49.218.138.156',7,'2026-09-03 18:24:57.813192',41),
(44,'challenges.open','49.218.138.156',7,'2026-09-03 18:31:32.316086',40),
(45,'challenges.open','49.218.138.156',7,'2026-09-03 18:35:46.523061',42),
(46,'challenges.open','49.218.138.156',7,'2026-09-03 18:46:59.532994',43),
(47,NULL,'111.249.23.149',8,'2026-09-04 17:47:32.499956',NULL),
(48,NULL,'211.23.197.201',9,'2026-09-08 16:09:11.996611',NULL),
(49,'challenges.open','111.249.23.149',8,'2026-09-04 16:38:07.883173',37),
(50,'challenges.open','111.249.23.149',8,'2026-09-04 16:38:20.554209',43),
(51,'challenges.open','211.23.197.201',9,'2026-09-04 16:38:52.917397',37),
(52,'challenges.open','211.23.197.201',9,'2026-09-04 16:39:03.516019',38),
(53,'challenges.open','211.23.197.201',9,'2026-09-04 16:41:05.830136',39),
(54,'challenges.open','211.23.197.201',9,'2026-09-04 16:42:53.415303',41),
(55,'challenges.open','211.23.197.201',9,'2026-09-04 16:45:35.120391',40),
(56,'challenges.open','111.249.23.149',8,'2026-09-04 16:46:01.219507',38),
(57,'challenges.open','111.249.23.149',8,'2026-09-04 16:48:03.572160',39),
(58,'challenges.open','211.23.197.201',9,'2026-09-04 16:49:17.128460',42),
(59,'challenges.open','211.23.197.201',9,'2026-09-04 16:51:24.535973',43),
(60,'challenges.open','111.249.23.149',8,'2026-09-04 16:51:46.616107',41),
(61,'challenges.open','111.249.23.149',8,'2026-09-04 16:54:13.723705',40),
(62,'challenges.open','111.249.23.149',8,'2026-09-04 16:55:29.943964',42),
(67,NULL,'27.247.5.64',11,'2026-09-08 06:52:03.541883',NULL),
(68,'challenges.open','27.247.5.64',11,'2026-09-07 01:02:12.601454',37),
(69,'challenges.open','27.247.5.64',11,'2026-09-07 01:02:42.573288',38),
(70,'challenges.open','27.247.5.64',11,'2026-09-07 01:06:00.356680',39),
(71,'challenges.open','27.247.5.64',11,'2026-09-07 01:09:31.365712',41),
(72,'challenges.open','27.247.5.64',11,'2026-09-07 01:13:14.730351',40),
(73,'challenges.open','27.247.5.64',11,'2026-09-07 01:18:30.410990',42),
(74,'challenges.open','27.247.5.64',11,'2026-09-07 01:24:11.149968',43),
(75,NULL,'140.115.83.173',8,'2026-09-09 07:52:11.129610',NULL),
(76,NULL,'118.231.145.194',12,'2026-09-08 04:23:54.493802',NULL),
(77,'challenges.open','118.231.145.194',12,'2026-09-07 07:15:02.424732',37),
(78,'challenges.open','118.231.145.194',12,'2026-09-07 07:15:13.135463',38),
(79,'challenges.open','118.231.145.194',12,'2026-09-07 07:15:58.943094',39),
(80,'challenges.open','118.231.145.194',12,'2026-09-07 07:18:29.219147',41),
(81,'challenges.open','118.231.145.194',12,'2026-09-07 07:20:18.314241',40),
(82,'challenges.open','118.231.145.194',12,'2026-09-07 07:23:51.127024',42),
(83,'challenges.open','118.231.145.194',12,'2026-09-07 07:33:53.409946',43),
(84,NULL,'140.115.83.178',8,'2026-09-07 12:14:16.527438',NULL),
(85,NULL,'42.73.231.115',8,'2026-09-09 07:59:16.157994',NULL),
(86,NULL,'140.115.83.171',12,'2026-09-08 03:29:44.599316',NULL),
(87,NULL,'111.248.1.19',13,'2026-09-10 13:56:05.038340',NULL),
(88,'challenges.open','111.248.1.19',13,'2026-09-08 03:48:18.765049',37),
(89,'challenges.open','111.248.1.19',13,'2026-09-08 03:48:50.532965',38),
(90,'challenges.open','111.248.1.19',13,'2026-09-08 03:55:22.244714',39),
(91,'challenges.open','111.248.1.19',13,'2026-09-08 04:50:19.738781',41),
(92,'challenges.open','111.248.1.19',13,'2026-09-08 04:59:53.431993',40),
(93,'challenges.open','111.248.1.19',13,'2026-09-08 05:02:49.343457',42),
(94,'challenges.open','111.248.1.19',13,'2026-09-08 05:16:07.939364',43),
(95,NULL,'49.216.30.30',7,'2026-09-08 06:32:05.760947',NULL),
(96,NULL,'49.216.205.246',14,'2026-09-12 11:59:50.091646',NULL),
(97,'challenges.open','49.216.205.246',14,'2026-09-08 09:30:00.827158',37),
(98,'challenges.open','49.216.205.246',14,'2026-09-08 09:30:21.544476',38),
(99,NULL,'219.69.231.106',15,'2026-09-08 15:03:49.075195',NULL),
(100,'challenges.open','219.69.231.106',15,'2026-09-08 09:30:36.837022',37),
(101,'challenges.open','219.69.231.106',15,'2026-09-08 09:31:07.622330',38),
(102,'challenges.open','219.69.231.106',15,'2026-09-08 09:37:15.520717',39),
(103,NULL,'1.160.138.194',8,'2026-09-09 02:03:58.513326',NULL),
(104,NULL,'140.115.220.199',14,'2026-09-11 01:48:12.107760',NULL),
(105,'challenges.open','140.115.220.199',14,'2026-09-08 10:23:21.121335',39),
(106,'challenges.open','140.115.220.199',14,'2026-09-08 10:24:31.525237',41),
(107,'challenges.open','140.115.220.199',14,'2026-09-08 10:42:02.528006',40),
(108,'challenges.open','140.115.220.199',14,'2026-09-08 10:46:14.106677',42),
(109,'challenges.open','140.115.220.199',14,'2026-09-08 10:58:08.005519',43),
(110,NULL,'127.0.0.1',1,'2026-09-08 12:14:43.044105',NULL),
(111,NULL,'111.243.146.149',8,'2026-09-09 01:29:36.494262',NULL),
(112,NULL,'111.243.146.149',8,'2026-09-08 13:17:49.837474',NULL),
(113,'challenges.open','219.69.231.106',15,'2026-09-08 14:53:59.411390',41),
(114,'challenges.open','219.69.231.106',15,'2026-09-08 14:54:02.515106',40),
(115,'challenges.open','219.69.231.106',15,'2026-09-08 14:54:04.336108',42),
(116,'challenges.open','219.69.231.106',15,'2026-09-08 14:54:06.123465',43),
(117,NULL,'42.72.187.61',13,'2026-09-09 06:08:07.875538',NULL),
(118,NULL,'140.115.83.179',8,'2026-09-09 07:00:29.903598',NULL),
(119,NULL,'42.73.136.51',16,'2026-09-10 00:19:28.337652',NULL),
(120,'challenges.open','42.73.136.51',16,'2026-09-10 00:18:31.645319',37),
(121,'challenges.open','42.73.136.51',16,'2026-09-10 00:19:42.965190',38),
(122,'challenges.open','42.73.136.51',16,'2026-09-10 00:21:09.270830',39),
(123,'challenges.open','42.73.136.51',16,'2026-09-10 00:21:21.035834',42),
(124,NULL,'49.216.206.84',14,'2026-09-10 00:28:36.323634',NULL),
(125,NULL,'49.216.206.84',14,'2026-09-10 00:28:36.324348',NULL),
(126,NULL,'49.216.206.84',14,'2026-09-10 00:28:36.325045',NULL),
(127,NULL,'49.216.206.84',14,'2026-09-10 00:28:36.325718',NULL),
(128,NULL,'42.73.158.114',16,'2026-09-10 01:06:24.425598',NULL),
(129,NULL,'111.249.21.122',8,'2026-09-10 03:00:19.488392',NULL),
(130,NULL,'36.225.150.135',8,'2026-09-10 03:12:49.619846',NULL),
(131,NULL,'36.225.150.135',8,'2026-09-10 03:12:49.608767',NULL),
(132,NULL,'36.225.150.135',8,'2026-09-10 03:12:49.610731',NULL),
(133,NULL,'36.225.150.135',8,'2026-09-10 03:12:49.630280',NULL),
(134,NULL,'42.72.138.164',13,'2026-09-10 05:50:53.891412',NULL),
(135,NULL,'101.12.100.84',13,'2026-09-10 12:14:03.210397',NULL),
(136,NULL,'49.216.206.86',14,'2026-09-11 09:26:34.405924',NULL),
(137,NULL,'49.216.206.86',14,'2026-09-11 07:21:02.031876',NULL),
(138,NULL,'49.216.206.86',14,'2026-09-11 07:21:02.126160',NULL),
(139,NULL,'36.228.244.154',14,'2026-09-11 12:22:29.073171',NULL),
(140,NULL,'36.228.244.154',14,'2026-09-11 12:22:29.074345',NULL),
(141,NULL,'140.115.82.100',1,'2026-09-12 06:55:38.719563',NULL);
/*!40000 ALTER TABLE `tracking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unlocks`
--

DROP TABLE IF EXISTS `unlocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `unlocks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `target` int(11) DEFAULT NULL,
  `date` datetime(6) DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `unlocks_ibfk_1` (`team_id`),
  KEY `unlocks_ibfk_2` (`user_id`),
  CONSTRAINT `unlocks_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE,
  CONSTRAINT `unlocks_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unlocks`
--

LOCK TABLES `unlocks` WRITE;
/*!40000 ALTER TABLE `unlocks` DISABLE KEYS */;
INSERT INTO `unlocks` VALUES
(1,1,NULL,28,'2026-08-24 22:16:04.822889','hints'),
(2,1,NULL,35,'2026-08-27 06:47:51.609905','hints'),
(3,1,NULL,46,'2026-08-27 12:27:56.977106','hints'),
(4,1,NULL,47,'2026-08-27 12:28:07.391095','hints'),
(5,1,NULL,44,'2026-08-29 15:34:19.360656','hints'),
(6,1,NULL,45,'2026-08-29 15:34:31.266650','hints'),
(7,1,NULL,50,'2026-08-29 17:27:41.128228','hints'),
(8,1,NULL,63,'2026-08-29 17:31:45.744019','hints'),
(9,1,NULL,72,'2026-08-29 17:41:06.117149','hints'),
(10,1,NULL,94,'2026-08-29 18:15:58.158890','hints'),
(11,1,NULL,95,'2026-08-29 18:16:41.094976','hints'),
(12,1,NULL,113,'2026-08-29 19:42:05.708699','hints'),
(13,1,NULL,114,'2026-08-29 19:42:12.053377','hints'),
(14,1,NULL,103,'2026-08-29 20:29:52.428884','hints'),
(15,1,NULL,104,'2026-08-29 20:29:57.471672','hints'),
(16,1,NULL,110,'2026-08-29 20:30:51.831685','hints'),
(17,1,NULL,109,'2026-08-29 20:32:01.539605','hints'),
(22,1,NULL,105,'2026-09-01 04:23:59.194387','hints'),
(23,1,NULL,106,'2026-09-01 04:24:04.072903','hints'),
(24,6,NULL,102,'2026-09-03 11:02:17.325832','hints'),
(25,7,NULL,102,'2026-09-03 18:00:15.653756','hints'),
(26,11,NULL,102,'2026-09-07 01:02:26.518983','hints'),
(27,11,NULL,103,'2026-09-07 01:04:05.618660','hints'),
(28,11,NULL,104,'2026-09-07 01:04:54.759671','hints'),
(29,11,NULL,109,'2026-09-07 01:11:19.901646','hints'),
(30,11,NULL,110,'2026-09-07 01:12:25.111102','hints'),
(31,11,NULL,108,'2026-09-07 01:16:14.183369','hints'),
(32,11,NULL,111,'2026-09-07 01:19:40.369358','hints'),
(33,11,NULL,112,'2026-09-07 01:23:08.378199','hints'),
(34,13,NULL,103,'2026-09-08 03:50:59.865949','hints'),
(35,13,NULL,109,'2026-09-08 04:55:43.926227','hints'),
(36,13,NULL,111,'2026-09-08 05:04:32.705254','hints'),
(37,13,NULL,112,'2026-09-08 05:09:25.247592','hints'),
(38,15,NULL,103,'2026-09-08 09:32:28.892839','hints'),
(39,15,NULL,104,'2026-09-08 09:33:37.920202','hints'),
(40,15,NULL,106,'2026-09-08 09:43:35.219560','hints'),
(41,15,NULL,105,'2026-09-08 09:43:46.244270','hints');
/*!40000 ALTER TABLE `unlocks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `oauth_id` int(11) DEFAULT NULL,
  `name` varchar(128) DEFAULT NULL,
  `password` varchar(128) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `type` varchar(80) DEFAULT NULL,
  `secret` varchar(128) DEFAULT NULL,
  `website` varchar(128) DEFAULT NULL,
  `affiliation` varchar(128) DEFAULT NULL,
  `country` varchar(32) DEFAULT NULL,
  `hidden` tinyint(1) DEFAULT NULL,
  `banned` tinyint(1) DEFAULT NULL,
  `verified` tinyint(1) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `created` datetime(6) DEFAULT NULL,
  `language` varchar(32) DEFAULT NULL,
  `bracket_id` int(11) DEFAULT NULL,
  `change_password` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `id` (`id`,`oauth_id`),
  UNIQUE KEY `oauth_id` (`oauth_id`),
  KEY `team_id` (`team_id`),
  KEY `bracket_id` (`bracket_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`),
  CONSTRAINT `users_ibfk_2` FOREIGN KEY (`bracket_id`) REFERENCES `brackets` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES
(1,NULL,'g1014308','$bcrypt-sha256$v=2,t=2b,r=12$Sz8pWfRpYVUTmiw.x8hflu$2Rm5SHq7QpxsuWvmspaKaWXFr6PkZnq','g1014308@gmail.com','admin',NULL,NULL,NULL,NULL,1,0,0,NULL,'2026-08-24 19:34:28.513485','zh_TW',NULL,0),
(6,NULL,'阿柳','$bcrypt-sha256$v=2,t=2b,r=12$.kl7IVnvpviekIu2i4Phce$8k/KzR9tgi8EbmoUAO8HiZtWhrjYhs6','115423075@g.ncu.edu.tw','user',NULL,NULL,NULL,NULL,0,0,0,NULL,'2026-09-03 10:10:17.144465',NULL,NULL,0),
(7,NULL,'暨魚','$bcrypt-sha256$v=2,t=2b,r=12$8r.sBEqLIaV9cLiReBVT6.$BJTIYjFwiLzV8wqtGygq2UtR9Oi1S/6','joanna101618@gmail.com','user',NULL,NULL,NULL,NULL,0,0,0,NULL,'2026-09-03 17:59:52.210792',NULL,NULL,0),
(8,NULL,'chen','$bcrypt-sha256$v=2,t=2b,r=12$/ISBB9zbuMoEV/S/AEq6re$rQA3J55THzwCmb60tH3wSraXCCrR4GS','bella92.tai@gmail.com','user',NULL,NULL,NULL,NULL,0,0,0,NULL,'2026-09-04 16:37:32.154760','zh_TW',NULL,0),
(9,NULL,'Thanatos','$bcrypt-sha256$v=2,t=2b,r=12$PeSUXP9P971z993zfUJFGO$hZddv3fA8.h.EeAdPT11LInv1MqiQFO','thanatosjun@gmail.com','user',NULL,NULL,'CYM',NULL,0,0,0,NULL,'2026-09-04 16:37:43.810054',NULL,NULL,0),
(11,NULL,'mason45ok','$bcrypt-sha256$v=2,t=2b,r=12$7mx1fohTeYGpxNhiXMSzWe$uuedvNfm3I5mW1dkyD0mTyWryDp6vSm','115423060@g.ncu.edu.tw','user',NULL,NULL,NULL,NULL,0,0,0,NULL,'2026-09-07 01:02:04.397919',NULL,NULL,0),
(12,NULL,'Jun','$bcrypt-sha256$v=2,t=2b,r=12$WsTGBHmQd0BaczbLf.xFWu$jQP6fLugBq7CZLQqcf4c/8YF/KE7FHy','114423021@cc.ncu.edu.tw','user',NULL,NULL,NULL,NULL,0,0,0,NULL,'2026-09-07 07:15:00.371968',NULL,NULL,0),
(13,NULL,'kk','$bcrypt-sha256$v=2,t=2b,r=12$fQO8uaLhVRzn9GR11rHelO$ZiL8iDlrtYBmgWHwilx81xoawFywIZC','kiki14121412@gmail.com','user',NULL,NULL,NULL,NULL,0,0,0,NULL,'2026-09-08 03:48:13.771992',NULL,NULL,0),
(14,NULL,'Matcha','$bcrypt-sha256$v=2,t=2b,r=12$v9YFaS5RPbPSlmj4IfqrX.$ODdMuTxeSqH/y/ZIw0m7jNVl/JOjRtG','matchaskill@gmail.com','user',NULL,NULL,NULL,NULL,0,0,0,NULL,'2026-09-08 09:29:57.822664',NULL,NULL,0),
(15,NULL,'王閎立','$bcrypt-sha256$v=2,t=2b,r=12$DBKWnRaFCqcEyxZWaGplou$2Dnrbh1RqIeGnaCgXtlC8enCRlCxRcG','hw453176@gmail.com','user',NULL,NULL,NULL,NULL,0,0,0,NULL,'2026-09-08 09:30:25.618631',NULL,NULL,0),
(16,NULL,'Chiao','$bcrypt-sha256$v=2,t=2b,r=12$JrdOHjH3sHWFJOPq.0m7je$fTrF9WLpqcw3D/4WV96SjbsJEqA1nzW','joanna20031026@gmail.com','user',NULL,NULL,NULL,NULL,0,0,0,NULL,'2026-09-10 00:18:21.467327',NULL,NULL,0);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-12 19:02:16

-- =====================================================
-- Migration 1069: Create Live Help Legacy Tables
-- =====================================================
-- WHO: PORTUNUS Migration Steward
-- WHAT: Recreate the Sales Syntax (livehelp_*) tables inside LUPOPEDIA
-- WHEN: 2025-11-08
-- WHY: Provide schema parity before streaming legacy data
-- HOW: Creates legacy tables with modern storage defaults (InnoDB + utf8mb4)
-- Note: Structure only (no seed data). Import pipeline will populate records.
-- =====================================================

-- Table definitions (mirror database/schema/salessyntax.sql)

CREATE TABLE IF NOT EXISTS `livehelp_autoinvite` (
  `idnum` int(10) NOT NULL,
  `offline` int(1) NOT NULL DEFAULT 0,
  `isactive` char(1) NOT NULL DEFAULT '',
  `department` int(10) NOT NULL DEFAULT 0,
  `message` text DEFAULT NULL,
  `page` varchar(255) NOT NULL DEFAULT '',
  `visits` int(8) NOT NULL DEFAULT 0,
  `referer` varchar(255) NOT NULL DEFAULT '',
  `typeof` varchar(255) NOT NULL DEFAULT '',
  `seconds` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `user_id` int(10) NOT NULL DEFAULT 0,
  `socialpane` char(1) NOT NULL DEFAULT 'N',
  `excludemobile` char(1) NOT NULL DEFAULT 'N',
  `onlymobile` char(1) NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `livehelp_channels` (
  `id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL DEFAULT 0,
  `statusof` char(1) NOT NULL DEFAULT '',
  `startdate` bigint(8) NOT NULL DEFAULT 0,
  `sessionid` varchar(40) NOT NULL DEFAULT '',
  `website` int(8) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `livehelp_config` (
  `version` varchar(25) NOT NULL DEFAULT '3.7.0',
  `site_title` varchar(100) NOT NULL DEFAULT '',
  `use_flush` varchar(10) NOT NULL DEFAULT 'YES',
  `membernum` int(8) NOT NULL DEFAULT 0,
  `offset` float(8,2) NOT NULL DEFAULT 0.00,
  `show_typing` char(1) NOT NULL DEFAULT '',
  `webpath` varchar(255) NOT NULL DEFAULT '',
  `s_webpath` varchar(255) NOT NULL DEFAULT '',
  `speaklanguage` varchar(60) NOT NULL DEFAULT 'English',
  `scratch_space` text DEFAULT NULL,
  `admin_refresh` varchar(30) NOT NULL DEFAULT 'auto',
  `maxexe` int(5) DEFAULT 180,
  `refreshrate` int(5) NOT NULL DEFAULT 1,
  `chatmode` varchar(60) NOT NULL DEFAULT 'xmlhttp-flush-refresh',
  `adminsession` char(1) NOT NULL DEFAULT 'Y',
  `ignoreips` text DEFAULT NULL,
  `directoryid` varchar(32) NOT NULL DEFAULT '',
  `tracking` char(1) NOT NULL DEFAULT 'N',
  `colorscheme` varchar(30) NOT NULL DEFAULT 'white',
  `matchip` char(1) NOT NULL DEFAULT 'N',
  `gethostnames` char(1) NOT NULL DEFAULT 'N',
  `maxrecords` int(10) NOT NULL DEFAULT 75000,
  `maxreferers` int(10) NOT NULL DEFAULT 50,
  `maxvisits` int(10) NOT NULL DEFAULT 75,
  `maxmonths` int(10) NOT NULL DEFAULT 12,
  `maxoldhits` int(10) NOT NULL DEFAULT 1,
  `showgames` char(1) NOT NULL DEFAULT 'Y',
  `showsearch` char(1) NOT NULL DEFAULT 'Y',
  `showdirectory` char(1) NOT NULL DEFAULT 'Y',
  `usertracking` char(1) NOT NULL DEFAULT 'N',
  `resetbutton` char(1) NOT NULL DEFAULT 'N',
  `keywordtrack` char(1) NOT NULL DEFAULT 'N',
  `reftracking` char(1) NOT NULL DEFAULT 'N',
  `topkeywords` int(10) NOT NULL DEFAULT 50,
  `everythingelse` text DEFAULT NULL,
  `rememberusers` char(1) NOT NULL DEFAULT 'Y',
  `smtp_host` varchar(255) NOT NULL DEFAULT '',
  `smtp_username` varchar(60) NOT NULL DEFAULT '',
  `smtp_password` varchar(60) NOT NULL DEFAULT '',
  `owner_email` varchar(255) NOT NULL DEFAULT '',
  `topframeheight` int(8) NOT NULL DEFAULT 85,
  `topbackground` varchar(156) NOT NULL DEFAULT 'header_images/customersupports.png',
  `usecookies` char(1) NOT NULL DEFAULT 'Y',
  `smtp_portnum` int(10) NOT NULL DEFAULT 25,
  `showoperator` char(1) NOT NULL DEFAULT 'Y',
  `chatcolors` text DEFAULT NULL,
  `floatxy` varchar(42) NOT NULL DEFAULT '200|160',
  `sessiontimeout` int(8) NOT NULL DEFAULT 60,
  `theme` varchar(42) NOT NULL DEFAULT 'vanilla',
  `operatorstimeout` int(4) NOT NULL DEFAULT 4,
  `operatorssessionout` int(8) NOT NULL DEFAULT 45,
  `maxrequests` int(8) NOT NULL DEFAULT 99999,
  `ignoreagent` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `livehelp_departments` (
  `recno` int(5) NOT NULL,
  `nameof` varchar(30) NOT NULL DEFAULT '',
  `onlineimage` varchar(255) NOT NULL DEFAULT '',
  `offlineimage` varchar(255) NOT NULL DEFAULT '',
  `layerinvite` varchar(255) NOT NULL DEFAULT '',
  `requirename` char(1) NOT NULL DEFAULT '',
  `messageemail` varchar(60) NOT NULL DEFAULT '',
  `leaveamessage` varchar(10) NOT NULL DEFAULT '',
  `opening` text DEFAULT NULL,
  `offline` text DEFAULT NULL,
  `creditline` char(1) NOT NULL DEFAULT 'L',
  `imagemap` text DEFAULT NULL,
  `whilewait` text DEFAULT NULL,
  `timeout` int(5) NOT NULL DEFAULT 150,
  `leavetxt` text DEFAULT NULL,
  `topframeheight` int(10) NOT NULL DEFAULT 85,
  `topbackground` varchar(255) NOT NULL DEFAULT '',
  `botbackground` varchar(255) NOT NULL DEFAULT '',
  `midbackground` varchar(255) NOT NULL DEFAULT '',
  `topbackcolor` varchar(255) NOT NULL DEFAULT '',
  `midbackcolor` varchar(255) NOT NULL DEFAULT '',
  `botbackcolor` varchar(255) NOT NULL DEFAULT '',
  `colorscheme` varchar(255) NOT NULL DEFAULT '',
  `speaklanguage` varchar(60) NOT NULL DEFAULT '',
  `busymess` text DEFAULT NULL,
  `emailfun` char(1) NOT NULL DEFAULT 'Y',
  `dbfun` char(1) NOT NULL DEFAULT 'Y',
  `everythingelse` text DEFAULT NULL,
  `ordering` int(8) NOT NULL DEFAULT 0,
  `smiles` char(1) NOT NULL DEFAULT 'Y',
  `visible` int(1) NOT NULL DEFAULT 1,
  `theme` varchar(45) NOT NULL DEFAULT 'vanilla',
  `showtimestamp` char(1) NOT NULL DEFAULT 'N',
  `website` int(8) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `livehelp_emailque` (
  `id` int(8) NOT NULL,
  `messageid` int(8) NOT NULL,
  `towho` varchar(60) NOT NULL,
  `dateof` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `livehelp_emails` (
  `id` int(8) NOT NULL,
  `fromemail` varchar(60) NOT NULL,
  `subject` varchar(60) NOT NULL,
  `bodyof` text NOT NULL,
  `notes` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `livehelp_identity_daily` (
  `id` int(11) UNSIGNED NOT NULL,
  `isnamed` char(1) NOT NULL DEFAULT 'N',
  `groupidentity` int(11) NOT NULL DEFAULT 0,
  `groupusername` int(11) NOT NULL DEFAULT 0,
  `identity` varchar(100) NOT NULL DEFAULT '',
  `cookieid` varchar(40) NOT NULL DEFAULT '',
  `ipaddress` varchar(30) NOT NULL DEFAULT '',
  `username` varchar(100) NOT NULL DEFAULT '',
  `dateof` bigint(14) NOT NULL DEFAULT 0,
  `uservisits` int(10) NOT NULL DEFAULT 0,
  `seconds` int(10) NOT NULL DEFAULT 0,
  `useragent` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `livehelp_identity_monthly` (
  `id` int(11) UNSIGNED NOT NULL,
  `isnamed` char(1) NOT NULL DEFAULT 'N',
  `groupidentity` int(11) NOT NULL DEFAULT 0,
  `groupusername` int(11) NOT NULL DEFAULT 0,
  `identity` varchar(100) NOT NULL DEFAULT '',
  `cookieid` varchar(40) NOT NULL DEFAULT '',
  `ipaddress` varchar(30) NOT NULL DEFAULT '',
  `username` varchar(100) NOT NULL DEFAULT '',
  `dateof` bigint(14) NOT NULL DEFAULT 0,
  `uservisits` int(10) NOT NULL DEFAULT 0,
  `seconds` int(10) NOT NULL DEFAULT 0,
  `useragent` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `livehelp_keywords_daily` (
  `recno` int(11) NOT NULL,
  `parentrec` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `referer` varchar(255) NOT NULL DEFAULT '',
  `pageurl` varchar(255) NOT NULL DEFAULT '',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `dateof` int(8) NOT NULL DEFAULT 0,
  `levelvisits` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `directvisits` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `department` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `livehelp_keywords_monthly` (
  `recno` int(11) NOT NULL,
  `parentrec` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `referer` varchar(255) NOT NULL DEFAULT '',
  `pageurl` varchar(255) NOT NULL DEFAULT '',
  `keywords` varchar(255) NOT NULL DEFAULT '',
  `dateof` int(8) NOT NULL DEFAULT 0,
  `levelvisits` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `directvisits` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `department` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `livehelp_layerinvites` (
  `layerid` int(10) NOT NULL DEFAULT 0,
  `name` varchar(60) NOT NULL DEFAULT '',
  `imagename` varchar(60) NOT NULL DEFAULT '',
  `imagemap` text DEFAULT NULL,
  `department` varchar(60) NOT NULL DEFAULT '',
  `user` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `livehelp_leads` (
  `id` int(8) NOT NULL,
  `email` varchar(90) NOT NULL,
  `phone` varchar(90) NOT NULL,
  `source` varchar(45) NOT NULL,
  `status` varchar(10) NOT NULL,
  `data` text NOT NULL,
  `firstname` varchar(40) NOT NULL,
  `lastname` varchar(40) NOT NULL,
  `date_entered` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `livehelp_leavemessage` (
  `id` int(11) UNSIGNED NOT NULL,
  `email` varchar(255) NOT NULL DEFAULT '',
  `subject` varchar(200) NOT NULL DEFAULT '',
  `department` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `dateof` bigint(14) NOT NULL DEFAULT 0,
  `sessiondata` text DEFAULT NULL,
  `deliminated` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `livehelp_messages` (
  `id_num` int(10) NOT NULL,
  `message` text DEFAULT NULL,
  `channel` int(10) NOT NULL DEFAULT 0,
  `timeof` bigint(14) NOT NULL DEFAULT 0,
  `saidfrom` int(10) NOT NULL DEFAULT 0,
  `saidto` int(10) NOT NULL DEFAULT 0,
  `typeof` varchar(30) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `livehelp_modules` (
  `id` int(10) NOT NULL,
  `name` varchar(30) NOT NULL DEFAULT '',
  `path` varchar(255) NOT NULL DEFAULT '',
  `adminpath` varchar(255) NOT NULL DEFAULT '',
  `query_string` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `livehelp_modules_dep` (
  `rec` int(10) NOT NULL,
  `departmentid` int(10) NOT NULL DEFAULT 0,
  `moduleid` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `livehelp_operator_channels` (
  `id` int(10) NOT NULL,
  `channel` int(10) NOT NULL DEFAULT 0,
  `user_id` int(10) NOT NULL DEFAULT 0,
  `isonline` char(1) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `livehelp_operator_departments` (
  `recno` int(10) NOT NULL,
  `user_id` int(10) NOT NULL DEFAULT 0,
  `department` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `livehelp_operator_history` (
  `id` int(11) UNSIGNED NOT NULL,
  `opid` int(11) NOT NULL DEFAULT 0,
  `dateof` int(8) NOT NULL DEFAULT 0,
  `duration` int(8) NOT NULL DEFAULT 0,
  `awaytime` int(8) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `livehelp_paths_firsts` (
  `id` int(11) UNSIGNED NOT NULL,
  `visit_recno` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `exit_recno` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `dateof` int(8) NOT NULL DEFAULT 0,
  `visits` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `livehelp_paths_monthly` (
  `id` int(11) UNSIGNED NOT NULL,
  `visit_recno` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `exit_recno` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `dateof` int(8) NOT NULL DEFAULT 0,
  `visits` int(11) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `livehelp_qa` (
  `recno` int(10) NOT NULL,
  `question` text NOT NULL,
  `answer` text NOT NULL,
  `department` int(10) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `livehelp_questions` (
  `id` int(10) NOT NULL,
  `department` int(10) NOT NULL DEFAULT 0,
  `question` text NOT NULL,
  `answer` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `livehelp_quick` (
  `id` int(10) NOT NULL,
  `typeof` varchar(25) NOT NULL DEFAULT '',
  `reply` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `livehelp_referers_daily` (
  `recno` int(11) NOT NULL,
  `pageurl` varchar(255) NOT NULL DEFAULT '0',
  `dateof` int(8) NOT NULL DEFAULT 0,
  `levelvisits` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `directvisits` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `parentrec` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `level` int(10) NOT NULL DEFAULT 0,
  `department` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `livehelp_referers_monthly` (
  `recno` int(11) NOT NULL,
  `pageurl` varchar(255) NOT NULL DEFAULT '0',
  `dateof` int(8) NOT NULL DEFAULT 0,
  `levelvisits` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `directvisits` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `parentrec` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `level` int(10) NOT NULL DEFAULT 0,
  `department` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `livehelp_sessions` (
  `session_id` varchar(64) NOT NULL,
  `expires` int NOT NULL DEFAULT 0,
  `data` mediumblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `livehelp_smilies` (
  `smilies_id` smallint(5) UNSIGNED NOT NULL,
  `smilies_code` varchar(75) NOT NULL DEFAULT '',
  `smilies_url` varchar(75) NOT NULL DEFAULT '',
  `emoticon` varchar(75) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `livehelp_transcripts` (
  `recno` int(10) NOT NULL,
  `sessionid` varchar(40) NOT NULL DEFAULT '',
  `department` int(10) NOT NULL DEFAULT 0,
  `datesent` bigint(14) NOT NULL DEFAULT 0,
  `username` varchar(40) NOT NULL DEFAULT '',
  `email` varchar(60) NOT NULL DEFAULT '',
  `message` text DEFAULT NULL,
  `fromwho` varchar(60) NOT NULL DEFAULT '',
  `subject` varchar(100) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `livehelp_users` (
  `user_id` int(10) NOT NULL,
  `username` varchar(25) NOT NULL DEFAULT '',
  `password` varchar(40) NOT NULL DEFAULT '',
  `email` varchar(60) NOT NULL DEFAULT '',
  `sessionid` varchar(40) NOT NULL DEFAULT '',
  `lastaction` bigint(14) NOT NULL DEFAULT 0,
  `isoperator` char(1) NOT NULL DEFAULT '',
  `isonline` char(1) NOT NULL DEFAULT '',
  `status` varchar(20) NOT NULL DEFAULT '',
  `department` int(10) NOT NULL DEFAULT 0,
  `expires` int(10) NOT NULL DEFAULT 0,
  `typeof` varchar(20) NOT NULL DEFAULT '',
  `isonphone` char(1) NOT NULL DEFAULT 'N',
  `botoperator` char(1) NOT NULL DEFAULT 'N',
  `colors` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `livehelp_visits_daily` (
  `recno` int(11) NOT NULL,
  `pageurl` varchar(255) NOT NULL DEFAULT '0',
  `dateof` int(8) NOT NULL DEFAULT 0,
  `levelvisits` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `directvisits` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `parentrec` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `level` int(10) NOT NULL DEFAULT 0,
  `department` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `livehelp_visits_monthly` (
  `recno` int(11) NOT NULL,
  `pageurl` varchar(255) NOT NULL DEFAULT '0',
  `dateof` int(8) NOT NULL DEFAULT 0,
  `levelvisits` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `directvisits` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `parentrec` int(11) UNSIGNED NOT NULL DEFAULT 0,
  `level` int(10) NOT NULL DEFAULT 0,
  `department` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `livehelp_visit_track` (
  `recno` int(10) NOT NULL,
  `sessionid` varchar(40) NOT NULL DEFAULT '0',
  `location` varchar(255) NOT NULL DEFAULT '',
  `page` bigint(14) NOT NULL DEFAULT 0,
  `title` varchar(100) NOT NULL DEFAULT '',
  `whendone` bigint(14) NOT NULL DEFAULT 0,
  `referrer` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE IF NOT EXISTS `livehelp_websites` (
  `id` int(11) NOT NULL,
  `site_name` varchar(45) NOT NULL,
  `site_url` varchar(255) NOT NULL,
  `defaultdepartment` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Indexes

ALTER TABLE `livehelp_autoinvite`
  ADD PRIMARY KEY (`idnum`);

ALTER TABLE `livehelp_channels`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `livehelp_config`
  ADD PRIMARY KEY (`version`);

ALTER TABLE `livehelp_departments`
  ADD PRIMARY KEY (`recno`);

ALTER TABLE `livehelp_emailque`
  ADD PRIMARY KEY (`id`),
  ADD KEY `messageid` (`messageid`);

ALTER TABLE `livehelp_emails`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `livehelp_identity_daily`
  ADD PRIMARY KEY (`id`),
  ADD KEY `isnamed` (`isnamed`),
  ADD KEY `groupidentity` (`groupidentity`),
  ADD KEY `groupusername` (`groupusername`),
  ADD KEY `identity` (`identity`),
  ADD KEY `cookieid` (`cookieid`),
  ADD KEY `username` (`username`),
  ADD KEY `dateof` (`dateof`);

ALTER TABLE `livehelp_identity_monthly`
  ADD PRIMARY KEY (`id`),
  ADD KEY `isnamed` (`isnamed`),
  ADD KEY `groupidentity` (`groupidentity`),
  ADD KEY `groupusername` (`groupusername`),
  ADD KEY `identity` (`identity`),
  ADD KEY `cookieid` (`cookieid`),
  ADD KEY `username` (`username`),
  ADD KEY `dateof` (`dateof`);

ALTER TABLE `livehelp_keywords_daily`
  ADD PRIMARY KEY (`recno`),
  ADD KEY `department` (`department`),
  ADD KEY `levelvisits` (`levelvisits`),
  ADD KEY `dateof` (`dateof`),
  ADD KEY `referer` (`referer`);

ALTER TABLE `livehelp_keywords_monthly`
  ADD PRIMARY KEY (`recno`),
  ADD KEY `department` (`department`),
  ADD KEY `levelvisits` (`levelvisits`),
  ADD KEY `dateof` (`dateof`),
  ADD KEY `referer` (`referer`);

ALTER TABLE `livehelp_layerinvites`
  ADD PRIMARY KEY (`layerid`);

ALTER TABLE `livehelp_leads`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email` (`email`,`source`,`status`);

ALTER TABLE `livehelp_leavemessage`
  ADD PRIMARY KEY (`id`),
  ADD KEY `department` (`department`);

ALTER TABLE `livehelp_messages`
  ADD PRIMARY KEY (`id_num`),
  ADD KEY `channel` (`channel`),
  ADD KEY `timeof` (`timeof`);

ALTER TABLE `livehelp_modules`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `livehelp_modules_dep`
  ADD PRIMARY KEY (`rec`);

ALTER TABLE `livehelp_operator_channels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `channel` (`channel`),
  ADD KEY `user_id` (`user_id`);

ALTER TABLE `livehelp_operator_departments`
  ADD PRIMARY KEY (`recno`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `department` (`department`);

ALTER TABLE `livehelp_operator_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `opid` (`opid`),
  ADD KEY `dateof` (`dateof`);

ALTER TABLE `livehelp_paths_firsts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `visit_recno` (`visit_recno`,`dateof`,`visits`);

ALTER TABLE `livehelp_paths_monthly`
  ADD PRIMARY KEY (`id`),
  ADD KEY `visit_recno` (`visit_recno`),
  ADD KEY `dateof` (`dateof`),
  ADD KEY `visits` (`visits`);

ALTER TABLE `livehelp_qa`
  ADD PRIMARY KEY (`recno`);

ALTER TABLE `livehelp_questions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `department` (`department`);

ALTER TABLE `livehelp_quick`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `livehelp_referers_daily`
  ADD PRIMARY KEY (`recno`),
  ADD KEY `department` (`department`),
  ADD KEY `pageurl` (`pageurl`),
  ADD KEY `parentrec` (`parentrec`),
  ADD KEY `levelvisits` (`levelvisits`),
  ADD KEY `directvisits` (`directvisits`),
  ADD KEY `dateof` (`dateof`);

ALTER TABLE `livehelp_referers_monthly`
  ADD PRIMARY KEY (`recno`),
  ADD KEY `department` (`department`),
  ADD KEY `pageurl` (`pageurl`),
  ADD KEY `parentrec` (`parentrec`),
  ADD KEY `levelvisits` (`levelvisits`),
  ADD KEY `directvisits` (`directvisits`),
  ADD KEY `dateof` (`dateof`);

ALTER TABLE `livehelp_sessions`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `expires` (`expires`);

ALTER TABLE `livehelp_smilies`
  ADD PRIMARY KEY (`smilies_id`);

ALTER TABLE `livehelp_transcripts`
  ADD PRIMARY KEY (`recno`);

ALTER TABLE `livehelp_users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `expires` (`expires`),
  ADD KEY `sessionid` (`sessionid`);

ALTER TABLE `livehelp_visits_daily`
  ADD PRIMARY KEY (`recno`),
  ADD KEY `department` (`department`),
  ADD KEY `pageurl` (`pageurl`),
  ADD KEY `parentrec` (`parentrec`),
  ADD KEY `levelvisits` (`levelvisits`),
  ADD KEY `directvisits` (`directvisits`),
  ADD KEY `dateof` (`dateof`);

ALTER TABLE `livehelp_visits_monthly`
  ADD PRIMARY KEY (`recno`),
  ADD KEY `department` (`department`),
  ADD KEY `pageurl` (`pageurl`),
  ADD KEY `parentrec` (`parentrec`),
  ADD KEY `levelvisits` (`levelvisits`),
  ADD KEY `directvisits` (`directvisits`),
  ADD KEY `dateof` (`dateof`);

ALTER TABLE `livehelp_visit_track`
  ADD PRIMARY KEY (`recno`),
  ADD KEY `sessionid` (`sessionid`),
  ADD KEY `location` (`location`),
  ADD KEY `page` (`page`),
  ADD KEY `whendone` (`whendone`);

ALTER TABLE `livehelp_websites`
  ADD PRIMARY KEY (`id`);

-- Auto-increment adjustments

ALTER TABLE `livehelp_autoinvite`
  MODIFY `idnum` int(10) NOT NULL AUTO_INCREMENT;

ALTER TABLE `livehelp_channels`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

ALTER TABLE `livehelp_departments`
  MODIFY `recno` int(5) NOT NULL AUTO_INCREMENT;

ALTER TABLE `livehelp_emailque`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT;

ALTER TABLE `livehelp_emails`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT;

ALTER TABLE `livehelp_identity_daily`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `livehelp_identity_monthly`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `livehelp_keywords_daily`
  MODIFY `recno` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `livehelp_keywords_monthly`
  MODIFY `recno` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `livehelp_leads`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT;

ALTER TABLE `livehelp_leavemessage`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `livehelp_messages`
  MODIFY `id_num` int(10) NOT NULL AUTO_INCREMENT;

ALTER TABLE `livehelp_modules`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

ALTER TABLE `livehelp_modules_dep`
  MODIFY `rec` int(10) NOT NULL AUTO_INCREMENT;

ALTER TABLE `livehelp_operator_channels`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

ALTER TABLE `livehelp_operator_departments`
  MODIFY `recno` int(10) NOT NULL AUTO_INCREMENT;

ALTER TABLE `livehelp_operator_history`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `livehelp_paths_firsts`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `livehelp_paths_monthly`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `livehelp_qa`
  MODIFY `recno` int(10) NOT NULL AUTO_INCREMENT;

ALTER TABLE `livehelp_questions`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

ALTER TABLE `livehelp_quick`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT;

ALTER TABLE `livehelp_referers_daily`
  MODIFY `recno` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `livehelp_referers_monthly`
  MODIFY `recno` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `livehelp_smilies`
  MODIFY `smilies_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

ALTER TABLE `livehelp_transcripts`
  MODIFY `recno` int(10) NOT NULL AUTO_INCREMENT;

ALTER TABLE `livehelp_users`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT;

ALTER TABLE `livehelp_visits_daily`
  MODIFY `recno` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `livehelp_visits_monthly`
  MODIFY `recno` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `livehelp_visit_track`
  MODIFY `recno` int(10) NOT NULL AUTO_INCREMENT;

ALTER TABLE `livehelp_websites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;


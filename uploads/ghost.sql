-- phpMyAdmin SQL Dump
-- version 4.4.13.1deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Oct 06, 2016 at 05:31 PM
-- Server version: 5.6.31-0ubuntu0.15.10.1
-- PHP Version: 5.6.11-1ubuntu3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `test`
--

-- --------------------------------------------------------

--
-- Table structure for table `accesstokens`
--

CREATE TABLE IF NOT EXISTS `accesstokens` (
  `id` int(10) unsigned NOT NULL,
  `token` varchar(255) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `expires` bigint(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `accesstokens`
--

INSERT INTO `accesstokens` (`id`, `token`, `user_id`, `client_id`, `expires`) VALUES
(1, 'PE3tOU8FD3V2DPeZlIyAII9oxtpc9e35Uawjzz4AHhTTyFiRhP3mP7AvwuWetuNv0YPxEu8NprEYaRVVZy2N5KQSeSllpYHTHeepxIOEZcHws4Bs0AAjJ8DYsccJ84qVtyOj2XW5jbF4WDaJuqo1fbMx0tu4YIodbSiB9oSkBTj0txWCyTZW4qwXNXOkTtFoFQzCbzUoWswD9EhCQLF12dviLtEyoknZCQMoI3rT5UCVqyMIikckpqMFj1pD7ve', 1, 1, 1475758802965);

-- --------------------------------------------------------

--
-- Table structure for table `apps`
--

CREATE TABLE IF NOT EXISTS `apps` (
  `id` int(10) unsigned NOT NULL,
  `uuid` varchar(36) NOT NULL,
  `name` varchar(150) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `version` varchar(150) NOT NULL,
  `status` varchar(150) NOT NULL DEFAULT 'inactive',
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `app_fields`
--

CREATE TABLE IF NOT EXISTS `app_fields` (
  `id` int(10) unsigned NOT NULL,
  `uuid` varchar(36) NOT NULL,
  `key` varchar(150) NOT NULL,
  `value` text,
  `type` varchar(150) NOT NULL DEFAULT 'html',
  `app_id` int(10) unsigned NOT NULL,
  `relatable_id` int(10) unsigned NOT NULL,
  `relatable_type` varchar(150) NOT NULL DEFAULT 'posts',
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `app_settings`
--

CREATE TABLE IF NOT EXISTS `app_settings` (
  `id` int(10) unsigned NOT NULL,
  `uuid` varchar(36) NOT NULL,
  `key` varchar(150) NOT NULL,
  `value` text,
  `app_id` int(10) unsigned NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE IF NOT EXISTS `clients` (
  `id` int(10) unsigned NOT NULL,
  `uuid` varchar(36) NOT NULL,
  `name` varchar(150) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `secret` varchar(150) NOT NULL,
  `redirection_uri` varchar(2000) DEFAULT NULL,
  `logo` varchar(2000) DEFAULT NULL,
  `status` varchar(150) NOT NULL DEFAULT 'development',
  `type` varchar(150) NOT NULL DEFAULT 'ua',
  `description` varchar(200) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`id`, `uuid`, `name`, `slug`, `secret`, `redirection_uri`, `logo`, `status`, `type`, `description`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 'aa4933b7-a76f-41a1-b6fe-9af909688933', 'Ghost Admin', 'ghost-admin', '508f5f451d20', NULL, NULL, 'enabled', 'ua', NULL,  now(), 1,  now(), 1),
(2, 'ef676a0a-3b8a-4325-8965-05829ba388fe', 'Ghost Frontend', 'ghost-frontend', 'd4262e9aa800', NULL, NULL, 'enabled', 'ua', NULL,  now(), 1,  now(), 1),
(3, 'b60efc8d-e6ab-478c-9dae-a7e3986d0515', 'Ghost Scheduler', 'ghost-scheduler', 'da7066aa95b5', NULL, NULL, 'enabled', 'web', NULL,  now(), 1,  now(), 1);

-- --------------------------------------------------------

--
-- Table structure for table `client_trusted_domains`
--

CREATE TABLE IF NOT EXISTS `client_trusted_domains` (
  `id` int(10) unsigned NOT NULL,
  `uuid` varchar(36) NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `trusted_domain` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(10) unsigned NOT NULL,
  `uuid` varchar(36) NOT NULL,
  `name` varchar(150) NOT NULL,
  `object_type` varchar(150) NOT NULL,
  `action_type` varchar(150) NOT NULL,
  `object_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `uuid`, `name`, `object_type`, `action_type`, `object_id`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 'c244b431-669f-4428-a10f-773b2faf3d5c', 'Export database', 'db', 'exportContent', NULL, now(), 1, now(), 1),
(2, '3a25c050-9f75-437d-9941-908a0ef2556a', 'Import database', 'db', 'importContent', NULL, now(), 1, now(), 1),
(3, 'be9ab1b3-29e9-4f56-861e-5daa21022e95', 'Delete all content', 'db', 'deleteAllContent', NULL, now(), 1, now(), 1),
(4, 'b1ba6871-4d21-4fe3-90b9-44ced45ec17a', 'Send mail', 'mail', 'send', NULL, now(), 1, now(), 1),
(5, '3898ffae-ad2a-4c48-8ea2-c64bd25f3fa6', 'Browse notifications', 'notification', 'browse', NULL, now(), 1, now(), 1),
(6, 'd13a8852-9530-4a9b-8891-6f1168c30169', 'Add notifications', 'notification', 'add', NULL, now(), 1, now(), 1),
(7, '37c57abe-e234-44b4-a7ce-c56fda808f6e', 'Delete notifications', 'notification', 'destroy', NULL, now(), 1, now(), 1),
(8, 'b8cea160-5ff6-4d32-a7ab-b9579d7ba432', 'Browse posts', 'post', 'browse', NULL, now(), 1, now(), 1),
(9, '890bbda0-adf7-447b-8843-778e5a26eca6', 'Read posts', 'post', 'read', NULL, now(), 1, now(), 1),
(10, '8cce0fd2-ad88-4064-9565-1330971f51f6', 'Edit posts', 'post', 'edit', NULL, now(), 1, now(), 1),
(11, '9d4cec3d-16c0-4f08-a060-64887ab951d5', 'Add posts', 'post', 'add', NULL, now(), 1, now(), 1),
(12, '4ddbf64a-bc56-40ec-881f-31dcd9da25a8', 'Delete posts', 'post', 'destroy', NULL, now(), 1, now(), 1),
(13, 'f98c9789-38e2-44f6-a6dc-73b596d1ab8e', 'Browse settings', 'setting', 'browse', NULL, now(), 1, now(), 1),
(14, 'a529dc7f-c4b6-410d-9548-04a35f6f80eb', 'Read settings', 'setting', 'read', NULL, now(), 1, now(), 1),
(15, 'ff6b5636-82a8-4e0c-9dd5-8bc6935c4f29', 'Edit settings', 'setting', 'edit', NULL, now(), 1, now(), 1),
(16, 'b03550f6-58f4-4b78-a23e-758a239c5094', 'Generate slugs', 'slug', 'generate', NULL, now(), 1, now(), 1),
(17, 'b5d42fea-6d48-4109-84f6-d357af575468', 'Browse tags', 'tag', 'browse', NULL, now(), 1, now(), 1),
(18, 'b4fc0998-fe5e-45ec-964c-49b3032485ba', 'Read tags', 'tag', 'read', NULL, now(), 1, now(), 1),
(19, '5578ddaa-e0b0-4e9f-9cac-1988c40f6095', 'Edit tags', 'tag', 'edit', NULL, now(), 1, now(), 1),
(20, '60ca44bc-844f-4150-bdc4-27e740343e07', 'Add tags', 'tag', 'add', NULL, now(), 1, now(), 1),
(21, '64735cb0-cd2c-44df-b41f-4d1791625f61', 'Delete tags', 'tag', 'destroy', NULL, now(), 1, now(), 1),
(22, '22015991-dc4c-4ae1-9e05-7ce42dc2df86', 'Browse themes', 'theme', 'browse', NULL, now(), 1, now(), 1),
(23, '2b8364b9-d12b-4e89-936a-9f29366f5a6e', 'Edit themes', 'theme', 'edit', NULL, now(), 1, now(), 1),
(24, '6cb6b630-07d0-422a-b268-56c58d0e7e80', 'Upload themes', 'theme', 'add', NULL, now(), 1, now(), 1),
(25, '2911c679-f4fd-41f9-b779-7fada4ff0395', 'Download themes', 'theme', 'read', NULL, now(), 1, now(), 1),
(26, 'f87b78b3-6e2f-4dc2-b0c8-60224dfdd86f', 'Delete themes', 'theme', 'destroy', NULL, now(), 1, now(), 1),
(27, '84d81484-293c-47ab-af83-1ad3db82d959', 'Browse users', 'user', 'browse', NULL, now(), 1, now(), 1),
(28, '16696769-3888-4d27-b21c-fad4116492fa', 'Read users', 'user', 'read', NULL, now(), 1, now(), 1),
(29, 'ad9a77b4-50c8-4aa6-886c-1ac4e4a60a63', 'Edit users', 'user', 'edit', NULL, now(), 1, now(), 1),
(30, '925a78af-ddc6-4a37-a147-080b2318852a', 'Add users', 'user', 'add', NULL, now(), 1, now(), 1),
(31, '25b05d6e-0a12-415f-939d-347794ea8845', 'Delete users', 'user', 'destroy', NULL, now(), 1, now(), 1),
(32, '7ddcf089-b24f-426c-9f2e-42c6d00b3bbf', 'Assign a role', 'role', 'assign', NULL, now(), 1, now(), 1),
(33, 'd679cb21-b565-46d7-aa33-eee5264b384a', 'Browse roles', 'role', 'browse', NULL, now(), 1, now(), 1),
(34, '04f981ae-abc8-40d7-b91f-6cc542db0482', 'Browse clients', 'client', 'browse', NULL, now(), 1, now(), 1),
(35, '47b9ed9b-069d-42be-b0aa-59575fc660db', 'Read clients', 'client', 'read', NULL, now(), 1, now(), 1),
(36, 'ede6804f-98be-426c-9efe-1952295386b3', 'Edit clients', 'client', 'edit', NULL, now(), 1, now(), 1),
(37, '9f1969fa-d74e-4923-8ff7-9648a3bac47e', 'Add clients', 'client', 'add', NULL, now(), 1, now(), 1),
(38, '78a322d5-9680-40a7-ba64-0c1a36cf164c', 'Delete clients', 'client', 'destroy', NULL, now(), 1, now(), 1),
(39, 'fd26addf-6555-44c5-a531-a4df36080dae', 'Browse subscribers', 'subscriber', 'browse', NULL, now(), 1, now(), 1),
(40, '80e5eba0-aff7-49bc-ac34-6bfbb9168460', 'Read subscribers', 'subscriber', 'read', NULL, now(), 1, now(), 1),
(41, 'f26bfce8-d8e1-4e8e-bb63-c3e7e6cb77a9', 'Edit subscribers', 'subscriber', 'edit', NULL, now(), 1, now(), 1),
(42, 'cbcdc5c5-a4ad-4e5a-88de-9b2471c32b30', 'Add subscribers', 'subscriber', 'add', NULL, now(), 1, now(), 1),
(43, '4f141cd3-453c-4f0b-a77d-477795706d5f', 'Delete subscribers', 'subscriber', 'destroy', NULL, now(), 1, now(), 1);

-- --------------------------------------------------------

--
-- Table structure for table `permissions_apps`
--

CREATE TABLE IF NOT EXISTS `permissions_apps` (
  `id` int(10) unsigned NOT NULL,
  `app_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `permissions_roles`
--

CREATE TABLE IF NOT EXISTS `permissions_roles` (
  `id` int(10) unsigned NOT NULL,
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `permissions_roles`
--

INSERT INTO `permissions_roles` (`id`, `role_id`, `permission_id`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 1, 4),
(5, 1, 5),
(6, 1, 6),
(7, 1, 7),
(8, 1, 8),
(9, 1, 9),
(10, 1, 10),
(11, 1, 11),
(12, 1, 12),
(13, 1, 13),
(14, 1, 14),
(15, 1, 15),
(16, 1, 16),
(17, 1, 17),
(18, 1, 18),
(19, 1, 19),
(20, 1, 20),
(21, 1, 21),
(22, 1, 22),
(23, 1, 23),
(24, 1, 24),
(25, 1, 25),
(26, 1, 26),
(27, 1, 27),
(28, 1, 28),
(29, 1, 29),
(30, 1, 30),
(31, 1, 31),
(32, 1, 32),
(33, 1, 33),
(34, 1, 34),
(35, 1, 35),
(36, 1, 36),
(37, 1, 37),
(38, 1, 38),
(39, 1, 39),
(40, 1, 40),
(41, 1, 41),
(42, 1, 42),
(43, 1, 43),
(44, 2, 8),
(45, 2, 9),
(46, 2, 10),
(47, 2, 11),
(48, 2, 12),
(49, 2, 13),
(50, 2, 14),
(51, 2, 16),
(52, 2, 17),
(53, 2, 18),
(54, 2, 19),
(55, 2, 20),
(56, 2, 21),
(57, 2, 27),
(58, 2, 28),
(59, 2, 29),
(60, 2, 30),
(61, 2, 31),
(62, 2, 32),
(63, 2, 33),
(64, 2, 34),
(65, 2, 35),
(66, 2, 36),
(67, 2, 37),
(68, 2, 38),
(69, 2, 42),
(70, 3, 8),
(71, 3, 9),
(72, 3, 11),
(73, 3, 13),
(74, 3, 14),
(75, 3, 16),
(76, 3, 17),
(77, 3, 18),
(78, 3, 20),
(79, 3, 27),
(80, 3, 28),
(81, 3, 33),
(82, 3, 34),
(83, 3, 35),
(84, 3, 36),
(85, 3, 37),
(86, 3, 38),
(87, 3, 42);

-- --------------------------------------------------------

--
-- Table structure for table `permissions_users`
--

CREATE TABLE IF NOT EXISTS `permissions_users` (
  `id` int(10) unsigned NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(10) unsigned NOT NULL,
  `uuid` varchar(36) NOT NULL,
  `title` varchar(150) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `markdown` mediumtext,
  `mobiledoc` longtext,
  `html` mediumtext,
  `amp` mediumtext,
  `image` text,
  `featured` tinyint(1) NOT NULL DEFAULT '0',
  `page` tinyint(1) NOT NULL DEFAULT '0',
  `status` varchar(150) NOT NULL DEFAULT 'draft',
  `language` varchar(6) NOT NULL DEFAULT 'en_US',
  `visibility` varchar(150) NOT NULL DEFAULT 'public',
  `meta_title` varchar(150) DEFAULT NULL,
  `meta_description` varchar(200) DEFAULT NULL,
  `author_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL,
  `published_at` datetime DEFAULT NULL,
  `published_by` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`id`, `uuid`, `title`, `slug`, `markdown`, `mobiledoc`, `html`, `amp`, `image`, `featured`, `page`, `status`, `language`, `visibility`, `meta_title`, `meta_description`, `author_id`, `created_at`, `created_by`, `updated_at`, `updated_by`, `published_at`, `published_by`) VALUES
(1, 'f83c0d77-2c52-4ba8-9cd9-428e0ee4d152', 'Welcome to Ghost', 'welcome-to-ghost', 'You''re live! Nice. We''ve put together a little post to introduce you to the Ghost editor and get you started. You can manage your content by signing in to the admin area at `<your blog URL>/ghost/`. When you arrive, you can select this post from a list on the left and see a preview of it on the right. Click the little pencil icon at the top of the preview to edit this post and read the next section!\n\n## Getting Started\n\nGhost uses something called Markdown for writing. Essentially, it''s a shorthand way to manage your post formatting as you write!\n\nWriting in Markdown is really easy. In the left hand panel of Ghost, you simply write as you normally would. Where appropriate, you can use *shortcuts* to **style** your content. For example, a list:\n\n* Item number one\n* Item number two\n    * A nested item\n* A final item\n\nor with numbers!\n\n1. Remember to buy some milk\n2. Drink the milk\n3. Tweet that I remembered to buy the milk, and drank it\n\n### Links\n\nWant to link to a source? No problem. If you paste in a URL, like http://ghost.org - it''ll automatically be linked up. But if you want to customise your anchor text, you can do that too! Here''s a link to [the Ghost website](http://ghost.org). Neat.\n\n### What about Images?\n\nImages work too! Already know the URL of the image you want to include in your article? Simply paste it in like this to make it show up:\n\n![The Ghost Logo](https://ghost.org/images/ghost.png)\n\nNot sure which image you want to use yet? That''s ok too. Leave yourself a descriptive placeholder and keep writing. Come back later and drag and drop the image in to upload:\n\n![A bowl of bananas]\n\n\n### Quoting\n\nSometimes a link isn''t enough, you want to quote someone on what they''ve said. Perhaps you''ve started using a new blogging platform and feel the sudden urge to share their slogan? A quote might be just the way to do it!\n\n> Ghost - Just a blogging platform\n\n### Working with Code\n\nGot a streak of geek? We''ve got you covered there, too. You can write inline `<code>` blocks really easily with back ticks. Want to show off something more comprehensive? 4 spaces of indentation gets you there.\n\n    .awesome-thing {\n        display: block;\n        width: 100%;\n    }\n\n### Ready for a Break? \n\nThrow 3 or more dashes down on any new line and you''ve got yourself a fancy new divider. Aw yeah.\n\n---\n\n### Advanced Usage\n\nThere''s one fantastic secret about Markdown. If you want, you can write plain old HTML and it''ll still work! Very flexible.\n\n<input type="text" placeholder="I''m an input field!" />\n\nThat should be enough to get you started. Have fun - and let us know what you think :)', NULL, '<p>You''re live! Nice. We''ve put together a little post to introduce you to the Ghost editor and get you started. You can manage your content by signing in to the admin area at <code>&lt;your blog URL&gt;/ghost/</code>. When you arrive, you can select this post from a list on the left and see a preview of it on the right. Click the little pencil icon at the top of the preview to edit this post and read the next section!</p>\n\n<h2 id="gettingstarted">Getting Started</h2>\n\n<p>Ghost uses something called Markdown for writing. Essentially, it''s a shorthand way to manage your post formatting as you write!</p>\n\n<p>Writing in Markdown is really easy. In the left hand panel of Ghost, you simply write as you normally would. Where appropriate, you can use <em>shortcuts</em> to <strong>style</strong> your content. For example, a list:</p>\n\n<ul>\n<li>Item number one</li>\n<li>Item number two\n<ul><li>A nested item</li></ul></li>\n<li>A final item</li>\n</ul>\n\n<p>or with numbers!</p>\n\n<ol>\n<li>Remember to buy some milk  </li>\n<li>Drink the milk  </li>\n<li>Tweet that I remembered to buy the milk, and drank it</li>\n</ol>\n\n<h3 id="links">Links</h3>\n\n<p>Want to link to a source? No problem. If you paste in a URL, like <a href="http://ghost.org">http://ghost.org</a> - it''ll automatically be linked up. But if you want to customise your anchor text, you can do that too! Here''s a link to <a href="http://ghost.org">the Ghost website</a>. Neat.</p>\n\n<h3 id="whataboutimages">What about Images?</h3>\n\n<p>Images work too! Already know the URL of the image you want to include in your article? Simply paste it in like this to make it show up:</p>\n\n<p><img src="https://ghost.org/images/ghost.png" alt="The Ghost Logo" /></p>\n\n<p>Not sure which image you want to use yet? That''s ok too. Leave yourself a descriptive placeholder and keep writing. Come back later and drag and drop the image in to upload:</p>\n\n<h3 id="quoting">Quoting</h3>\n\n<p>Sometimes a link isn''t enough, you want to quote someone on what they''ve said. Perhaps you''ve started using a new blogging platform and feel the sudden urge to share their slogan? A quote might be just the way to do it!</p>\n\n<blockquote>\n  <p>Ghost - Just a blogging platform</p>\n</blockquote>\n\n<h3 id="workingwithcode">Working with Code</h3>\n\n<p>Got a streak of geek? We''ve got you covered there, too. You can write inline <code>&lt;code&gt;</code> blocks really easily with back ticks. Want to show off something more comprehensive? 4 spaces of indentation gets you there.</p>\n\n<pre><code>.awesome-thing {\n    display: block;\n    width: 100%;\n}\n</code></pre>\n\n<h3 id="readyforabreak">Ready for a Break?</h3>\n\n<p>Throw 3 or more dashes down on any new line and you''ve got yourself a fancy new divider. Aw yeah.</p>\n\n<hr />\n\n<h3 id="advancedusage">Advanced Usage</h3>\n\n<p>There''s one fantastic secret about Markdown. If you want, you can write plain old HTML and it''ll still work! Very flexible.</p>\n\n<p><input type="text" placeholder="I''m an input field!" /></p>\n\n<p>That should be enough to get you started. Have fun - and let us know what you think :)</p>', NULL, NULL, 0, 0, 'published', 'en_US', 'public', NULL, NULL, 1, now(), 1, now(), 1, now(), 1);

-- --------------------------------------------------------

--
-- Table structure for table `posts_tags`
--

CREATE TABLE IF NOT EXISTS `posts_tags` (
  `id` int(10) unsigned NOT NULL,
  `post_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  `sort_order` int(10) unsigned NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `posts_tags`
--

INSERT INTO `posts_tags` (`id`, `post_id`, `tag_id`, `sort_order`) VALUES
(1, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `refreshtokens`
--

CREATE TABLE IF NOT EXISTS `refreshtokens` (
  `id` int(10) unsigned NOT NULL,
  `token` varchar(255) NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `client_id` int(10) unsigned NOT NULL,
  `expires` bigint(20) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `refreshtokens`
--

INSERT INTO `refreshtokens` (`id`, `token`, `user_id`, `client_id`, `expires`) VALUES
(1, 'cqTuScUMpCFudCd2Z9d0QuTWMLOF4ZlZAUbiMgcUEFgoOStne1lMkhRVgeT7tkT5f3SlRDEGe1Es3EqF8dElaG55pyN6nZoSwgU0ky2LRpgReelpl2UrZBYFato48bkMWsa7y3Jz7Bjk9T0a4SffgmBv49zVMkWpSxb9qeMujmwLZ043IIS5OUH6hYTFCGwBkKNSudMn3XUK1uOE965TI7LmFPI0RsaXRp0VLAhI2yX81LdhBrYqypcntENNRPe', 1, 1, 1476360002965);

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `id` int(10) unsigned NOT NULL,
  `uuid` varchar(36) NOT NULL,
  `name` varchar(150) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `uuid`, `name`, `description`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, '586f3f18-3c62-4a27-a17e-925b43e6c09e', 'Administrator', 'Administrators', now(), 1, now(), 1),
(2, 'e9bb3074-6874-4b8f-aeb3-48ead2f5e00f', 'Editor', 'Editors', now(), 1, now(), 1),
(3, 'c9a62c20-c6ab-4495-98dc-fb308c007b9e', 'Author', 'Authors', now(), 1, now(), 1),
(4, '535484b5-a7e4-477f-bd5d-9b713434d348', 'Owner', 'Blog Owner', now(), 1, now(), 1);

-- --------------------------------------------------------

--
-- Table structure for table `roles_users`
--

CREATE TABLE IF NOT EXISTS `roles_users` (
  `id` int(10) unsigned NOT NULL,
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `roles_users`
--

INSERT INTO `roles_users` (`id`, `role_id`, `user_id`) VALUES
(1, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE IF NOT EXISTS `settings` (
  `id` int(10) unsigned NOT NULL,
  `uuid` varchar(36) NOT NULL,
  `key` varchar(150) NOT NULL,
  `value` text,
  `type` varchar(150) NOT NULL DEFAULT 'core',
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `uuid`, `key`, `value`, `type`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, '7b113a61-0c51-48a4-87c8-5b7e9a451b47', 'databaseVersion', '009', 'core', now(), 1, now(), 1),
(2, '7c433431-f8fa-4cde-8dc4-de1bb0ce0860', 'dbHash', '2f914db7-2244-4349-9012-53f2d3bbe459', 'core', now(), 1, now(), 1),
(3, '977327cb-c2ac-405a-9dff-250c732187d7', 'nextUpdateCheck', '1475841505', 'core', now(), 1, now(), 1),
(4, '453c1840-6e6a-4248-89b2-612795111614', 'displayUpdateNotification', '0.11.1', 'core', now(), 1, now(), 1),
(5, '755b01db-0112-494f-b8a9-683725e637d7', 'seenNotifications', '[]', 'core', now(), 1, now(), 1),
(6, '620be2c1-a261-456d-b2b7-48806cc5aa3a', 'migrations', '{}', 'core', now(), 1, now(), 1),
(7, '24e83c85-3ea1-42cd-b7ac-9ff81c3b98ae', 'title', 'TITLE', 'blog', now(), 1, now(), 1),
(8, '0c05c45a-6755-455d-8b23-bee34379bce7', 'description', 'Thoughts, stories and ideas.', 'blog', now(), 1, now(), 1),
(9, 'feca1a37-fd58-42b3-a43d-9d846a000bf9', 'logo', '', 'blog', now(), 1, now(), 1),
(10, '86a7a821-00fc-4868-9e15-2c8dbf57f094', 'cover', '', 'blog', now(), 1, now(), 1),
(11, 'c82aa3a6-4527-4780-b25d-4b26af0e457d', 'defaultLang', 'en_US', 'blog', now(), 1, now(), 1),
(12, '941f96e4-a58f-4f08-b50d-52d0fdf7aaa8', 'postsPerPage', '5', 'blog', now(), 1, now(), 1),
(13, 'dab97a2d-4eb8-464a-856b-80a379f25ff3', 'activeTimezone', 'Etc/UTC', 'blog', now(), 1, now(), 1),
(14, 'aed46f0e-4e33-41a6-81d9-a8f51cc4d5c7', 'forceI18n', 'true', 'blog', now(), 1, now(), 1),
(15, '1266574f-2c36-4660-b3df-ebd0f8796eb7', 'permalinks', '/:slug/', 'blog', now(), 1, now(), 1),
(16, 'bd30c195-012e-4458-8f82-ec8e63e153ec', 'ghost_head', '', 'blog', now(), 1, now(), 1),
(17, 'd98ac2cf-1c29-4792-bede-b824ff6c1f69', 'ghost_foot', '', 'blog', now(), 1, now(), 1),
(18, '8b71eb00-b627-4015-b5aa-c625cfc1117e', 'facebook', '', 'blog', now(), 1, now(), 1),
(19, '57343a4f-f313-4635-b705-31505f1d34d5', 'twitter', '', 'blog', now(), 1, now(), 1),
(20, '07121c7b-8456-4c1f-96c3-5b2aa0fbabed', 'labs', '{}', 'blog', now(), 1, now(), 1),
(21, 'a633ad1a-280d-4e7b-be47-d0376c27b0fb', 'navigation', '[{"label":"Home", "url":"/"}]', 'blog', now(), 1, now(), 1),
(22, 'faa74590-98ad-4f5f-ad66-d3bf91230f28', 'slack', '[{"url":""}]', 'blog', now(), 1, now(), 1),
(23, '71398988-29dc-43f7-81dd-23bcda8ea440', 'activeApps', '[]', 'app', now(), 1, now(), 1),
(24, '2ba810b5-563a-4348-98eb-0a2c2c464ca1', 'installedApps', '[]', 'app', now(), 1, now(), 1),
(25, 'f2d8b985-a4ea-4533-b699-fc458b711314', 'isPrivate', 'false', 'private', now(), 1, now(), 1),
(26, '2c905a01-d4dc-4192-9451-8925d4379f35', 'password', '', 'private', now(), 1, now(), 1),
(27, '4fc81989-fcd3-4c3e-b9ac-b98d818ddba2', 'activeTheme', 'casper', 'theme', now(), 1, now(), 1);

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE IF NOT EXISTS `subscribers` (
  `id` int(10) unsigned NOT NULL,
  `uuid` varchar(36) NOT NULL,
  `name` varchar(150) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `status` varchar(150) NOT NULL DEFAULT 'pending',
  `post_id` int(10) unsigned DEFAULT NULL,
  `subscribed_url` text,
  `subscribed_referrer` text,
  `unsubscribed_url` text,
  `unsubscribed_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE IF NOT EXISTS `tags` (
  `id` int(10) unsigned NOT NULL,
  `uuid` varchar(36) NOT NULL,
  `name` varchar(150) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `image` text,
  `parent_id` int(11) DEFAULT NULL,
  `visibility` varchar(150) NOT NULL DEFAULT 'public',
  `meta_title` varchar(150) DEFAULT NULL,
  `meta_description` varchar(200) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tags`
--

INSERT INTO `tags` (`id`, `uuid`, `name`, `slug`, `description`, `image`, `parent_id`, `visibility`, `meta_title`, `meta_description`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 'b68b1966-f884-4ec7-83a7-9a17ec4bd112', 'Getting Started', 'getting-started', NULL, NULL, NULL, 'public', NULL, NULL, now(), 1, now(), 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` int(10) unsigned NOT NULL,
  `uuid` varchar(36) NOT NULL,
  `name` varchar(150) NOT NULL,
  `slug` varchar(150) NOT NULL,
  `password` varchar(60) NOT NULL,
  `email` varchar(254) NOT NULL,
  `image` text,
  `cover` text,
  `bio` varchar(200) DEFAULT NULL,
  `website` text,
  `location` text,
  `facebook` text,
  `twitter` text,
  `accessibility` text,
  `status` varchar(150) NOT NULL DEFAULT 'active',
  `language` varchar(6) NOT NULL DEFAULT 'en_US',
  `visibility` varchar(150) NOT NULL DEFAULT 'public',
  `meta_title` varchar(150) DEFAULT NULL,
  `meta_description` varchar(200) DEFAULT NULL,
  `tour` text,
  `last_login` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `created_by` int(11) NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `updated_by` int(11) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `uuid`, `name`, `slug`, `password`, `email`, `image`, `cover`, `bio`, `website`, `location`, `facebook`, `twitter`, `accessibility`, `status`, `language`, `visibility`, `meta_title`, `meta_description`, `tour`, `last_login`, `created_at`, `created_by`, `updated_at`, `updated_by`) VALUES
(1, 'b5abaf15-0122-456c-9f38-21fae7c869af', 'USER_USERNAME', 'USER_USERNAME_SMALL', 'PASSWORDHERE', 'USER_EMAIL', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'active', 'en_US', 'public', NULL, NULL, NULL,  now(),  now(), 1,  now(), 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accesstokens`
--
ALTER TABLE `accesstokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `accesstokens_token_unique` (`token`),
  ADD KEY `accesstokens_user_id_foreign` (`user_id`),
  ADD KEY `accesstokens_client_id_foreign` (`client_id`);

--
-- Indexes for table `apps`
--
ALTER TABLE `apps`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `apps_name_unique` (`name`),
  ADD UNIQUE KEY `apps_slug_unique` (`slug`);

--
-- Indexes for table `app_fields`
--
ALTER TABLE `app_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `app_fields_app_id_foreign` (`app_id`);

--
-- Indexes for table `app_settings`
--
ALTER TABLE `app_settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `app_settings_key_unique` (`key`),
  ADD KEY `app_settings_app_id_foreign` (`app_id`);

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `clients_name_unique` (`name`),
  ADD UNIQUE KEY `clients_slug_unique` (`slug`);

--
-- Indexes for table `client_trusted_domains`
--
ALTER TABLE `client_trusted_domains`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_trusted_domains_client_id_foreign` (`client_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions_apps`
--
ALTER TABLE `permissions_apps`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions_roles`
--
ALTER TABLE `permissions_roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permissions_users`
--
ALTER TABLE `permissions_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `posts_slug_unique` (`slug`);

--
-- Indexes for table `posts_tags`
--
ALTER TABLE `posts_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `posts_tags_post_id_foreign` (`post_id`),
  ADD KEY `posts_tags_tag_id_foreign` (`tag_id`);

--
-- Indexes for table `refreshtokens`
--
ALTER TABLE `refreshtokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `refreshtokens_token_unique` (`token`),
  ADD KEY `refreshtokens_user_id_foreign` (`user_id`),
  ADD KEY `refreshtokens_client_id_foreign` (`client_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `roles_users`
--
ALTER TABLE `roles_users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `subscribers_email_unique` (`email`),
  ADD KEY `subscribers_post_id_foreign` (`post_id`);

--
-- Indexes for table `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tags_slug_unique` (`slug`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_slug_unique` (`slug`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accesstokens`
--
ALTER TABLE `accesstokens`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `apps`
--
ALTER TABLE `apps`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `app_fields`
--
ALTER TABLE `app_fields`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `app_settings`
--
ALTER TABLE `app_settings`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `client_trusted_domains`
--
ALTER TABLE `client_trusted_domains`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT for table `permissions_apps`
--
ALTER TABLE `permissions_apps`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `permissions_roles`
--
ALTER TABLE `permissions_roles`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=88;
--
-- AUTO_INCREMENT for table `permissions_users`
--
ALTER TABLE `permissions_users`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `posts_tags`
--
ALTER TABLE `posts_tags`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `refreshtokens`
--
ALTER TABLE `refreshtokens`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `roles_users`
--
ALTER TABLE `roles_users`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `subscribers`
--
ALTER TABLE `subscribers`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tags`
--
ALTER TABLE `tags`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `accesstokens`
--
ALTER TABLE `accesstokens`
  ADD CONSTRAINT `accesstokens_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  ADD CONSTRAINT `accesstokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `app_fields`
--
ALTER TABLE `app_fields`
  ADD CONSTRAINT `app_fields_app_id_foreign` FOREIGN KEY (`app_id`) REFERENCES `apps` (`id`);

--
-- Constraints for table `app_settings`
--
ALTER TABLE `app_settings`
  ADD CONSTRAINT `app_settings_app_id_foreign` FOREIGN KEY (`app_id`) REFERENCES `apps` (`id`);

--
-- Constraints for table `client_trusted_domains`
--
ALTER TABLE `client_trusted_domains`
  ADD CONSTRAINT `client_trusted_domains_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`);

--
-- Constraints for table `posts_tags`
--
ALTER TABLE `posts_tags`
  ADD CONSTRAINT `posts_tags_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`),
  ADD CONSTRAINT `posts_tags_tag_id_foreign` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`id`);

--
-- Constraints for table `refreshtokens`
--
ALTER TABLE `refreshtokens`
  ADD CONSTRAINT `refreshtokens_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `clients` (`id`),
  ADD CONSTRAINT `refreshtokens_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `subscribers`
--
ALTER TABLE `subscribers`
  ADD CONSTRAINT `subscribers_post_id_foreign` FOREIGN KEY (`post_id`) REFERENCES `posts` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

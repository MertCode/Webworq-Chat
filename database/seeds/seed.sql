
-- CREATE TABLE `conversations` (
--   `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
--   `user_id1` bigint(20) unsigned NOT NULL,
--   `user_id2` bigint(20) unsigned NOT NULL,
--   `created_at` timestamp NULL DEFAULT NULL,
--   `updated_at` timestamp NULL DEFAULT NULL,
--   `last_message_id` bigint(20) unsigned DEFAULT NULL,
--   PRIMARY KEY (`id`),
--   KEY `conversations_user_id1_foreign` (`user_id1`),
--   KEY `conversations_user_id2_foreign` (`user_id2`),
--   KEY `conversations_last_message_id_foreign` (`last_message_id`),
--   CONSTRAINT `conversations_last_message_id_foreign` FOREIGN KEY (`last_message_id`) REFERENCES `messages` (`id`),
--   CONSTRAINT `conversations_user_id1_foreign` FOREIGN KEY (`user_id1`) REFERENCES `users` (`id`),
--   CONSTRAINT `conversations_user_id2_foreign` FOREIGN KEY (`user_id2`) REFERENCES `users` (`id`)
-- ) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- CREATE TABLE `failed_jobs` (
--   `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
--   `uuid` varchar(255) NOT NULL,
--   `connection` text NOT NULL,
--   `queue` text NOT NULL,
--   `payload` longtext NOT NULL,
--   `exception` longtext NOT NULL,
--   `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
--   PRIMARY KEY (`id`),
--   UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- CREATE TABLE `group_users` (
--   `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
--   `group_id` bigint(20) unsigned NOT NULL,
--   `user_id` bigint(20) unsigned NOT NULL,
--   `created_at` timestamp NULL DEFAULT NULL,
--   `updated_at` timestamp NULL DEFAULT NULL,
--   PRIMARY KEY (`id`),
--   KEY `group_users_group_id_foreign` (`group_id`),
--   KEY `group_users_user_id_foreign` (`user_id`),
--   CONSTRAINT `group_users_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE,
--   CONSTRAINT `group_users_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
-- ) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- CREATE TABLE `groups` (
--   `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
--   `name` varchar(255) NOT NULL,
--   `description` longtext DEFAULT NULL,
--   `owner_id` bigint(20) unsigned NOT NULL,
--   `created_at` timestamp NULL DEFAULT NULL,
--   `updated_at` timestamp NULL DEFAULT NULL,
--   `last_message_id` bigint(20) unsigned DEFAULT NULL,
--   PRIMARY KEY (`id`),
--   KEY `groups_owner_id_foreign` (`owner_id`),
--   KEY `groups_last_message_id_foreign` (`last_message_id`),
--   CONSTRAINT `groups_last_message_id_foreign` FOREIGN KEY (`last_message_id`) REFERENCES `messages` (`id`),
--   CONSTRAINT `groups_owner_id_foreign` FOREIGN KEY (`owner_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
-- ) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- CREATE TABLE `job_batches` (
--   `id` varchar(255) NOT NULL,
--   `name` varchar(255) NOT NULL,
--   `total_jobs` int(11) NOT NULL,
--   `pending_jobs` int(11) NOT NULL,
--   `failed_jobs` int(11) NOT NULL,
--   `failed_job_ids` longtext NOT NULL,
--   `options` mediumtext DEFAULT NULL,
--   `cancelled_at` int(11) DEFAULT NULL,
--   `created_at` int(11) NOT NULL,
--   `finished_at` int(11) DEFAULT NULL,
--   PRIMARY KEY (`id`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- CREATE TABLE `jobs` (
--   `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
--   `queue` varchar(255) NOT NULL,
--   `payload` longtext NOT NULL,
--   `attempts` tinyint(3) unsigned NOT NULL,
--   `reserved_at` int(10) unsigned DEFAULT NULL,
--   `available_at` int(10) unsigned NOT NULL,
--   `created_at` int(10) unsigned NOT NULL,
--   PRIMARY KEY (`id`),
--   KEY `jobs_queue_index` (`queue`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- CREATE TABLE `message_attachments` (
--   `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
--   `message_id` bigint(20) unsigned NOT NULL,
--   `name` varchar(255) NOT NULL,
--   `path` varchar(1024) NOT NULL,
--   `mime` varchar(255) NOT NULL,
--   `size` int(11) NOT NULL,
--   `created_at` timestamp NULL DEFAULT NULL,
--   `updated_at` timestamp NULL DEFAULT NULL,
--   PRIMARY KEY (`id`),
--   KEY `message_attachments_message_id_foreign` (`message_id`),
--   CONSTRAINT `message_attachments_message_id_foreign` FOREIGN KEY (`message_id`) REFERENCES `messages` (`id`)
-- ) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- CREATE TABLE `messages` (
--   `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
--   `message` longtext DEFAULT NULL,
--   `sender_id` bigint(20) unsigned NOT NULL,
--   `receiver_id` bigint(20) unsigned DEFAULT NULL,
--   `group_id` bigint(20) unsigned DEFAULT NULL,
--   `conversation_id` bigint(20) unsigned DEFAULT NULL,
--   `created_at` timestamp NULL DEFAULT NULL,
--   `updated_at` timestamp NULL DEFAULT NULL,
--   PRIMARY KEY (`id`),
--   KEY `messages_sender_id_foreign` (`sender_id`),
--   KEY `messages_receiver_id_foreign` (`receiver_id`),
--   KEY `messages_group_id_foreign` (`group_id`),
--   KEY `messages_conversation_id_foreign` (`conversation_id`),
--   CONSTRAINT `messages_conversation_id_foreign` FOREIGN KEY (`conversation_id`) REFERENCES `conversations` (`id`),
--   CONSTRAINT `messages_group_id_foreign` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`),
--   CONSTRAINT `messages_receiver_id_foreign` FOREIGN KEY (`receiver_id`) REFERENCES `users` (`id`),
--   CONSTRAINT `messages_sender_id_foreign` FOREIGN KEY (`sender_id`) REFERENCES `users` (`id`)
-- ) ENGINE=InnoDB AUTO_INCREMENT=1026 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- CREATE TABLE `migrations` (
--   `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
--   `migration` varchar(255) NOT NULL,
--   `batch` int(11) NOT NULL,
--   PRIMARY KEY (`id`)
-- ) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- CREATE TABLE `password_reset_tokens` (
--   `email` varchar(255) NOT NULL,
--   `token` varchar(255) NOT NULL,
--   `created_at` timestamp NULL DEFAULT NULL,
--   PRIMARY KEY (`email`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- CREATE TABLE `sessions` (
--   `id` varchar(255) NOT NULL,
--   `user_id` bigint(20) unsigned DEFAULT NULL,
--   `ip_address` varchar(45) DEFAULT NULL,
--   `user_agent` text DEFAULT NULL,
--   `payload` longtext NOT NULL,
--   `last_activity` int(11) NOT NULL,
--   PRIMARY KEY (`id`),
--   KEY `sessions_user_id_index` (`user_id`),
--   KEY `sessions_last_activity_index` (`last_activity`)
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- CREATE TABLE `users` (
--   `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
--   `name` varchar(255) NOT NULL,
--   `email` varchar(255) NOT NULL,
--   `avatar` varchar(255) DEFAULT NULL,
--   `email_verified_at` timestamp NULL DEFAULT NULL,
--   `password` varchar(255) NOT NULL,
--   `remember_token` varchar(100) DEFAULT NULL,
--   `is_admin` tinyint(1) NOT NULL DEFAULT 0,
--   `blocked_at` timestamp NULL DEFAULT NULL,
--   `created_at` timestamp NULL DEFAULT NULL,
--   `updated_at` timestamp NULL DEFAULT NULL,
--   PRIMARY KEY (`id`),
--   UNIQUE KEY `users_email_unique` (`email`)
-- ) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
-- ('mertcode0@gmail.com|127.0.0.1', 'i:3;', 1719165536);
-- INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
-- ('mertcode0@gmail.com|127.0.0.1:timer', 'i:1719165536;', 1719165536);




-- INSERT INTO `conversations` (`id`, `user_id1`, `user_id2`, `created_at`, `updated_at`, `last_message_id`) VALUES
-- (14, 17, 18, '2024-06-23 18:01:58', '2024-06-23 18:02:31', 1017);
-- INSERT INTO `conversations` (`id`, `user_id1`, `user_id2`, `created_at`, `updated_at`, `last_message_id`) VALUES
-- (15, 19, 17, '2024-06-23 18:12:02', '2024-06-23 18:12:02', 1021);
-- INSERT INTO `conversations` (`id`, `user_id1`, `user_id2`, `created_at`, `updated_at`, `last_message_id`) VALUES
-- (16, 19, 18, '2024-06-23 21:31:35', '2024-06-23 21:31:35', 1025);



-- INSERT INTO `group_users` (`id`, `group_id`, `user_id`, `created_at`, `updated_at`) VALUES
-- (20, 6, 18, NULL, NULL);
-- INSERT INTO `group_users` (`id`, `group_id`, `user_id`, `created_at`, `updated_at`) VALUES
-- (21, 6, 19, NULL, NULL);
-- INSERT INTO `group_users` (`id`, `group_id`, `user_id`, `created_at`, `updated_at`) VALUES
-- (22, 6, 17, NULL, NULL);

-- INSERT INTO `groups` (`id`, `name`, `description`, `owner_id`, `created_at`, `updated_at`, `last_message_id`) VALUES
-- (6, 'Eindwerk', 'Massimo en Wesley, bedankt dat jullie mijn juryleden zijn voor deze presentatie. Jullie feedback en beoordeling zijn van onschatbare waarde voor mij!\r\n\r\nIn deze groep kun je alle functies van mijn realtime messaging applicatie uitproberen. Aarzel niet om berichten, emoji\'s, bestanden en meer te versturen. Voel je vrij om rond te klikken en de grenzen van de applicatie te testen.\r\n\r\nP.S. Een hoge score wordt enorm gewaardeerd 😉🎉\r\n\r\nVeel plezier en bedankt voor jullie tijd en aandacht!', 18, '2024-06-23 17:59:37', '2024-06-23 21:32:10', 1022);








-- INSERT INTO `messages` (`id`, `message`, `sender_id`, `receiver_id`, `group_id`, `conversation_id`, `created_at`, `updated_at`) VALUES
-- (1015, 'Hi', 18, NULL, 6, NULL, '2024-06-23 17:59:43', '2024-06-23 17:59:43');
-- INSERT INTO `messages` (`id`, `message`, `sender_id`, `receiver_id`, `group_id`, `conversation_id`, `created_at`, `updated_at`) VALUES
-- (1017, '👍', 17, 18, NULL, NULL, '2024-06-23 18:02:31', '2024-06-23 18:02:31');
-- INSERT INTO `messages` (`id`, `message`, `sender_id`, `receiver_id`, `group_id`, `conversation_id`, `created_at`, `updated_at`) VALUES
-- (1018, 'Hellooo', 17, NULL, 6, NULL, '2024-06-23 18:09:39', '2024-06-23 18:09:39');
-- INSERT INTO `messages` (`id`, `message`, `sender_id`, `receiver_id`, `group_id`, `conversation_id`, `created_at`, `updated_at`) VALUES
-- (1019, 'Heyy', 19, NULL, 6, NULL, '2024-06-23 18:10:04', '2024-06-23 18:10:04'),
-- (1020, '👍', 17, NULL, 6, NULL, '2024-06-23 18:11:45', '2024-06-23 18:11:45'),
-- (1021, '💯💯💯', 17, 19, NULL, NULL, '2024-06-23 18:12:02', '2024-06-23 18:12:02'),
-- (1022, 'Hey Massimo en Wesley,\r\n\r\nKlik op het icoontje rechtsboven voor een leuke verrassing 😁', 18, NULL, 6, NULL, '2024-06-23 21:08:38', '2024-06-23 21:08:38'),
-- (1025, '👍', 18, 19, NULL, NULL, '2024-06-23 21:31:35', '2024-06-23 21:31:35');

-- INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
-- (1, '0001_01_01_000000_create_users_table', 1);
-- INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
-- (2, '0001_01_01_000001_create_cache_table', 1);
-- INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
-- (3, '0001_01_01_000002_create_jobs_table', 1);
-- INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
-- (4, '2024_06_03_115324_create_groups_table', 1),
-- (5, '2024_06_03_115341_create_conversations_table', 1),
-- (6, '2024_06_03_115355_create_messages_table', 1),
-- (7, '2024_06_03_115424_create_message_attachments_table', 1);



-- INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
-- ('1C8I9bANjsHpO8V23onf9AK8f36fARE27i1BcTf7', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiNXo4U2tjNnQzeEtZQVpJUlJyZkl6bUxnVnQ0cUF3dU9KbTB6cU5qMSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyOToiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2dyb3VwLzYiO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyNzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1719177888);
-- INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
-- ('1e6mTUXiXbRnvw7SSrsPywGlQOX473yRqBwh1ZNu', 18, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoiVTBVcjFqTGlYcXNRNjExQUFZOHhrY2Y3VGp4SFkxS2NlTUh3UHBDQiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MDp7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE4O3M6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI5OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvZ3JvdXAvNiI7fX0=', 1719183520);
-- INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
-- ('1fOSuMyOReRdlT820nxuQlTUK695lunRWsBw32PG', 18, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiMGVBVEtFM3pQc3JYNHNCSGIxV0VncWlmRG03RHg2UG1NSTJ3bFNBeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE4O30=', 1719177924);
-- INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
-- ('hyz08ykLMaXUD9Qo79Kr0KzhAIwqomzAq4ft4kQ8', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiT3VUT3JiQWdXaWtYVERBNzFIZWxjUEYwOVhyNlFuWTl6UWxWaHI3TSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1719177919),
-- ('Lk4NA0ZzgdespJIj4OOqjqgRhNaJOnIEryQyuXF5', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiR0ZTQjhTdHBaZUpjaFlIRkQ2M0lHdG1pejlsNFh5M2NIZDIyYllRRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1719177890),
-- ('NM84P07bD7ZfRnIDYAF7Sc3fEnk6C1NaXm4dTsES', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiQVR4emUyMlJ6NTJYQVd2NlRGeG9IQXgwdXZwcXZnd3lFVHhwUlFQVSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyOToiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2dyb3VwLzYiO31zOjk6Il9wcmV2aW91cyI7YToxOntzOjM6InVybCI7czoyNzoiaHR0cDovLzEyNy4wLjAuMTo4MDAwL2xvZ2luIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1719177888),
-- ('tvVZZ1mkJmJSrx4O9yQBhY4mdqbpJKu0JzbsNuBh', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ1hGVWtVaXlIVzlUdFJXcUNKYURTVERYdHdBdmFTUGFqZGZEUVdiMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1719177917),
-- ('WEEEykJcZWc92eCiV7QzF1kZMY7zCu3LdLqczSbc', 18, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTo1OntzOjY6Il90b2tlbiI7czo0MDoicmp0dGkzNWhRalpGOUNMOFdhWE9OeExWZEhjeTVDSUI1R1V5VTkwUCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MDp7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE4O3M6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjI5OiJodHRwOi8vMTI3LjAuMC4xOjgwMDAvZ3JvdXAvNiI7fX0=', 1719177734),
-- ('whivxLfKg7ERlw30dPMaopWqTeo879pWtwDfysVI', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoid2oxcGx6RElwdnVMNkNNckNjaTNYdUhCUkFKZFpTbGlNR1M2bFRqRiI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyMToiaHR0cDovLzEyNy4wLjAuMTo4MDAwIjt9czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9sb2dpbiI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=', 1719177917);

-- INSERT INTO `users` (`id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `is_admin`, `blocked_at`, `created_at`, `updated_at`) VALUES
-- (17, 'Wesley Lancel', 'wes@gmail.com', 'avatars/avatar_66785ba9f22b3.jfif', NULL, '$2y$12$2mo7n.tSmmI5ZyLAuaS5yeC8SdFRm1sMTtFWYLNRyWh8Mdq12JI76', NULL, 0, NULL, '2024-06-23 17:29:09', '2024-06-23 17:30:17');
-- INSERT INTO `users` (`id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `is_admin`, `blocked_at`, `created_at`, `updated_at`) VALUES
-- (18, 'Mert Sozen', 'mertsozen77@gmail.com', 'avatars/avatar_667865dccaf2c.png', NULL, '$2y$12$4pDR1shDoFnvMRUo0jWk3O6J81V/Cvai.ILpWKNN8Ol.7Qu1Jl8HW', '7ZTzjzqsHGLwfoukiH16Zat0IbbZJH6sdvwnQIIEPUNYf2TfjXDod7Nhoe2H', 1, NULL, '2024-06-23 17:51:33', '2024-06-23 18:13:48');
-- INSERT INTO `users` (`id`, `name`, `email`, `avatar`, `email_verified_at`, `password`, `remember_token`, `is_admin`, `blocked_at`, `created_at`, `updated_at`) VALUES
-- (19, 'Massimo De Nittis', 'mas@gmail.com', 'avatars/avatar_667861e373554.jpg', NULL, '$2y$12$vRb2dAzUBh8ShEM.mXq2o.3QHe7KL/LTzObuC5iDh3ThaTROhRoL2', 'dGv54whtSpbCBrU0gEtHaOvxzOtOjTC5EGkMzK0nRnqa3zIpAJKsVcppnrUv', 0, NULL, '2024-06-23 17:52:57', '2024-06-23 17:56:51');

CREATE DATABASE IF NOT EXISTS `securepass`;

USE `securepass`;

-- Users Table
CREATE TABLE
  `users` (
    `id` INT (11) NOT NULL AUTO_INCREMENT,
    `uid` VARCHAR(100) NOT NULL UNIQUE,
    `firstname` VARCHAR(100) NOT NULL,
    `lastname` VARCHAR(100) NOT NULL,
    `email` VARCHAR(100) NOT NULL,
    `password` VARCHAR(100) NOT NULL,
    `org_name` VARCHAR(100) NOT NULL,
    `room` VARCHAR(20) DEFAULT NULL,
    `badge_no` INT (11) DEFAULT NULL,
    `admin` TINYINT (1) NOT NULL DEFAULT 0,
    `security` TINYINT (1) NOT NULL,
    `tenant` TINYINT (1) NOT NULL,
    `reg_on` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;

-- Login Tokens Table
CREATE TABLE
  `login_tokens` (
    `id` INT (11) NOT NULL AUTO_INCREMENT,
    `token` VARCHAR(100) NOT NULL,
    `user_id` INT (11) NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;

-- Notifications Table
CREATE TABLE
  `notifications` (
    `id` INT (11) NOT NULL AUTO_INCREMENT,
    `type` VARCHAR(100) NOT NULL,
    `user_id` INT (11) DEFAULT NULL,
    `message` TEXT NOT NULL,
    `seen` TINYINT (1) NOT NULL DEFAULT 0,
    `created_at` DATETIME NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;

-- Reviews Table
CREATE TABLE
  `reviews` (
    `id` INT (11) NOT NULL AUTO_INCREMENT,
    `names` VARCHAR(100) NOT NULL,
    `message` TEXT NOT NULL,
    `posted_on` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`)
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;

-- Visitors Table
CREATE TABLE
  `visitors` (
    `id` INT (11) NOT NULL AUTO_INCREMENT,
    `user_id` INT (11) NOT NULL,
    `org_name` VARCHAR(100) NOT NULL,
    `visitor_name` VARCHAR(100) NOT NULL,
    `host_name` VARCHAR(100) NOT NULL,
    `expected_arrival` DATETIME NOT NULL,
    `room` VARCHAR(100) NOT NULL,
    `reason` VARCHAR(100) NOT NULL,
    `status` VARCHAR(20) DEFAULT NULL,
    `checkin_at` DATETIME DEFAULT NULL,
    `checkout_at` DATETIME DEFAULT NULL,
    `added_on` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
  ) ENGINE = InnoDB DEFAULT CHARSET = utf8 COLLATE = utf8_unicode_ci;

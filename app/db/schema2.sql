SET sql_mode = '';

CREATE SCHEMA `wagr_db`;

USE  `wagr_db`;

CREATE TABLE `users`
(
  `users_id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `isAdmin` TINYINT DEFAULT false,
  PRIMARY KEY (`users_id`)
);


CREATE TABLE `owners`
(
  `owners_id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(255) NOT NULL,
  `last_name` VARCHAR(255) NOT NULL,
  `address` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `phone` VARCHAR(255) NOT NULL,
  `users_id` INTEGER NOT NULL,
#   foreign key:
  FOREIGN KEY (`users_id`) REFERENCES users(`users_id`),
  PRIMARY KEY (`owners_id`)
);


CREATE TABLE `pets`
(
  `pets_id` INT NOT NULL AUTO_INCREMENT,
  `pet_name` VARCHAR(255) NOT NULL,
  `pet_type` VARCHAR(255) NOT NULL,
  `img_link` VARCHAR(500) NOT NULL DEFAULT 'https://www.dropbox.com/s/xuvi8uearw19jrr/paw.jpg?raw=1',
  `notes` VARCHAR(1000) NOT NULL,
  `checkedIn` TINYINT DEFAULT false,
  `owners_id` INTEGER NOT NULL,
  `createdAt` TIMESTAMP,
  `updatedAt` TIMESTAMP,
#   foreign key:
  FOREIGN KEY (`owners_id`) REFERENCES owners(`owners_id`),
  PRIMARY KEY (`pets_id`)
);



CREATE TABLE `events`
(
  `events_id` INT NOT NULL AUTO_INCREMENT,
  `event_type` VARCHAR(255) NOT NULL,
  `notes` VARCHAR(1000),
  `img_link` VARCHAR(255),
  `pets_id` INTEGER NOT NULL,
  `createdAt` TIMESTAMP,
  `updatedAt` TIMESTAMP,
#   foreign key:
  FOREIGN KEY (`pets_id`) REFERENCES pets(`pets_id`),
  PRIMARY KEY (`events_id`)
);

-- 1. admin table
CREATE TABLE `admin`(
    `username` VARCHAR(100) NULL,
    `password` VARCHAR(100) NOT NULL
);
ALTER TABLE
    `admin` ADD PRIMARY KEY `admin_username_primary`(`username`);
    
-- 2. job list table
CREATE TABLE `jobList`(
    id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `title` VARCHAR(500) NOT NULL,
    `truckType` VARCHAR(500) NOT NULL,
    `price` VARCHAR(500) NOT NULL,
    `description` VARCHAR(500) NOT NULL,
    `jobOwner` VARCHAR(500) NOT NULL
);
ALTER TABLE
    `jobList` ADD PRIMARY KEY `joblist_id_primary`(`id`);
    
-- 3. apply job
CREATE TABLE `applyJob`(
    `name` VARCHAR(100) NOT NULL,
    `email` VARCHAR(100) NOT NULL,
    `phone` VARCHAR(100) NOT NULL,
    `jobID` VARCHAR(100) NOT NULL,
    `message` VARCHAR(1000) NOT NULL,
    `jobOwner` VARCHAR(100) NOT NULL
);
ALTER TABLE
    `applyJob` ADD PRIMARY KEY `applyjob_jobowner_primary`(`jobOwner`);
    
-- 4. customers table
CREATE TABLE `customers`(
    `fullname` VARCHAR(100) NULL,
    `username` VARCHAR(100) NOT NULL,
    `password` VARCHAR(100) NOT NULL,
    `email` VARCHAR(100) NULL,
    `phone` VARCHAR(100) NOT NULL,
    `region` VARCHAR(100) NOT NULL,
    `town` VARCHAR(100) NOT NULL,
    `kebele` VARCHAR(100) NOT NULL,
    `housenumber` VARCHAR(100) NOT NULL
);
ALTER TABLE
    `customers` ADD PRIMARY KEY `customers_email_primary`(`email`);
-- 5. trucker table
CREATE TABLE `truckers`(
    `fullname` VARCHAR(100) NOT NULL,
    `username` VARCHAR(100) NOT NULL,
    `password` VARCHAR(100) NOT NULL,
    `email` VARCHAR(100) NOT NULL,
    `phone` VARCHAR(100) NOT NULL,
    `region` VARCHAR(100) NOT NULL,
    `town` VARCHAR(100) NOT NULL,
    `kebele` VARCHAR(100) NOT NULL,
    `housenumber` VARCHAR(100) NOT NULL
);
ALTER TABLE
    `truckers` ADD PRIMARY KEY `truckers_email_primary`(`email`);

-- 6. accepted jobs
CREATE TABLE `acceptedJobs`(
	`name` VARCHAR(100) NOT NULL,
    `email` VARCHAR(100) NOT NULL,
    `phone` VARCHAR(100) NOT NULL,
    `jobID` VARCHAR(100) NOT NULL,
    `message` VARCHAR(1000) NOT NULL,
    `jobOwner` VARCHAR(100) NOT NULL
);
ALTER TABLE
    `acceptedJobs` ADD PRIMARY KEY `acceptedjobs_jobid_primary`(`jobID`);

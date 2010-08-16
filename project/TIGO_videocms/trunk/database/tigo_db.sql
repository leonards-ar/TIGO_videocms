--
-- Create schema tigo_videocms_db
--
CREATE DATABASE IF NOT EXISTS tigo_videocms_db;
USE tigo_videocms_db;

GRANT all ON tigo_videocms_db.* TO 'tigo'@'localhost' IDENTIFIED BY 'java1234';
GRANT all ON tigo_videocms_db.* TO 'tigo'@'%' IDENTIFIED BY 'java1234';
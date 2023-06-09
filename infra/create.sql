CREATE DATABASE sgbd;
USE sgbd;
CREATE SCHEMA test;
CREATE TABLE test.test (
                      name VARCHAR(50) NOT NULL,
                      salary DECIMAL(18,2) NOT NULL,
                      location VARCHAR(50) NOT NULL
);

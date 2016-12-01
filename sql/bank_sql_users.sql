-- Create a new table space which will maintain all banking application database
CREATE TABLESPACE BAPTS_01
  DATAFILE 'D:\Apps\oracle\oracle\oradata\bapts01.dbf'
  SIZE 2048m SEGMENT SPACE MANAGEMENT AUTO;

-- Create a new admin user for the bank application
CREATE USER BANKADM
  IDENTIFIED BY "BANKADM"
  DEFAULT TABLESPACE BAPTS_01 TEMPORARY TABLESPACE TEMP PROFILE DEFAULT;

-- Create new roles for user and read only
CREATE ROLE BANK_READ;
CREATE ROLE BANK_USER;

-- Grant required privelges to admin user
GRANT UNLIMITED TABLESPACE TO BANKADM WITH ADMIN OPTION;
GRANT SELECT ANY TABLE TO BANKADM;
GRANT CREATE DATABASE LINK TO BANKADM;
GRANT CONNECT TO BANKADM;
GRANT RESOURCE TO BANKADM;
GRANT DBA TO BANKADM WITH ADMIN OPTION;
GRANT CREATE ANY SYNONYM TO BANKADM;
GRANT SELECT ANY DICTIONARY TO BANKADM;

CREATE USER BANKUSER PROFILE DEFAULT IDENTIFIED BY "BANKUSER"
  DEFAULT TABLESPACE BAPTS_01
  TEMPORARY TABLESPACE TEMP;

GRANT SELECT ANY TABLE TO BANKUSER;
GRANT BANK_USER TO BANKUSER;
GRANT BANK_READ TO BANKUSER;
GRANT CONNECT TO BANKUSER;

CREATE USER BANKOPR PROFILE DEFAULT IDENTIFIED BY "BANKOPR"
  DEFAULT TABLESPACE BAPTS_01
  TEMPORARY TABLESPACE TEMP;

GRANT CONNECT TO BANKOPR;
GRANT RESOURCE TO BANKOPR;
GRANT EXP_FULL_DATABASE TO BANKOPR;

CREATE USER BANKREAD IDENTIFIED BY "BANKREAD"
  DEFAULT TABLESPACE BAPTS_01
  TEMPORARY TABLESPACE TEMP;

GRANT SELECT ANY TABLE TO BANKREAD;
GRANT BANK_READ TO BANKREAD;
GRANT CONNECT TO BANKREAD;

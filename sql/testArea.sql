-- Check all table spaces within the system
SELECT TABLESPACE_NAME "TABLESPACE",
   INITIAL_EXTENT "INITIAL_EXT",
   NEXT_EXTENT "NEXT_EXT",
   MIN_EXTENTS "MIN_EXT",
   MAX_EXTENTS "MAX_EXT",
   PCT_INCREASE
   FROM DBA_TABLESPACES;

-- Get all users information
SELECT * FROM ALL_USERS;

-- get current user information
SELECT * FROM USER_USERS;

-- get al DBA user information
SELECT * FROM DBA_USERS;

-- Create a new user
-- This needs sys as sysdba role to create
CREATE USER manu
    IDENTIFIED BY yadav
    DEFAULT TABLESPACE example
    QUOTA 20M ON example
    TEMPORARY TABLESPACE temp
    QUOTA 5M ON system
    PROFILE default
    ACCOUNT UNLOCK;

-- Grant all required privelges to the new user
GRANT create session TO manu;
GRANT create table TO manu;
GRANT create view TO manu;
GRANT create any trigger TO manu;
GRANT create any procedure TO manu;
GRANT create sequence TO manu;
GRANT create synonym TO manu;

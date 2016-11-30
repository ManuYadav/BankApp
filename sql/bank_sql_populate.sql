
--INSERTS
--ACT1
INSERT INTO customer VALUES(1,'111','Mansour','Mohamed','1339 Meadowlands Drive','Ottawa','6132554503','m0.interactive@gmail.com','Evening');
INSERT INTO customer VALUES(2,'111','Abbadi','Laith','Candaa','Ottawa','6132554503','Laith@hotmail.com','Morning');
INSERT INTO customer VALUES(3,'111','Tadesse','Yohannese','1339 Meadowlands Drive','Toronto','6132554503','m0.interactive@gmail.com','Evening');
INSERT INTO customer VALUES(4,'111','Hamdan','Tima','Some neighborhoos','Ottawa','6132554503','tima@gmail.com','Morning');

INSERT INTO account VALUES(1,104.5);
INSERT INTO account VALUES(2,204.5);
INSERT INTO account VALUES(3,176.5);
INSERT INTO account VALUES(4,304.5);
INSERT INTO account VALUES(5,1134.5);
INSERT INTO account VALUES(6,435.5);
INSERT INTO account VALUES(7,32.5);
INSERT INTO account VALUES(8,162.5);
INSERT INTO account VALUES(9,128.5);

INSERT INTO savings VALUES (1,32);
INSERT INTO savings VALUES (2,12);
INSERT INTO savings VALUES (3,42);
INSERT INTO savings VALUES (4,62);
INSERT INTO savings VALUES (5,12);
INSERT INTO savings VALUES (6,33);
INSERT INTO savings VALUES (7,3);
INSERT INTO savings VALUES (8,5.1);
INSERT INTO savings VALUES (9,32);

INSERT INTO holds VALUES (1,1,1);
INSERT INTO holds VALUES (1,2,1);
INSERT INTO holds VALUES (1,3,1);
INSERT INTO holds VALUES (2,4,1);
INSERT INTO holds VALUES (2,5,1);
INSERT INTO holds VALUES (2,6,1);
INSERT INTO holds VALUES (3,7,1);
INSERT INTO holds VALUES (4,8,1);
INSERT INTO holds VALUES (4,9,1);


--BILL PAYEES
INSERT INTO payee(payee) VALUES('Rogers Cable');
INSERT INTO payee(payee) VALUES('Rogers Cell');
INSERT INTO payee(payee) VALUES('Bell Sympatico');
INSERT INTO payee(payee) VALUES('Environment Canada');
INSERT INTO payee(payee) VALUES('Xbox Live');
INSERT INTO payee(payee) VALUES('Fido');
INSERT INTO payee(payee) VALUES('Minto Rent');
INSERT INTO payee(payee) VALUES('Blockbuster');
INSERT INTO payee(payee) VALUES('Futureshop');
INSERT INTO payee(payee) VALUES('Godaddy Service IP');


INSERT INTO employee VALUES(1,'password','Yohannes','Tadesse','613-834-7487',current_date);
INSERT INTO employee VALUES(2,'123','Iluju','Kiringa','562-5800',current_date);

INSERT INTO per_banker VALUES(1);
INSERT INTO per_banker VALUES(2);

INSERT INTO acc_sup VALUES(1,1,2);
INSERT INTO acc_sup VALUES(2,1,2);
INSERT INTO acc_sup VALUES(3,1,1);
INSERT INTO acc_sup VALUES(4,2,2);
INSERT INTO acc_sup VALUES(5,2,2);
INSERT INTO acc_sup VALUES(6,2,1);
INSERT INTO acc_sup VALUES(7,3,2);
INSERT INTO acc_sup VALUES(8,4,2);
INSERT INTO acc_sup VALUES(9,4,1);

INSERT INTO account VALUES(10,1128.5);
INSERT INTO checking VALUES (10,50);
INSERT INTO holds VALUES (1,10,2);
INSERT INTO acc_sup VALUES(10,1,1);

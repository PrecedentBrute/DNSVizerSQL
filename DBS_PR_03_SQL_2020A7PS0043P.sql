-- database, views and tables

create database viz;
use viz;
CREATE TABLE IF NOT EXISTS dlbwa (
    `dlb_add` VARCHAR(50) CHARACTER SET utf8 not null,
    `sub` VARCHAR(50) CHARACTER SET utf8 not null,
    `ip_add` VARCHAR(50) CHARACTER SET utf8 not null unique,
    `PubKSK` VARCHAR(50) CHARACTER SET utf8 not null,
    `PubZSK` VARCHAR(50) CHARACTER SET utf8 not null,
    unique (`dlb_add`,`sub`)
);

INSERT INTO dlbwa VALUES
    ('192.168.1.1','www.','192.169.1.1','www.','169.1.1'),
    ('192.168.1.1','www.blog.','192.170.1.1','www.blog.','170.1.1'),
    ('192.168.1.1','www.test.','192.171.1.1','www.test.','171.1.1'),
    ('192.168.1.2','www.','192.169.1.2','www.','169.1.2'),
    ('192.168.1.2','www.blog.','192.170.1.2','www.blog.','170.1.2'),
    ('192.168.1.2','www.test.','192.171.1.2','www.test.','171.1.2'),
    ('192.168.1.3','www.','192.169.1.3','www.','169.1.3'),
    ('192.168.1.3','www.blog.','192.170.1.3','www.blog.','170.1.3'),
    ('192.168.1.3','www.test.','192.171.1.3','www.test.','171.1.3'),
    ('192.168.2.1','www.','192.169.1.4','www.','169.1.4'),
    ('192.168.2.1','www.blog.','192.170.1.4','www.blog.','170.1.4'),
    ('192.168.2.1','www.test.','192.171.1.4','www.test.','171.1.4'),
    ('192.168.2.2','www.','192.169.1.5','www.','169.1.5'),
    ('192.168.2.2','www.blog.','192.170.1.5','www.blog.','170.1.5'),
    ('192.168.2.2','www.test.','192.171.1.5','www.test.','171.1.5'),
    ('192.168.2.3','www.','192.169.1.6','www.','169.1.6'),
    ('192.168.2.3','www.blog.','192.170.1.6','www.blog.','170.1.6'),
    ('192.168.2.3','www.test.','192.171.1.6','www.test.','171.1.6'),
    ('192.168.3.1','www.','192.169.1.7','www.','169.1.7'),
    ('192.168.3.1','www.blog.','192.170.1.7','www.blog.','170.1.7'),
    ('192.168.3.1','www.test.','192.171.1.7','www.test.','171.1.7'),
    ('192.168.3.2','www.','192.169.1.8','www.','169.1.8'),
    ('192.168.3.2','www.blog.','192.170.1.8','www.blog.','170.1.8'),
    ('192.168.3.2','www.test.','192.171.1.8','www.test.','171.1.8'),
    ('192.168.3.3','www.','192.169.1.9','www.','169.1.9'),
    ('192.168.3.3','www.blog.','192.170.1.9','www.blog.','170.1.9'),
    ('192.168.3.3','www.test.','192.171.1.9','www.test.','171.1.9'),
    ('192.168.4.1','www.','192.169.1.10','www.','169.1.10'),
    ('192.168.4.1','www.blog.','192.170.1.10','www.blog.','170.1.10'),
    ('192.168.4.1','www.test.','192.171.1.10','www.test.','171.1.10'),
    ('192.168.4.2','www.','192.169.1.11','www.','169.1.11'),
    ('192.168.4.2','www.blog.','192.170.1.11','www.blog.','170.1.11'),
    ('192.168.4.2','www.test.','192.171.1.11','www.test.','171.1.11'),
    ('192.168.4.3','www.','192.169.1.12','www.','169.1.12'),
    ('192.168.4.3','www.blog.','192.170.1.12','www.blog.','170.1.12'),
    ('192.168.4.3','www.test.','192.171.1.12','www.test.','171.1.12');
    CREATE TABLE IF NOT EXISTS netwa (
    `net_add` VARCHAR(50) CHARACTER SET utf8 not null,
    `dlb` VARCHAR(50) CHARACTER SET utf8 not null,
    `dlb_add` VARCHAR(50) CHARACTER SET utf8 not null unique,
    `PubKSK` VARCHAR(50) CHARACTER SET utf8 not null,
    `PubZSK` VARCHAR(50) CHARACTER SET utf8 not null,
    unique (`net_add`,`dlb`)
);

INSERT INTO netwa VALUES
    ('192.168.1.0','google','192.168.1.1','google','1.1'),
    ('192.168.1.0','facebook','192.168.1.2','facebook','1.2'),
    ('192.168.1.0','youtube','192.168.1.3','youtube','1.3'),
    ('192.168.2.0','google','192.168.2.1','google','2.1'),
    ('192.168.2.0','facebook','192.168.2.2','facebook','2.2'),
    ('192.168.2.0','youtube','192.168.2.3','youtube','2.3'),
    ('192.168.3.0','google','192.168.3.1','google','3.1'),
    ('192.168.3.0','facebook','192.168.3.2','facebook','3.2'),
    ('192.168.3.0','youtube','192.168.3.3','youtube','3.3'),
    ('192.168.4.0','google','192.168.4.1','google','4.1'),
    ('192.168.4.0','facebook','192.168.4.2','facebook','4.2'),
    ('192.168.4.0','youtube','192.168.4.3','youtube','4.3');
CREATE TABLE IF NOT EXISTS rootwa (
    `domain` VARCHAR(50) CHARACTER SET utf8 not null unique,
    `net_add` VARCHAR(50) CHARACTER SET utf8 not null unique,
    `PubKSK` VARCHAR(50) CHARACTER SET utf8 not null,
    `PubZSK` VARCHAR(50) CHARACTER SET utf8 not null
);

INSERT INTO rootwa VALUES
    ('.com','192.168.1.0','com','1.0'),
    ('.net','192.168.2.0','net','2.0'),
    ('.edu','192.168.3.0','edu','3.0'),
    ('.org','192.168.4.0','org','4.0');


CREATE TABLE IF NOT EXISTS queries(`Domain name` varchar(50) unique not null,`Cache IP Address` varchar(50)  default null,
`Root IP Address` varchar(50) default null ,`Net IP Address`varchar(50) default null ,`DLB IP Address`varchar(50) default null , `IP Address` varchar(50) unique default null);
INSERT INTO queries (`Domain name`) values ('www.google.com'),('www.blog.google.com'),('www.test.google.com'),
('www.facebook.com'),('www.blog.facebook.com'),('www.test.facebook.com'),
('www.youtube.com'),('www.blog.youtue.com'),('www.test.youtube.com'),
('www.google.net'),('www.blog.google.net'),('www.test.google.net'),
('www.facebook.net'),('www.blog.facebook.net'),('www.test.facebook.net'),
('www.youtube.net'),('www.blog.youtue.net'),('www.test.youtube.net'),
('www.google.org'),('www.blog.google.org'),('www.test.google.org'),
('www.facebook.org'),('www.blog.facebook.org'),('www.test.facebook.org'),
('www.youtube.org'),('www.blog.youtue.org'),('www.test.youtube.org'),
('www.google.edu'),('www.blog.google.edu'),('www.test.google.edu'),
('www.facebook.edu'),('www.blog.facebook.edu'),('www.test.facebook.edu'),
('www.youtube.edu'),('www.blog.youtue.edu'),('www.test.youtube.edu');

create table root as SELECT *,aes_encrypt(domain,PubKSK) as RRSet,aes_encrypt(net_add,PubZSK) as RRSig FROM rootwa;    
create table net as SELECT *,aes_encrypt(dlb,PubKSK) as RRSet,aes_encrypt(dlb_add,PubZSK) as RRSig FROM netwa;
create table dlb as SELECT *,aes_encrypt(sub,PubKSK) as RRSet,aes_encrypt(ip_add,PubZSK) as RRSig FROM dlbwa;


ALTER TABLE root MODIFY  `domain` varchar(50) not null unique,
   modify `net_add` VARCHAR(50) CHARACTER SET utf8 not null unique,
   modify `PubKSK` VARCHAR(50) CHARACTER SET utf8 not null,
    modify `PubZSK` VARCHAR(50) CHARACTER SET utf8 not null;
    
ALTER TABLE net modify `net_add` VARCHAR(50) CHARACTER SET utf8 not null,
    modify `dlb` VARCHAR(50) CHARACTER SET utf8 not null,
    modify `dlb_add` VARCHAR(50) CHARACTER SET utf8 not null unique,
    modify `PubKSK` VARCHAR(50) CHARACTER SET utf8 not null,
    modify `PubZSK` VARCHAR(50) CHARACTER SET utf8 not null,
    add unique (`net_add`,`dlb`),
    ADD FOREIGN KEY (`net_add`) REFERENCES root(`net_add`);

ALTER TABLE dlb modify `dlb_add` VARCHAR(50) CHARACTER SET utf8 not null,
    modify `sub` VARCHAR(50) CHARACTER SET utf8 not null,
    modify `ip_add` VARCHAR(50) CHARACTER SET utf8 not null unique,
    modify `PubKSK` VARCHAR(50) CHARACTER SET utf8 not null,
    modify `PubZSK` VARCHAR(50) CHARACTER SET utf8 not null,
    add unique (`dlb_add`,`sub`),
    ADD FOREIGN KEY (`dlb_add`) REFERENCES net(`dlb_add`);

   
-- this is part of the code to be executed since the tables are redundant 

    drop table netwa;
    drop table dlbwa;
    drop table rootwa;


create view `view` as select sub,dlb,domain,net.net_add,dlb.dlb_add,ip_add from dlb inner join net on dlb.dlb_add=net.dlb_add inner join root on root.net_add=net.net_add;
    
-------------------------------------------------------------------------------------------------------------    
-- procedures 


DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `splitname`(IN name varchar(50),out dlb varchar(50),out net varchar(50),out root varchar(50))
 READS SQL DATA
 DETERMINISTIC
 SQL SECURITY INVOKER
 COMMENT 'Splits and stores processed domain names.'
BEGIN
SET AUTOCOMMIT = 0;
set @i=length(name)-length(replace(name,'.',''));
SELECT concat(SUBSTRING_INDEX(name,'.',@i-1),'.') into dlb;
Select SUBSTRING_INDEX(SUBSTRING_INDEX(name,'.',-2),'.',1) into net;
select concat('.',SUBSTRING_INDEX(name,'.',-1)) into root;

END$$
DELIMITER ;




DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_ip`(IN link varchar(50),OUT rad varchar(50),OUT ntad varchar(50),OUT dad varchar(50))
DETERMINISTIC
 READS SQL DATA
 SQL SECURITY INVOKER
 COMMENT 'Gets IP Address required'
BEGIN
SET AUTOCOMMIT = 0;
if(link not in (select `Domain name` from queries)) then SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Sorry but Domain name does not exist in our database. Try adding a new entry.';
else 

 (select `IP Address` into @x from queries where `Domain name`=link) ;
if (@x is not null) then  (select `IP Address` into dad from queries where `Domain name`=link) ;
 (select `DLB IP Address` into ntad from queries where `Domain name`=link) ;
  (select `Net IP Address` into rad from queries where `Domain name`=link) ;
else 


set @a='',@b='',@c='';
call splitname(link,@a,@b,@c);
if(@c not in (select distinct domain from root)) then SIGNAL SQLSTATE '45000' 
      SET MESSAGE_TEXT = 'Sorry but Domain name does not exist in our database. Try adding a new entry.';
      end if;
if(@b not in (select distinct dlb from net)) then SIGNAL SQLSTATE '45000' 
      SET MESSAGE_TEXT = 'Sorry but Domain name does not exist in our database. Try adding a new entry.';
      end if;
if(@a not in (select distinct sub from dlb)) then SIGNAL SQLSTATE '45000' 
      SET MESSAGE_TEXT = 'Sorry but Domain name does not exist in our database. Try adding a new entry.';
      end if;

set @p=NULL,@q=NULL;
select aes_decrypt(RRSet,PubKSK) into @p from root where domain=".com";
IF (@p is null) then SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error in Authentication.';
     END IF;
select aes_decrypt(RRSig,PubZSK) into @q from root where domain=".com";
IF (@q is null) then SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error in Authentication.';
     END IF;
     
     
set @p=NULL,@q=NULL;
select aes_decrypt(net.RRSet,net.PubKSK) into @p from root inner join net on root.net_add=net.net_add where root.domain=@c and net.dlb=@b;
IF (@p is null) then SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error in Authentication.';
     END IF;
select aes_decrypt(net.RRSig,net.PubZSK) into @q from root inner join net on root.net_add=net.net_add where root.domain=@c and net.dlb=@b;
IF (@q is null) then SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error in Authentication.';
     END IF;


set @p=NULL,@q=NULL;
select aes_decrypt(dlb.RRSet,dlb.PubKSK) into @p from root inner join net on root.net_add=net.net_add inner join dlb on dlb.dlb_add=net.dlb_add where root.domain=@c and net.dlb=@b  and dlb.sub=@a;
IF (@p is null) then SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error in Authentication.';
     END IF;
select aes_decrypt(dlb.RRSig,dlb.PubZSK) into @q from root inner join net on root.net_add=net.net_add inner join dlb on dlb.dlb_add=net.dlb_add where root.domain=@c and net.dlb=@b and dlb.sub=@a;
IF (@q is null) then SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error in Authentication.';
     END IF;

 select dlb.ip_add,net.dlb_add,root.net_add into dad,ntad,rad  from dlb inner join net on dlb.dlb_add=net.dlb_add inner join root on root.net_add=net.net_add 
 where domain=@c and dlb=@b and sub=@a;
 Start transaction;
set global transaction isolation level repeatable read;
 if(link not in (select `Domain name` from queries)) 
     then insert into queries values (link,'111.11.11.1','111.11.11.0',rad,ntad,dad);
else delete from queries where `Domain name`=link; insert into queries values (link,'111.11.11.1','111.11.11.0',rad,ntad,dad);

end if;
 end if;
 end if;

 commit;
END$$
DELIMITER ;




DELIMITER $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `set_ip`(IN link varchar(50), IN ntad varchar(50), IN dlbadd varchar(50), IN ipad VARCHAR(50),
OUT ipadd varchar(50))
DETERMINISTIC
 READS SQL DATA
 SQL SECURITY INVOKER
 COMMENT 'Sets IP Address required'
BEGIN
SET AUTOCOMMIT = 0;
set @var=ntad;
set @a='',@b='',@c='';
call splitname(link,@a,@b,@c);
Start transaction;
set global transaction isolation level repeatable read;
if (strcmp(ntad,dlbadd)=0 or strcmp(ntad,ipad)=0 or strcmp(ipad,dlbadd)=0) then SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error in details entered(d).';
end if;
if(@c not in (select distinct domain from root)) then 
if ( ntad in (select ip_add from dlb inner join net on dlb.dlb_add=net.dlb_add inner join root on root.net_add=net.net_add union 
			select net.net_add from dlb inner join net on dlb.dlb_add=net.dlb_add inner join root on root.net_add=net.net_add union
			select dlb.dlb_add from dlb inner join net on dlb.dlb_add=net.dlb_add inner join root on root.net_add=net.net_add))
then SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error in details entered(d).';
end if;
if ( dlbadd in (select ip_add from dlb inner join net on dlb.dlb_add=net.dlb_add inner join root on root.net_add=net.net_add union 
			select net.net_add from dlb inner join net on dlb.dlb_add=net.dlb_add inner join root on root.net_add=net.net_add union
			select dlb.dlb_add from dlb inner join net on dlb.dlb_add=net.dlb_add inner join root on root.net_add=net.net_add))
then SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error in details entered(d).';
end if;
if ( ipad in (select ip_add from dlb inner join net on dlb.dlb_add=net.dlb_add inner join root on root.net_add=net.net_add union 
			select net.net_add from dlb inner join net on dlb.dlb_add=net.dlb_add inner join root on root.net_add=net.net_add union
			select dlb.dlb_add from dlb inner join net on dlb.dlb_add=net.dlb_add inner join root on root.net_add=net.net_add))
then SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error in details entered(d).';
end if;

insert into root values (@c,ntad,@c,ntad,aes_encrypt(@c,@c),aes_encrypt(ntad,ntad));
insert into net values (ntad,@b,dlbadd,@b,dlbadd,aes_encrypt(@b,@b),aes_encrypt(dlbadd,dlbadd));
insert into dlb values (dlbadd,@a,ipad,@a,ipad,aes_encrypt(@a,@a),aes_encrypt(ipad,ipad));
else select net_add from root where domain=@c into ntad;
if(strcmp(ntad,@var)<>0) then SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error in details entered(1)';
end if;
      end if;

set @var=dlbadd;
if(@b not in (select distinct dlb from net where net.net_add=ntad)) then

if ( dlbadd in (select ip_add from dlb inner join net on dlb.dlb_add=net.dlb_add inner join root on root.net_add=net.net_add union 
			select net.net_add from dlb inner join net on dlb.dlb_add=net.dlb_add inner join root on root.net_add=net.net_add union
			select dlb.dlb_add from dlb inner join net on dlb.dlb_add=net.dlb_add inner join root on root.net_add=net.net_add))
then SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error in details entered(d).';
end if;
if ( ipad in (select ip_add from dlb inner join net on dlb.dlb_add=net.dlb_add inner join root on root.net_add=net.net_add union 
			select net.net_add from dlb inner join net on dlb.dlb_add=net.dlb_add inner join root on root.net_add=net.net_add union
			select dlb.dlb_add from dlb inner join net on dlb.dlb_add=net.dlb_add inner join root on root.net_add=net.net_add))
then SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error in details entered(d).';
end if;


 
insert into net values (ntad,@b,dlbadd,@b,dlbadd,aes_encrypt(@b,@b),aes_encrypt(dlbadd,dlbadd));
insert into dlb values (dlbadd,@a,ipad,@a,ipad,aes_encrypt(@a,@a),aes_encrypt(ipad,ipad));
else select dlb_add from net where net_add=ntad and dlb=@b into dlbadd;
if(strcmp(dlbadd,@var)<>0) then SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error in details entered(2).';
end if;
      end if;
      
set @var=ipad;
if(@a not in (select distinct sub from dlb inner join net on net.dlb_add=dlb.dlb_add where dlb.dlb_add=dlbadd and net.net_add=ntad)) then 

if ( ipad in (select ip_add from dlb inner join net on dlb.dlb_add=net.dlb_add inner join root on root.net_add=net.net_add union 
			select net.net_add from dlb inner join net on dlb.dlb_add=net.dlb_add inner join root on root.net_add=net.net_add union
			select dlb.dlb_add from dlb inner join net on dlb.dlb_add=net.dlb_add inner join root on root.net_add=net.net_add))
then SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error in details entered(d).';
end if;

insert into dlb values (dlbadd,@a,ipad,@a,ipad,aes_encrypt(@a,@a),aes_encrypt(ipad,ipad));
      end if;

 select ip_add into ipadd from dlb inner join net on dlb.dlb_add=net.dlb_add inner join root on root.net_add=net.net_add 
 where domain=@c and dlb=@b and sub=@a;
 


   insert into queries(`Domain Name`) values (link);
 
 commit;
END$$
DELIMITER ;


---------------------------------------------------------------------------------------------------------------------------------------------------------
-- Test Queries;

select * from root; 
select * from net; 
select * from dlb; 
select * from queries;
select * from `view`;
call get_ip('www.google.com',@x,@y,@z);
select * from queries;
call get_ip('www.youtube.edu',@x,@y,@z);
select * from queries;
call get_ip('www.blog.facebook.org',@x,@y,@z);
select * from queries;
call get_ip('www.youtube.wed',@x,@y,@z);
call set_ip('www.youtube.com','172.133.14.4','172.133.14.3','172.133.14.2',@x);
call set_ip('www.youtube.com','192.168.1.0','172.133.14.3','172.133.14.2',@x);
call set_ip('www.youtube.com','192.168.1.0','192.168.1.3','172.133.14.2',@x);
call set_ip('www.zone.com','192.168.1.0','192.168.1.3','172.133.14.2',@x);
call set_ip('wwe.age.lok','192.164.1.0','192.164.1.0','192.164.1.0',@x);
call set_ip('wwe.age.lok','192.164.1.0','192.161.1.3','172.133.14.2',@x);
call get_ip('wwe.age.lok',@x,@y,@z);
select * from root; 
select * from net; 
select * from dlb; 
select * from queries;
select * from `view`;


-- These cover all cases (An additional Authentication check is also performed in the video which occurs only when there is an issue in Encryption/Decryption Authentication process). 
    
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- dropping queries

 
-- drop procedure get_ip, set_ip, splitname
-- drop view `view`
-- drop table root, net, dlb, queries;


    
   
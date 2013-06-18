use phpcourier;

Delete from Domains;
Delete from DomainAccess;
Delete from Accounts;
Delete from Mail;
Delete from Aliases;
Delete from UpdateTime;
Delete from Sessions;


INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,EditBy,EditWhen)
VALUES
('1','0','root', PASSWORD('pisvs4'),'pisvs4','Root Administrator','M','true','1',NOW());

INSERT INTO UpdateTime (AliasExtractTime, AliasUpdateTime, DomainUpdateTime, DomainExtractTime)
VALUES
(NOW(),NOW(),NOW(),NOW());

INSERT INTO Domains
(DomainId,Domainname,Uid,Gid,Directory,Quota,MailboxLimit,AliasLimit,EditBy,EditWhen)
VALUES
('1','domain001.com','60','60','/home/daniell/domains/domain001','100','5','5','1',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,EditBy,EditWhen)
VALUES
('2','0','admin001',PASSWORD('admin001pw'),'admin001pw','Administrator 1','A','true','1',NOW());

INSERT INTO DomainAccess (AccountId, DomainId) VALUES ('2','1');

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('3','1','user001', PASSWORD('user001pw'),'user001pw','User 1','U','true','5','2',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('1','3','1','user001-mbx001','user001-mbx001pw', 'user001-mbx001@domain001.com', 'User 1', '60', '60', '100', '/home/daniell/domains/domain001/user001-mbx001', '5', '3',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('1','1','3','1','user001-mbx001-1','3',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('2','1','3','1','user001-mbx001-2','3',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('2','3','1','user001-mbx002','user001-mbx002pw', 'user001-mbx002@domain001.com', 'User 1', '60', '60', '100', '/home/daniell/domains/domain001/user001-mbx002', '5', '3',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('3','2','3','1','user001-mbx002-1','3',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('4','2','3','1','user001-mbx002-2','3',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('4','1','user002', PASSWORD('user002pw'),'user002pw','User 2','U','true','5','2',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('3','4','1','user002-mbx001','user002-mbx001pw', 'user002-mbx001@domain001.com', 'User 2', '60', '60', '100', '/home/daniell/domains/domain001/user002-mbx001', '5', '4',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('5','3','4','1','user002-mbx001-1','4',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('6','3','4','1','user002-mbx001-2','4',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('4','4','1','user002-mbx002','user002-mbx002pw', 'user002-mbx002@domain001.com', 'User 2', '60', '60', '100', '/home/daniell/domains/domain001/user002-mbx002', '5', '4',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('7','4','4','1','user002-mbx002-1','4',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('8','4','4','1','user002-mbx002-2','4',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('5','1','user003', PASSWORD('user003pw'),'user003pw','User 3','U','true','5','2',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('5','5','1','user003-mbx001','user003-mbx001pw', 'user003-mbx001@domain001.com', 'User 3', '60', '60', '100', '/home/daniell/domains/domain001/user003-mbx001', '5', '5',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('9','5','5','1','user003-mbx001-1','5',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('10','5','5','1','user003-mbx001-2','5',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('6','5','1','user003-mbx002','user003-mbx002pw', 'user003-mbx002@domain001.com', 'User 3', '60', '60', '100', '/home/daniell/domains/domain001/user003-mbx002', '5', '5',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('11','6','5','1','user003-mbx002-1','5',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('12','6','5','1','user003-mbx002-2','5',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('6','1','user004', PASSWORD('user004pw'),'user004pw','User 4','U','true','5','2',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('7','6','1','user004-mbx001','user004-mbx001pw', 'user004-mbx001@domain001.com', 'User 4', '60', '60', '100', '/home/daniell/domains/domain001/user004-mbx001', '5', '6',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('13','7','6','1','user004-mbx001-1','6',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('14','7','6','1','user004-mbx001-2','6',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('8','6','1','user004-mbx002','user004-mbx002pw', 'user004-mbx002@domain001.com', 'User 4', '60', '60', '100', '/home/daniell/domains/domain001/user004-mbx002', '5', '6',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('15','8','6','1','user004-mbx002-1','6',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('16','8','6','1','user004-mbx002-2','6',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('7','1','user005', PASSWORD('user005pw'),'user005pw','User 5','U','true','5','2',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('9','7','1','user005-mbx001','user005-mbx001pw', 'user005-mbx001@domain001.com', 'User 5', '60', '60', '100', '/home/daniell/domains/domain001/user005-mbx001', '5', '7',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('17','9','7','1','user005-mbx001-1','7',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('18','9','7','1','user005-mbx001-2','7',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('10','7','1','user005-mbx002','user005-mbx002pw', 'user005-mbx002@domain001.com', 'User 5', '60', '60', '100', '/home/daniell/domains/domain001/user005-mbx002', '5', '7',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('19','10','7','1','user005-mbx002-1','7',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('20','10','7','1','user005-mbx002-2','7',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('8','1','user006', PASSWORD('user006pw'),'user006pw','User 6','U','true','5','2',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('11','8','1','user006-mbx001','user006-mbx001pw', 'user006-mbx001@domain001.com', 'User 6', '60', '60', '100', '/home/daniell/domains/domain001/user006-mbx001', '5', '8',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('21','11','8','1','user006-mbx001-1','8',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('22','11','8','1','user006-mbx001-2','8',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('12','8','1','user006-mbx002','user006-mbx002pw', 'user006-mbx002@domain001.com', 'User 6', '60', '60', '100', '/home/daniell/domains/domain001/user006-mbx002', '5', '8',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('23','12','8','1','user006-mbx002-1','8',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('24','12','8','1','user006-mbx002-2','8',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('9','1','user007', PASSWORD('user007pw'),'user007pw','User 7','U','true','5','2',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('13','9','1','user007-mbx001','user007-mbx001pw', 'user007-mbx001@domain001.com', 'User 7', '60', '60', '100', '/home/daniell/domains/domain001/user007-mbx001', '5', '9',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('25','13','9','1','user007-mbx001-1','9',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('26','13','9','1','user007-mbx001-2','9',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('14','9','1','user007-mbx002','user007-mbx002pw', 'user007-mbx002@domain001.com', 'User 7', '60', '60', '100', '/home/daniell/domains/domain001/user007-mbx002', '5', '9',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('27','14','9','1','user007-mbx002-1','9',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('28','14','9','1','user007-mbx002-2','9',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('10','1','user008', PASSWORD('user008pw'),'user008pw','User 8','U','true','5','2',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('15','10','1','user008-mbx001','user008-mbx001pw', 'user008-mbx001@domain001.com', 'User 8', '60', '60', '100', '/home/daniell/domains/domain001/user008-mbx001', '5', '10',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('29','15','10','1','user008-mbx001-1','10',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('30','15','10','1','user008-mbx001-2','10',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('16','10','1','user008-mbx002','user008-mbx002pw', 'user008-mbx002@domain001.com', 'User 8', '60', '60', '100', '/home/daniell/domains/domain001/user008-mbx002', '5', '10',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('31','16','10','1','user008-mbx002-1','10',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('32','16','10','1','user008-mbx002-2','10',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('11','1','user009', PASSWORD('user009pw'),'user009pw','User 9','U','true','5','2',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('17','11','1','user009-mbx001','user009-mbx001pw', 'user009-mbx001@domain001.com', 'User 9', '60', '60', '100', '/home/daniell/domains/domain001/user009-mbx001', '5', '11',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('33','17','11','1','user009-mbx001-1','11',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('34','17','11','1','user009-mbx001-2','11',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('18','11','1','user009-mbx002','user009-mbx002pw', 'user009-mbx002@domain001.com', 'User 9', '60', '60', '100', '/home/daniell/domains/domain001/user009-mbx002', '5', '11',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('35','18','11','1','user009-mbx002-1','11',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('36','18','11','1','user009-mbx002-2','11',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('12','1','user010', PASSWORD('user010pw'),'user010pw','User 10','U','true','5','2',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('19','12','1','user010-mbx001','user010-mbx001pw', 'user010-mbx001@domain001.com', 'User 10', '60', '60', '100', '/home/daniell/domains/domain001/user010-mbx001', '5', '12',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('37','19','12','1','user010-mbx001-1','12',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('38','19','12','1','user010-mbx001-2','12',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('20','12','1','user010-mbx002','user010-mbx002pw', 'user010-mbx002@domain001.com', 'User 10', '60', '60', '100', '/home/daniell/domains/domain001/user010-mbx002', '5', '12',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('39','20','12','1','user010-mbx002-1','12',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('40','20','12','1','user010-mbx002-2','12',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('13','1','user011', PASSWORD('user011pw'),'user011pw','User 11','U','true','5','2',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('21','13','1','user011-mbx001','user011-mbx001pw', 'user011-mbx001@domain001.com', 'User 11', '60', '60', '100', '/home/daniell/domains/domain001/user011-mbx001', '5', '13',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('41','21','13','1','user011-mbx001-1','13',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('42','21','13','1','user011-mbx001-2','13',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('22','13','1','user011-mbx002','user011-mbx002pw', 'user011-mbx002@domain001.com', 'User 11', '60', '60', '100', '/home/daniell/domains/domain001/user011-mbx002', '5', '13',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('43','22','13','1','user011-mbx002-1','13',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('44','22','13','1','user011-mbx002-2','13',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('14','1','user012', PASSWORD('user012pw'),'user012pw','User 12','U','true','5','2',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('23','14','1','user012-mbx001','user012-mbx001pw', 'user012-mbx001@domain001.com', 'User 12', '60', '60', '100', '/home/daniell/domains/domain001/user012-mbx001', '5', '14',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('45','23','14','1','user012-mbx001-1','14',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('46','23','14','1','user012-mbx001-2','14',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('24','14','1','user012-mbx002','user012-mbx002pw', 'user012-mbx002@domain001.com', 'User 12', '60', '60', '100', '/home/daniell/domains/domain001/user012-mbx002', '5', '14',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('47','24','14','1','user012-mbx002-1','14',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('48','24','14','1','user012-mbx002-2','14',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('15','1','user013', PASSWORD('user013pw'),'user013pw','User 13','U','true','5','2',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('25','15','1','user013-mbx001','user013-mbx001pw', 'user013-mbx001@domain001.com', 'User 13', '60', '60', '100', '/home/daniell/domains/domain001/user013-mbx001', '5', '15',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('49','25','15','1','user013-mbx001-1','15',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('50','25','15','1','user013-mbx001-2','15',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('26','15','1','user013-mbx002','user013-mbx002pw', 'user013-mbx002@domain001.com', 'User 13', '60', '60', '100', '/home/daniell/domains/domain001/user013-mbx002', '5', '15',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('51','26','15','1','user013-mbx002-1','15',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('52','26','15','1','user013-mbx002-2','15',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('16','1','user014', PASSWORD('user014pw'),'user014pw','User 14','U','true','5','2',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('27','16','1','user014-mbx001','user014-mbx001pw', 'user014-mbx001@domain001.com', 'User 14', '60', '60', '100', '/home/daniell/domains/domain001/user014-mbx001', '5', '16',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('53','27','16','1','user014-mbx001-1','16',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('54','27','16','1','user014-mbx001-2','16',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('28','16','1','user014-mbx002','user014-mbx002pw', 'user014-mbx002@domain001.com', 'User 14', '60', '60', '100', '/home/daniell/domains/domain001/user014-mbx002', '5', '16',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('55','28','16','1','user014-mbx002-1','16',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('56','28','16','1','user014-mbx002-2','16',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('17','1','user015', PASSWORD('user015pw'),'user015pw','User 15','U','true','5','2',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('29','17','1','user015-mbx001','user015-mbx001pw', 'user015-mbx001@domain001.com', 'User 15', '60', '60', '100', '/home/daniell/domains/domain001/user015-mbx001', '5', '17',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('57','29','17','1','user015-mbx001-1','17',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('58','29','17','1','user015-mbx001-2','17',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('30','17','1','user015-mbx002','user015-mbx002pw', 'user015-mbx002@domain001.com', 'User 15', '60', '60', '100', '/home/daniell/domains/domain001/user015-mbx002', '5', '17',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('59','30','17','1','user015-mbx002-1','17',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('60','30','17','1','user015-mbx002-2','17',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('18','1','user016', PASSWORD('user016pw'),'user016pw','User 16','U','true','5','2',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('31','18','1','user016-mbx001','user016-mbx001pw', 'user016-mbx001@domain001.com', 'User 16', '60', '60', '100', '/home/daniell/domains/domain001/user016-mbx001', '5', '18',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('61','31','18','1','user016-mbx001-1','18',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('62','31','18','1','user016-mbx001-2','18',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('32','18','1','user016-mbx002','user016-mbx002pw', 'user016-mbx002@domain001.com', 'User 16', '60', '60', '100', '/home/daniell/domains/domain001/user016-mbx002', '5', '18',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('63','32','18','1','user016-mbx002-1','18',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('64','32','18','1','user016-mbx002-2','18',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('19','1','user017', PASSWORD('user017pw'),'user017pw','User 17','U','true','5','2',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('33','19','1','user017-mbx001','user017-mbx001pw', 'user017-mbx001@domain001.com', 'User 17', '60', '60', '100', '/home/daniell/domains/domain001/user017-mbx001', '5', '19',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('65','33','19','1','user017-mbx001-1','19',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('66','33','19','1','user017-mbx001-2','19',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('34','19','1','user017-mbx002','user017-mbx002pw', 'user017-mbx002@domain001.com', 'User 17', '60', '60', '100', '/home/daniell/domains/domain001/user017-mbx002', '5', '19',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('67','34','19','1','user017-mbx002-1','19',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('68','34','19','1','user017-mbx002-2','19',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('20','1','user018', PASSWORD('user018pw'),'user018pw','User 18','U','true','5','2',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('35','20','1','user018-mbx001','user018-mbx001pw', 'user018-mbx001@domain001.com', 'User 18', '60', '60', '100', '/home/daniell/domains/domain001/user018-mbx001', '5', '20',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('69','35','20','1','user018-mbx001-1','20',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('70','35','20','1','user018-mbx001-2','20',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('36','20','1','user018-mbx002','user018-mbx002pw', 'user018-mbx002@domain001.com', 'User 18', '60', '60', '100', '/home/daniell/domains/domain001/user018-mbx002', '5', '20',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('71','36','20','1','user018-mbx002-1','20',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('72','36','20','1','user018-mbx002-2','20',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('21','1','user019', PASSWORD('user019pw'),'user019pw','User 19','U','true','5','2',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('37','21','1','user019-mbx001','user019-mbx001pw', 'user019-mbx001@domain001.com', 'User 19', '60', '60', '100', '/home/daniell/domains/domain001/user019-mbx001', '5', '21',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('73','37','21','1','user019-mbx001-1','21',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('74','37','21','1','user019-mbx001-2','21',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('38','21','1','user019-mbx002','user019-mbx002pw', 'user019-mbx002@domain001.com', 'User 19', '60', '60', '100', '/home/daniell/domains/domain001/user019-mbx002', '5', '21',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('75','38','21','1','user019-mbx002-1','21',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('76','38','21','1','user019-mbx002-2','21',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('22','1','user020', PASSWORD('user020pw'),'user020pw','User 20','U','true','5','2',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('39','22','1','user020-mbx001','user020-mbx001pw', 'user020-mbx001@domain001.com', 'User 20', '60', '60', '100', '/home/daniell/domains/domain001/user020-mbx001', '5', '22',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('77','39','22','1','user020-mbx001-1','22',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('78','39','22','1','user020-mbx001-2','22',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('40','22','1','user020-mbx002','user020-mbx002pw', 'user020-mbx002@domain001.com', 'User 20', '60', '60', '100', '/home/daniell/domains/domain001/user020-mbx002', '5', '22',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('79','40','22','1','user020-mbx002-1','22',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('80','40','22','1','user020-mbx002-2','22',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('23','1','user021', PASSWORD('user021pw'),'user021pw','User 21','U','true','5','2',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('41','23','1','user021-mbx001','user021-mbx001pw', 'user021-mbx001@domain001.com', 'User 21', '60', '60', '100', '/home/daniell/domains/domain001/user021-mbx001', '5', '23',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('81','41','23','1','user021-mbx001-1','23',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('82','41','23','1','user021-mbx001-2','23',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('42','23','1','user021-mbx002','user021-mbx002pw', 'user021-mbx002@domain001.com', 'User 21', '60', '60', '100', '/home/daniell/domains/domain001/user021-mbx002', '5', '23',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('83','42','23','1','user021-mbx002-1','23',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('84','42','23','1','user021-mbx002-2','23',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('24','1','user022', PASSWORD('user022pw'),'user022pw','User 22','U','true','5','2',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('43','24','1','user022-mbx001','user022-mbx001pw', 'user022-mbx001@domain001.com', 'User 22', '60', '60', '100', '/home/daniell/domains/domain001/user022-mbx001', '5', '24',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('85','43','24','1','user022-mbx001-1','24',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('86','43','24','1','user022-mbx001-2','24',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('44','24','1','user022-mbx002','user022-mbx002pw', 'user022-mbx002@domain001.com', 'User 22', '60', '60', '100', '/home/daniell/domains/domain001/user022-mbx002', '5', '24',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('87','44','24','1','user022-mbx002-1','24',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('88','44','24','1','user022-mbx002-2','24',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('25','1','user023', PASSWORD('user023pw'),'user023pw','User 23','U','true','5','2',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('45','25','1','user023-mbx001','user023-mbx001pw', 'user023-mbx001@domain001.com', 'User 23', '60', '60', '100', '/home/daniell/domains/domain001/user023-mbx001', '5', '25',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('89','45','25','1','user023-mbx001-1','25',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('90','45','25','1','user023-mbx001-2','25',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('46','25','1','user023-mbx002','user023-mbx002pw', 'user023-mbx002@domain001.com', 'User 23', '60', '60', '100', '/home/daniell/domains/domain001/user023-mbx002', '5', '25',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('91','46','25','1','user023-mbx002-1','25',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('92','46','25','1','user023-mbx002-2','25',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('26','1','user024', PASSWORD('user024pw'),'user024pw','User 24','U','true','5','2',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('47','26','1','user024-mbx001','user024-mbx001pw', 'user024-mbx001@domain001.com', 'User 24', '60', '60', '100', '/home/daniell/domains/domain001/user024-mbx001', '5', '26',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('93','47','26','1','user024-mbx001-1','26',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('94','47','26','1','user024-mbx001-2','26',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('48','26','1','user024-mbx002','user024-mbx002pw', 'user024-mbx002@domain001.com', 'User 24', '60', '60', '100', '/home/daniell/domains/domain001/user024-mbx002', '5', '26',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('95','48','26','1','user024-mbx002-1','26',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('96','48','26','1','user024-mbx002-2','26',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('27','1','user025', PASSWORD('user025pw'),'user025pw','User 25','U','true','5','2',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('49','27','1','user025-mbx001','user025-mbx001pw', 'user025-mbx001@domain001.com', 'User 25', '60', '60', '100', '/home/daniell/domains/domain001/user025-mbx001', '5', '27',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('97','49','27','1','user025-mbx001-1','27',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('98','49','27','1','user025-mbx001-2','27',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('50','27','1','user025-mbx002','user025-mbx002pw', 'user025-mbx002@domain001.com', 'User 25', '60', '60', '100', '/home/daniell/domains/domain001/user025-mbx002', '5', '27',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('99','50','27','1','user025-mbx002-1','27',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('100','50','27','1','user025-mbx002-2','27',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('28','1','user026', PASSWORD('user026pw'),'user026pw','User 26','U','true','5','2',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('51','28','1','user026-mbx001','user026-mbx001pw', 'user026-mbx001@domain001.com', 'User 26', '60', '60', '100', '/home/daniell/domains/domain001/user026-mbx001', '5', '28',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('101','51','28','1','user026-mbx001-1','28',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('102','51','28','1','user026-mbx001-2','28',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('52','28','1','user026-mbx002','user026-mbx002pw', 'user026-mbx002@domain001.com', 'User 26', '60', '60', '100', '/home/daniell/domains/domain001/user026-mbx002', '5', '28',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('103','52','28','1','user026-mbx002-1','28',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('104','52','28','1','user026-mbx002-2','28',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('29','1','user027', PASSWORD('user027pw'),'user027pw','User 27','U','true','5','2',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('53','29','1','user027-mbx001','user027-mbx001pw', 'user027-mbx001@domain001.com', 'User 27', '60', '60', '100', '/home/daniell/domains/domain001/user027-mbx001', '5', '29',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('105','53','29','1','user027-mbx001-1','29',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('106','53','29','1','user027-mbx001-2','29',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('54','29','1','user027-mbx002','user027-mbx002pw', 'user027-mbx002@domain001.com', 'User 27', '60', '60', '100', '/home/daniell/domains/domain001/user027-mbx002', '5', '29',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('107','54','29','1','user027-mbx002-1','29',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('108','54','29','1','user027-mbx002-2','29',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('30','1','user028', PASSWORD('user028pw'),'user028pw','User 28','U','true','5','2',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('55','30','1','user028-mbx001','user028-mbx001pw', 'user028-mbx001@domain001.com', 'User 28', '60', '60', '100', '/home/daniell/domains/domain001/user028-mbx001', '5', '30',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('109','55','30','1','user028-mbx001-1','30',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('110','55','30','1','user028-mbx001-2','30',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('56','30','1','user028-mbx002','user028-mbx002pw', 'user028-mbx002@domain001.com', 'User 28', '60', '60', '100', '/home/daniell/domains/domain001/user028-mbx002', '5', '30',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('111','56','30','1','user028-mbx002-1','30',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('112','56','30','1','user028-mbx002-2','30',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('31','1','user029', PASSWORD('user029pw'),'user029pw','User 29','U','true','5','2',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('57','31','1','user029-mbx001','user029-mbx001pw', 'user029-mbx001@domain001.com', 'User 29', '60', '60', '100', '/home/daniell/domains/domain001/user029-mbx001', '5', '31',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('113','57','31','1','user029-mbx001-1','31',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('114','57','31','1','user029-mbx001-2','31',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('58','31','1','user029-mbx002','user029-mbx002pw', 'user029-mbx002@domain001.com', 'User 29', '60', '60', '100', '/home/daniell/domains/domain001/user029-mbx002', '5', '31',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('115','58','31','1','user029-mbx002-1','31',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('116','58','31','1','user029-mbx002-2','31',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('32','1','user030', PASSWORD('user030pw'),'user030pw','User 30','U','true','5','2',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('59','32','1','user030-mbx001','user030-mbx001pw', 'user030-mbx001@domain001.com', 'User 30', '60', '60', '100', '/home/daniell/domains/domain001/user030-mbx001', '5', '32',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('117','59','32','1','user030-mbx001-1','32',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('118','59','32','1','user030-mbx001-2','32',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('60','32','1','user030-mbx002','user030-mbx002pw', 'user030-mbx002@domain001.com', 'User 30', '60', '60', '100', '/home/daniell/domains/domain001/user030-mbx002', '5', '32',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('119','60','32','1','user030-mbx002-1','32',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('120','60','32','1','user030-mbx002-2','32',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('33','1','user031', PASSWORD('user031pw'),'user031pw','User 31','U','true','5','2',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('61','33','1','user031-mbx001','user031-mbx001pw', 'user031-mbx001@domain001.com', 'User 31', '60', '60', '100', '/home/daniell/domains/domain001/user031-mbx001', '5', '33',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('121','61','33','1','user031-mbx001-1','33',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('122','61','33','1','user031-mbx001-2','33',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('62','33','1','user031-mbx002','user031-mbx002pw', 'user031-mbx002@domain001.com', 'User 31', '60', '60', '100', '/home/daniell/domains/domain001/user031-mbx002', '5', '33',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('123','62','33','1','user031-mbx002-1','33',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('124','62','33','1','user031-mbx002-2','33',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('34','1','user032', PASSWORD('user032pw'),'user032pw','User 32','U','true','5','2',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('63','34','1','user032-mbx001','user032-mbx001pw', 'user032-mbx001@domain001.com', 'User 32', '60', '60', '100', '/home/daniell/domains/domain001/user032-mbx001', '5', '34',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('125','63','34','1','user032-mbx001-1','34',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('126','63','34','1','user032-mbx001-2','34',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('64','34','1','user032-mbx002','user032-mbx002pw', 'user032-mbx002@domain001.com', 'User 32', '60', '60', '100', '/home/daniell/domains/domain001/user032-mbx002', '5', '34',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('127','64','34','1','user032-mbx002-1','34',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('128','64','34','1','user032-mbx002-2','34',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('35','1','user033', PASSWORD('user033pw'),'user033pw','User 33','U','true','5','2',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('65','35','1','user033-mbx001','user033-mbx001pw', 'user033-mbx001@domain001.com', 'User 33', '60', '60', '100', '/home/daniell/domains/domain001/user033-mbx001', '5', '35',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('129','65','35','1','user033-mbx001-1','35',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('130','65','35','1','user033-mbx001-2','35',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('66','35','1','user033-mbx002','user033-mbx002pw', 'user033-mbx002@domain001.com', 'User 33', '60', '60', '100', '/home/daniell/domains/domain001/user033-mbx002', '5', '35',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('131','66','35','1','user033-mbx002-1','35',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('132','66','35','1','user033-mbx002-2','35',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('36','1','user034', PASSWORD('user034pw'),'user034pw','User 34','U','true','5','2',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('67','36','1','user034-mbx001','user034-mbx001pw', 'user034-mbx001@domain001.com', 'User 34', '60', '60', '100', '/home/daniell/domains/domain001/user034-mbx001', '5', '36',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('133','67','36','1','user034-mbx001-1','36',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('134','67','36','1','user034-mbx001-2','36',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('68','36','1','user034-mbx002','user034-mbx002pw', 'user034-mbx002@domain001.com', 'User 34', '60', '60', '100', '/home/daniell/domains/domain001/user034-mbx002', '5', '36',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('135','68','36','1','user034-mbx002-1','36',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('136','68','36','1','user034-mbx002-2','36',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('37','1','user035', PASSWORD('user035pw'),'user035pw','User 35','U','true','5','2',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('69','37','1','user035-mbx001','user035-mbx001pw', 'user035-mbx001@domain001.com', 'User 35', '60', '60', '100', '/home/daniell/domains/domain001/user035-mbx001', '5', '37',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('137','69','37','1','user035-mbx001-1','37',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('138','69','37','1','user035-mbx001-2','37',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('70','37','1','user035-mbx002','user035-mbx002pw', 'user035-mbx002@domain001.com', 'User 35', '60', '60', '100', '/home/daniell/domains/domain001/user035-mbx002', '5', '37',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('139','70','37','1','user035-mbx002-1','37',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('140','70','37','1','user035-mbx002-2','37',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('38','1','user036', PASSWORD('user036pw'),'user036pw','User 36','U','true','5','2',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('71','38','1','user036-mbx001','user036-mbx001pw', 'user036-mbx001@domain001.com', 'User 36', '60', '60', '100', '/home/daniell/domains/domain001/user036-mbx001', '5', '38',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('141','71','38','1','user036-mbx001-1','38',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('142','71','38','1','user036-mbx001-2','38',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('72','38','1','user036-mbx002','user036-mbx002pw', 'user036-mbx002@domain001.com', 'User 36', '60', '60', '100', '/home/daniell/domains/domain001/user036-mbx002', '5', '38',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('143','72','38','1','user036-mbx002-1','38',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('144','72','38','1','user036-mbx002-2','38',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('39','1','user037', PASSWORD('user037pw'),'user037pw','User 37','U','true','5','2',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('73','39','1','user037-mbx001','user037-mbx001pw', 'user037-mbx001@domain001.com', 'User 37', '60', '60', '100', '/home/daniell/domains/domain001/user037-mbx001', '5', '39',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('145','73','39','1','user037-mbx001-1','39',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('146','73','39','1','user037-mbx001-2','39',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('74','39','1','user037-mbx002','user037-mbx002pw', 'user037-mbx002@domain001.com', 'User 37', '60', '60', '100', '/home/daniell/domains/domain001/user037-mbx002', '5', '39',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('147','74','39','1','user037-mbx002-1','39',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('148','74','39','1','user037-mbx002-2','39',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('40','1','user038', PASSWORD('user038pw'),'user038pw','User 38','U','true','5','2',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('75','40','1','user038-mbx001','user038-mbx001pw', 'user038-mbx001@domain001.com', 'User 38', '60', '60', '100', '/home/daniell/domains/domain001/user038-mbx001', '5', '40',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('149','75','40','1','user038-mbx001-1','40',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('150','75','40','1','user038-mbx001-2','40',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('76','40','1','user038-mbx002','user038-mbx002pw', 'user038-mbx002@domain001.com', 'User 38', '60', '60', '100', '/home/daniell/domains/domain001/user038-mbx002', '5', '40',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('151','76','40','1','user038-mbx002-1','40',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('152','76','40','1','user038-mbx002-2','40',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('41','1','user039', PASSWORD('user039pw'),'user039pw','User 39','U','true','5','2',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('77','41','1','user039-mbx001','user039-mbx001pw', 'user039-mbx001@domain001.com', 'User 39', '60', '60', '100', '/home/daniell/domains/domain001/user039-mbx001', '5', '41',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('153','77','41','1','user039-mbx001-1','41',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('154','77','41','1','user039-mbx001-2','41',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('78','41','1','user039-mbx002','user039-mbx002pw', 'user039-mbx002@domain001.com', 'User 39', '60', '60', '100', '/home/daniell/domains/domain001/user039-mbx002', '5', '41',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('155','78','41','1','user039-mbx002-1','41',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('156','78','41','1','user039-mbx002-2','41',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('42','1','user040', PASSWORD('user040pw'),'user040pw','User 40','U','true','5','2',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('79','42','1','user040-mbx001','user040-mbx001pw', 'user040-mbx001@domain001.com', 'User 40', '60', '60', '100', '/home/daniell/domains/domain001/user040-mbx001', '5', '42',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('157','79','42','1','user040-mbx001-1','42',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('158','79','42','1','user040-mbx001-2','42',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('80','42','1','user040-mbx002','user040-mbx002pw', 'user040-mbx002@domain001.com', 'User 40', '60', '60', '100', '/home/daniell/domains/domain001/user040-mbx002', '5', '42',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('159','80','42','1','user040-mbx002-1','42',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('160','80','42','1','user040-mbx002-2','42',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('43','1','user041', PASSWORD('user041pw'),'user041pw','User 41','U','true','5','2',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('81','43','1','user041-mbx001','user041-mbx001pw', 'user041-mbx001@domain001.com', 'User 41', '60', '60', '100', '/home/daniell/domains/domain001/user041-mbx001', '5', '43',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('161','81','43','1','user041-mbx001-1','43',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('162','81','43','1','user041-mbx001-2','43',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('82','43','1','user041-mbx002','user041-mbx002pw', 'user041-mbx002@domain001.com', 'User 41', '60', '60', '100', '/home/daniell/domains/domain001/user041-mbx002', '5', '43',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('163','82','43','1','user041-mbx002-1','43',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('164','82','43','1','user041-mbx002-2','43',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('44','1','user042', PASSWORD('user042pw'),'user042pw','User 42','U','true','5','2',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('83','44','1','user042-mbx001','user042-mbx001pw', 'user042-mbx001@domain001.com', 'User 42', '60', '60', '100', '/home/daniell/domains/domain001/user042-mbx001', '5', '44',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('165','83','44','1','user042-mbx001-1','44',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('166','83','44','1','user042-mbx001-2','44',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('84','44','1','user042-mbx002','user042-mbx002pw', 'user042-mbx002@domain001.com', 'User 42', '60', '60', '100', '/home/daniell/domains/domain001/user042-mbx002', '5', '44',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('167','84','44','1','user042-mbx002-1','44',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('168','84','44','1','user042-mbx002-2','44',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('45','1','user043', PASSWORD('user043pw'),'user043pw','User 43','U','true','5','2',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('85','45','1','user043-mbx001','user043-mbx001pw', 'user043-mbx001@domain001.com', 'User 43', '60', '60', '100', '/home/daniell/domains/domain001/user043-mbx001', '5', '45',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('169','85','45','1','user043-mbx001-1','45',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('170','85','45','1','user043-mbx001-2','45',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('86','45','1','user043-mbx002','user043-mbx002pw', 'user043-mbx002@domain001.com', 'User 43', '60', '60', '100', '/home/daniell/domains/domain001/user043-mbx002', '5', '45',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('171','86','45','1','user043-mbx002-1','45',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('172','86','45','1','user043-mbx002-2','45',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('46','1','user044', PASSWORD('user044pw'),'user044pw','User 44','U','true','5','2',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('87','46','1','user044-mbx001','user044-mbx001pw', 'user044-mbx001@domain001.com', 'User 44', '60', '60', '100', '/home/daniell/domains/domain001/user044-mbx001', '5', '46',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('173','87','46','1','user044-mbx001-1','46',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('174','87','46','1','user044-mbx001-2','46',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('88','46','1','user044-mbx002','user044-mbx002pw', 'user044-mbx002@domain001.com', 'User 44', '60', '60', '100', '/home/daniell/domains/domain001/user044-mbx002', '5', '46',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('175','88','46','1','user044-mbx002-1','46',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('176','88','46','1','user044-mbx002-2','46',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('47','1','user045', PASSWORD('user045pw'),'user045pw','User 45','U','true','5','2',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('89','47','1','user045-mbx001','user045-mbx001pw', 'user045-mbx001@domain001.com', 'User 45', '60', '60', '100', '/home/daniell/domains/domain001/user045-mbx001', '5', '47',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('177','89','47','1','user045-mbx001-1','47',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('178','89','47','1','user045-mbx001-2','47',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('90','47','1','user045-mbx002','user045-mbx002pw', 'user045-mbx002@domain001.com', 'User 45', '60', '60', '100', '/home/daniell/domains/domain001/user045-mbx002', '5', '47',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('179','90','47','1','user045-mbx002-1','47',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('180','90','47','1','user045-mbx002-2','47',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('48','1','user046', PASSWORD('user046pw'),'user046pw','User 46','U','true','5','2',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('91','48','1','user046-mbx001','user046-mbx001pw', 'user046-mbx001@domain001.com', 'User 46', '60', '60', '100', '/home/daniell/domains/domain001/user046-mbx001', '5', '48',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('181','91','48','1','user046-mbx001-1','48',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('182','91','48','1','user046-mbx001-2','48',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('92','48','1','user046-mbx002','user046-mbx002pw', 'user046-mbx002@domain001.com', 'User 46', '60', '60', '100', '/home/daniell/domains/domain001/user046-mbx002', '5', '48',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('183','92','48','1','user046-mbx002-1','48',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('184','92','48','1','user046-mbx002-2','48',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('49','1','user047', PASSWORD('user047pw'),'user047pw','User 47','U','true','5','2',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('93','49','1','user047-mbx001','user047-mbx001pw', 'user047-mbx001@domain001.com', 'User 47', '60', '60', '100', '/home/daniell/domains/domain001/user047-mbx001', '5', '49',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('185','93','49','1','user047-mbx001-1','49',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('186','93','49','1','user047-mbx001-2','49',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('94','49','1','user047-mbx002','user047-mbx002pw', 'user047-mbx002@domain001.com', 'User 47', '60', '60', '100', '/home/daniell/domains/domain001/user047-mbx002', '5', '49',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('187','94','49','1','user047-mbx002-1','49',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('188','94','49','1','user047-mbx002-2','49',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('50','1','user048', PASSWORD('user048pw'),'user048pw','User 48','U','true','5','2',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('95','50','1','user048-mbx001','user048-mbx001pw', 'user048-mbx001@domain001.com', 'User 48', '60', '60', '100', '/home/daniell/domains/domain001/user048-mbx001', '5', '50',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('189','95','50','1','user048-mbx001-1','50',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('190','95','50','1','user048-mbx001-2','50',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('96','50','1','user048-mbx002','user048-mbx002pw', 'user048-mbx002@domain001.com', 'User 48', '60', '60', '100', '/home/daniell/domains/domain001/user048-mbx002', '5', '50',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('191','96','50','1','user048-mbx002-1','50',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('192','96','50','1','user048-mbx002-2','50',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('51','1','user049', PASSWORD('user049pw'),'user049pw','User 49','U','true','5','2',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('97','51','1','user049-mbx001','user049-mbx001pw', 'user049-mbx001@domain001.com', 'User 49', '60', '60', '100', '/home/daniell/domains/domain001/user049-mbx001', '5', '51',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('193','97','51','1','user049-mbx001-1','51',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('194','97','51','1','user049-mbx001-2','51',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('98','51','1','user049-mbx002','user049-mbx002pw', 'user049-mbx002@domain001.com', 'User 49', '60', '60', '100', '/home/daniell/domains/domain001/user049-mbx002', '5', '51',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('195','98','51','1','user049-mbx002-1','51',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('196','98','51','1','user049-mbx002-2','51',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('52','1','user050', PASSWORD('user050pw'),'user050pw','User 50','U','true','5','2',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('99','52','1','user050-mbx001','user050-mbx001pw', 'user050-mbx001@domain001.com', 'User 50', '60', '60', '100', '/home/daniell/domains/domain001/user050-mbx001', '5', '52',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('197','99','52','1','user050-mbx001-1','52',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('198','99','52','1','user050-mbx001-2','52',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('100','52','1','user050-mbx002','user050-mbx002pw', 'user050-mbx002@domain001.com', 'User 50', '60', '60', '100', '/home/daniell/domains/domain001/user050-mbx002', '5', '52',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('199','100','52','1','user050-mbx002-1','52',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('200','100','52','1','user050-mbx002-2','52',NOW());

INSERT INTO Domains
(DomainId,Domainname,Uid,Gid,Directory,Quota,MailboxLimit,AliasLimit,EditBy,EditWhen)
VALUES
('2','domain002.com','60','60','/home/daniell/domains/domain002','100','5','5','1',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,EditBy,EditWhen)
VALUES
('53','0','admin002',PASSWORD('admin002pw'),'admin002pw','Administrator 2','A','true','1',NOW());

INSERT INTO DomainAccess (AccountId, DomainId) VALUES ('53','2');

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('54','2','user051', PASSWORD('user051pw'),'user051pw','User 51','U','true','5','53',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('101','54','2','user051-mbx001','user051-mbx001pw', 'user051-mbx001@domain002.com', 'User 51', '60', '60', '100', '/home/daniell/domains/domain002/user051-mbx001', '5', '54',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('201','101','54','2','user051-mbx001-1','54',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('202','101','54','2','user051-mbx001-2','54',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('102','54','2','user051-mbx002','user051-mbx002pw', 'user051-mbx002@domain002.com', 'User 51', '60', '60', '100', '/home/daniell/domains/domain002/user051-mbx002', '5', '54',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('203','102','54','2','user051-mbx002-1','54',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('204','102','54','2','user051-mbx002-2','54',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('55','2','user052', PASSWORD('user052pw'),'user052pw','User 52','U','true','5','53',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('103','55','2','user052-mbx001','user052-mbx001pw', 'user052-mbx001@domain002.com', 'User 52', '60', '60', '100', '/home/daniell/domains/domain002/user052-mbx001', '5', '55',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('205','103','55','2','user052-mbx001-1','55',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('206','103','55','2','user052-mbx001-2','55',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('104','55','2','user052-mbx002','user052-mbx002pw', 'user052-mbx002@domain002.com', 'User 52', '60', '60', '100', '/home/daniell/domains/domain002/user052-mbx002', '5', '55',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('207','104','55','2','user052-mbx002-1','55',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('208','104','55','2','user052-mbx002-2','55',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('56','2','user053', PASSWORD('user053pw'),'user053pw','User 53','U','true','5','53',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('105','56','2','user053-mbx001','user053-mbx001pw', 'user053-mbx001@domain002.com', 'User 53', '60', '60', '100', '/home/daniell/domains/domain002/user053-mbx001', '5', '56',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('209','105','56','2','user053-mbx001-1','56',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('210','105','56','2','user053-mbx001-2','56',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('106','56','2','user053-mbx002','user053-mbx002pw', 'user053-mbx002@domain002.com', 'User 53', '60', '60', '100', '/home/daniell/domains/domain002/user053-mbx002', '5', '56',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('211','106','56','2','user053-mbx002-1','56',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('212','106','56','2','user053-mbx002-2','56',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('57','2','user054', PASSWORD('user054pw'),'user054pw','User 54','U','true','5','53',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('107','57','2','user054-mbx001','user054-mbx001pw', 'user054-mbx001@domain002.com', 'User 54', '60', '60', '100', '/home/daniell/domains/domain002/user054-mbx001', '5', '57',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('213','107','57','2','user054-mbx001-1','57',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('214','107','57','2','user054-mbx001-2','57',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('108','57','2','user054-mbx002','user054-mbx002pw', 'user054-mbx002@domain002.com', 'User 54', '60', '60', '100', '/home/daniell/domains/domain002/user054-mbx002', '5', '57',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('215','108','57','2','user054-mbx002-1','57',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('216','108','57','2','user054-mbx002-2','57',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('58','2','user055', PASSWORD('user055pw'),'user055pw','User 55','U','true','5','53',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('109','58','2','user055-mbx001','user055-mbx001pw', 'user055-mbx001@domain002.com', 'User 55', '60', '60', '100', '/home/daniell/domains/domain002/user055-mbx001', '5', '58',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('217','109','58','2','user055-mbx001-1','58',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('218','109','58','2','user055-mbx001-2','58',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('110','58','2','user055-mbx002','user055-mbx002pw', 'user055-mbx002@domain002.com', 'User 55', '60', '60', '100', '/home/daniell/domains/domain002/user055-mbx002', '5', '58',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('219','110','58','2','user055-mbx002-1','58',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('220','110','58','2','user055-mbx002-2','58',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('59','2','user056', PASSWORD('user056pw'),'user056pw','User 56','U','true','5','53',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('111','59','2','user056-mbx001','user056-mbx001pw', 'user056-mbx001@domain002.com', 'User 56', '60', '60', '100', '/home/daniell/domains/domain002/user056-mbx001', '5', '59',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('221','111','59','2','user056-mbx001-1','59',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('222','111','59','2','user056-mbx001-2','59',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('112','59','2','user056-mbx002','user056-mbx002pw', 'user056-mbx002@domain002.com', 'User 56', '60', '60', '100', '/home/daniell/domains/domain002/user056-mbx002', '5', '59',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('223','112','59','2','user056-mbx002-1','59',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('224','112','59','2','user056-mbx002-2','59',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('60','2','user057', PASSWORD('user057pw'),'user057pw','User 57','U','true','5','53',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('113','60','2','user057-mbx001','user057-mbx001pw', 'user057-mbx001@domain002.com', 'User 57', '60', '60', '100', '/home/daniell/domains/domain002/user057-mbx001', '5', '60',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('225','113','60','2','user057-mbx001-1','60',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('226','113','60','2','user057-mbx001-2','60',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('114','60','2','user057-mbx002','user057-mbx002pw', 'user057-mbx002@domain002.com', 'User 57', '60', '60', '100', '/home/daniell/domains/domain002/user057-mbx002', '5', '60',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('227','114','60','2','user057-mbx002-1','60',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('228','114','60','2','user057-mbx002-2','60',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('61','2','user058', PASSWORD('user058pw'),'user058pw','User 58','U','true','5','53',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('115','61','2','user058-mbx001','user058-mbx001pw', 'user058-mbx001@domain002.com', 'User 58', '60', '60', '100', '/home/daniell/domains/domain002/user058-mbx001', '5', '61',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('229','115','61','2','user058-mbx001-1','61',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('230','115','61','2','user058-mbx001-2','61',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('116','61','2','user058-mbx002','user058-mbx002pw', 'user058-mbx002@domain002.com', 'User 58', '60', '60', '100', '/home/daniell/domains/domain002/user058-mbx002', '5', '61',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('231','116','61','2','user058-mbx002-1','61',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('232','116','61','2','user058-mbx002-2','61',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('62','2','user059', PASSWORD('user059pw'),'user059pw','User 59','U','true','5','53',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('117','62','2','user059-mbx001','user059-mbx001pw', 'user059-mbx001@domain002.com', 'User 59', '60', '60', '100', '/home/daniell/domains/domain002/user059-mbx001', '5', '62',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('233','117','62','2','user059-mbx001-1','62',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('234','117','62','2','user059-mbx001-2','62',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('118','62','2','user059-mbx002','user059-mbx002pw', 'user059-mbx002@domain002.com', 'User 59', '60', '60', '100', '/home/daniell/domains/domain002/user059-mbx002', '5', '62',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('235','118','62','2','user059-mbx002-1','62',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('236','118','62','2','user059-mbx002-2','62',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('63','2','user060', PASSWORD('user060pw'),'user060pw','User 60','U','true','5','53',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('119','63','2','user060-mbx001','user060-mbx001pw', 'user060-mbx001@domain002.com', 'User 60', '60', '60', '100', '/home/daniell/domains/domain002/user060-mbx001', '5', '63',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('237','119','63','2','user060-mbx001-1','63',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('238','119','63','2','user060-mbx001-2','63',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('120','63','2','user060-mbx002','user060-mbx002pw', 'user060-mbx002@domain002.com', 'User 60', '60', '60', '100', '/home/daniell/domains/domain002/user060-mbx002', '5', '63',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('239','120','63','2','user060-mbx002-1','63',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('240','120','63','2','user060-mbx002-2','63',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('64','2','user061', PASSWORD('user061pw'),'user061pw','User 61','U','true','5','53',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('121','64','2','user061-mbx001','user061-mbx001pw', 'user061-mbx001@domain002.com', 'User 61', '60', '60', '100', '/home/daniell/domains/domain002/user061-mbx001', '5', '64',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('241','121','64','2','user061-mbx001-1','64',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('242','121','64','2','user061-mbx001-2','64',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('122','64','2','user061-mbx002','user061-mbx002pw', 'user061-mbx002@domain002.com', 'User 61', '60', '60', '100', '/home/daniell/domains/domain002/user061-mbx002', '5', '64',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('243','122','64','2','user061-mbx002-1','64',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('244','122','64','2','user061-mbx002-2','64',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('65','2','user062', PASSWORD('user062pw'),'user062pw','User 62','U','true','5','53',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('123','65','2','user062-mbx001','user062-mbx001pw', 'user062-mbx001@domain002.com', 'User 62', '60', '60', '100', '/home/daniell/domains/domain002/user062-mbx001', '5', '65',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('245','123','65','2','user062-mbx001-1','65',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('246','123','65','2','user062-mbx001-2','65',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('124','65','2','user062-mbx002','user062-mbx002pw', 'user062-mbx002@domain002.com', 'User 62', '60', '60', '100', '/home/daniell/domains/domain002/user062-mbx002', '5', '65',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('247','124','65','2','user062-mbx002-1','65',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('248','124','65','2','user062-mbx002-2','65',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('66','2','user063', PASSWORD('user063pw'),'user063pw','User 63','U','true','5','53',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('125','66','2','user063-mbx001','user063-mbx001pw', 'user063-mbx001@domain002.com', 'User 63', '60', '60', '100', '/home/daniell/domains/domain002/user063-mbx001', '5', '66',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('249','125','66','2','user063-mbx001-1','66',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('250','125','66','2','user063-mbx001-2','66',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('126','66','2','user063-mbx002','user063-mbx002pw', 'user063-mbx002@domain002.com', 'User 63', '60', '60', '100', '/home/daniell/domains/domain002/user063-mbx002', '5', '66',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('251','126','66','2','user063-mbx002-1','66',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('252','126','66','2','user063-mbx002-2','66',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('67','2','user064', PASSWORD('user064pw'),'user064pw','User 64','U','true','5','53',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('127','67','2','user064-mbx001','user064-mbx001pw', 'user064-mbx001@domain002.com', 'User 64', '60', '60', '100', '/home/daniell/domains/domain002/user064-mbx001', '5', '67',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('253','127','67','2','user064-mbx001-1','67',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('254','127','67','2','user064-mbx001-2','67',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('128','67','2','user064-mbx002','user064-mbx002pw', 'user064-mbx002@domain002.com', 'User 64', '60', '60', '100', '/home/daniell/domains/domain002/user064-mbx002', '5', '67',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('255','128','67','2','user064-mbx002-1','67',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('256','128','67','2','user064-mbx002-2','67',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('68','2','user065', PASSWORD('user065pw'),'user065pw','User 65','U','true','5','53',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('129','68','2','user065-mbx001','user065-mbx001pw', 'user065-mbx001@domain002.com', 'User 65', '60', '60', '100', '/home/daniell/domains/domain002/user065-mbx001', '5', '68',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('257','129','68','2','user065-mbx001-1','68',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('258','129','68','2','user065-mbx001-2','68',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('130','68','2','user065-mbx002','user065-mbx002pw', 'user065-mbx002@domain002.com', 'User 65', '60', '60', '100', '/home/daniell/domains/domain002/user065-mbx002', '5', '68',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('259','130','68','2','user065-mbx002-1','68',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('260','130','68','2','user065-mbx002-2','68',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('69','2','user066', PASSWORD('user066pw'),'user066pw','User 66','U','true','5','53',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('131','69','2','user066-mbx001','user066-mbx001pw', 'user066-mbx001@domain002.com', 'User 66', '60', '60', '100', '/home/daniell/domains/domain002/user066-mbx001', '5', '69',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('261','131','69','2','user066-mbx001-1','69',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('262','131','69','2','user066-mbx001-2','69',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('132','69','2','user066-mbx002','user066-mbx002pw', 'user066-mbx002@domain002.com', 'User 66', '60', '60', '100', '/home/daniell/domains/domain002/user066-mbx002', '5', '69',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('263','132','69','2','user066-mbx002-1','69',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('264','132','69','2','user066-mbx002-2','69',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('70','2','user067', PASSWORD('user067pw'),'user067pw','User 67','U','true','5','53',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('133','70','2','user067-mbx001','user067-mbx001pw', 'user067-mbx001@domain002.com', 'User 67', '60', '60', '100', '/home/daniell/domains/domain002/user067-mbx001', '5', '70',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('265','133','70','2','user067-mbx001-1','70',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('266','133','70','2','user067-mbx001-2','70',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('134','70','2','user067-mbx002','user067-mbx002pw', 'user067-mbx002@domain002.com', 'User 67', '60', '60', '100', '/home/daniell/domains/domain002/user067-mbx002', '5', '70',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('267','134','70','2','user067-mbx002-1','70',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('268','134','70','2','user067-mbx002-2','70',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('71','2','user068', PASSWORD('user068pw'),'user068pw','User 68','U','true','5','53',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('135','71','2','user068-mbx001','user068-mbx001pw', 'user068-mbx001@domain002.com', 'User 68', '60', '60', '100', '/home/daniell/domains/domain002/user068-mbx001', '5', '71',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('269','135','71','2','user068-mbx001-1','71',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('270','135','71','2','user068-mbx001-2','71',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('136','71','2','user068-mbx002','user068-mbx002pw', 'user068-mbx002@domain002.com', 'User 68', '60', '60', '100', '/home/daniell/domains/domain002/user068-mbx002', '5', '71',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('271','136','71','2','user068-mbx002-1','71',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('272','136','71','2','user068-mbx002-2','71',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('72','2','user069', PASSWORD('user069pw'),'user069pw','User 69','U','true','5','53',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('137','72','2','user069-mbx001','user069-mbx001pw', 'user069-mbx001@domain002.com', 'User 69', '60', '60', '100', '/home/daniell/domains/domain002/user069-mbx001', '5', '72',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('273','137','72','2','user069-mbx001-1','72',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('274','137','72','2','user069-mbx001-2','72',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('138','72','2','user069-mbx002','user069-mbx002pw', 'user069-mbx002@domain002.com', 'User 69', '60', '60', '100', '/home/daniell/domains/domain002/user069-mbx002', '5', '72',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('275','138','72','2','user069-mbx002-1','72',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('276','138','72','2','user069-mbx002-2','72',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('73','2','user070', PASSWORD('user070pw'),'user070pw','User 70','U','true','5','53',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('139','73','2','user070-mbx001','user070-mbx001pw', 'user070-mbx001@domain002.com', 'User 70', '60', '60', '100', '/home/daniell/domains/domain002/user070-mbx001', '5', '73',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('277','139','73','2','user070-mbx001-1','73',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('278','139','73','2','user070-mbx001-2','73',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('140','73','2','user070-mbx002','user070-mbx002pw', 'user070-mbx002@domain002.com', 'User 70', '60', '60', '100', '/home/daniell/domains/domain002/user070-mbx002', '5', '73',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('279','140','73','2','user070-mbx002-1','73',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('280','140','73','2','user070-mbx002-2','73',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('74','2','user071', PASSWORD('user071pw'),'user071pw','User 71','U','true','5','53',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('141','74','2','user071-mbx001','user071-mbx001pw', 'user071-mbx001@domain002.com', 'User 71', '60', '60', '100', '/home/daniell/domains/domain002/user071-mbx001', '5', '74',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('281','141','74','2','user071-mbx001-1','74',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('282','141','74','2','user071-mbx001-2','74',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('142','74','2','user071-mbx002','user071-mbx002pw', 'user071-mbx002@domain002.com', 'User 71', '60', '60', '100', '/home/daniell/domains/domain002/user071-mbx002', '5', '74',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('283','142','74','2','user071-mbx002-1','74',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('284','142','74','2','user071-mbx002-2','74',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('75','2','user072', PASSWORD('user072pw'),'user072pw','User 72','U','true','5','53',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('143','75','2','user072-mbx001','user072-mbx001pw', 'user072-mbx001@domain002.com', 'User 72', '60', '60', '100', '/home/daniell/domains/domain002/user072-mbx001', '5', '75',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('285','143','75','2','user072-mbx001-1','75',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('286','143','75','2','user072-mbx001-2','75',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('144','75','2','user072-mbx002','user072-mbx002pw', 'user072-mbx002@domain002.com', 'User 72', '60', '60', '100', '/home/daniell/domains/domain002/user072-mbx002', '5', '75',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('287','144','75','2','user072-mbx002-1','75',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('288','144','75','2','user072-mbx002-2','75',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('76','2','user073', PASSWORD('user073pw'),'user073pw','User 73','U','true','5','53',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('145','76','2','user073-mbx001','user073-mbx001pw', 'user073-mbx001@domain002.com', 'User 73', '60', '60', '100', '/home/daniell/domains/domain002/user073-mbx001', '5', '76',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('289','145','76','2','user073-mbx001-1','76',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('290','145','76','2','user073-mbx001-2','76',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('146','76','2','user073-mbx002','user073-mbx002pw', 'user073-mbx002@domain002.com', 'User 73', '60', '60', '100', '/home/daniell/domains/domain002/user073-mbx002', '5', '76',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('291','146','76','2','user073-mbx002-1','76',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('292','146','76','2','user073-mbx002-2','76',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('77','2','user074', PASSWORD('user074pw'),'user074pw','User 74','U','true','5','53',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('147','77','2','user074-mbx001','user074-mbx001pw', 'user074-mbx001@domain002.com', 'User 74', '60', '60', '100', '/home/daniell/domains/domain002/user074-mbx001', '5', '77',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('293','147','77','2','user074-mbx001-1','77',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('294','147','77','2','user074-mbx001-2','77',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('148','77','2','user074-mbx002','user074-mbx002pw', 'user074-mbx002@domain002.com', 'User 74', '60', '60', '100', '/home/daniell/domains/domain002/user074-mbx002', '5', '77',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('295','148','77','2','user074-mbx002-1','77',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('296','148','77','2','user074-mbx002-2','77',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('78','2','user075', PASSWORD('user075pw'),'user075pw','User 75','U','true','5','53',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('149','78','2','user075-mbx001','user075-mbx001pw', 'user075-mbx001@domain002.com', 'User 75', '60', '60', '100', '/home/daniell/domains/domain002/user075-mbx001', '5', '78',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('297','149','78','2','user075-mbx001-1','78',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('298','149','78','2','user075-mbx001-2','78',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('150','78','2','user075-mbx002','user075-mbx002pw', 'user075-mbx002@domain002.com', 'User 75', '60', '60', '100', '/home/daniell/domains/domain002/user075-mbx002', '5', '78',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('299','150','78','2','user075-mbx002-1','78',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('300','150','78','2','user075-mbx002-2','78',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('79','2','user076', PASSWORD('user076pw'),'user076pw','User 76','U','true','5','53',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('151','79','2','user076-mbx001','user076-mbx001pw', 'user076-mbx001@domain002.com', 'User 76', '60', '60', '100', '/home/daniell/domains/domain002/user076-mbx001', '5', '79',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('301','151','79','2','user076-mbx001-1','79',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('302','151','79','2','user076-mbx001-2','79',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('152','79','2','user076-mbx002','user076-mbx002pw', 'user076-mbx002@domain002.com', 'User 76', '60', '60', '100', '/home/daniell/domains/domain002/user076-mbx002', '5', '79',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('303','152','79','2','user076-mbx002-1','79',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('304','152','79','2','user076-mbx002-2','79',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('80','2','user077', PASSWORD('user077pw'),'user077pw','User 77','U','true','5','53',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('153','80','2','user077-mbx001','user077-mbx001pw', 'user077-mbx001@domain002.com', 'User 77', '60', '60', '100', '/home/daniell/domains/domain002/user077-mbx001', '5', '80',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('305','153','80','2','user077-mbx001-1','80',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('306','153','80','2','user077-mbx001-2','80',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('154','80','2','user077-mbx002','user077-mbx002pw', 'user077-mbx002@domain002.com', 'User 77', '60', '60', '100', '/home/daniell/domains/domain002/user077-mbx002', '5', '80',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('307','154','80','2','user077-mbx002-1','80',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('308','154','80','2','user077-mbx002-2','80',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('81','2','user078', PASSWORD('user078pw'),'user078pw','User 78','U','true','5','53',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('155','81','2','user078-mbx001','user078-mbx001pw', 'user078-mbx001@domain002.com', 'User 78', '60', '60', '100', '/home/daniell/domains/domain002/user078-mbx001', '5', '81',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('309','155','81','2','user078-mbx001-1','81',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('310','155','81','2','user078-mbx001-2','81',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('156','81','2','user078-mbx002','user078-mbx002pw', 'user078-mbx002@domain002.com', 'User 78', '60', '60', '100', '/home/daniell/domains/domain002/user078-mbx002', '5', '81',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('311','156','81','2','user078-mbx002-1','81',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('312','156','81','2','user078-mbx002-2','81',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('82','2','user079', PASSWORD('user079pw'),'user079pw','User 79','U','true','5','53',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('157','82','2','user079-mbx001','user079-mbx001pw', 'user079-mbx001@domain002.com', 'User 79', '60', '60', '100', '/home/daniell/domains/domain002/user079-mbx001', '5', '82',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('313','157','82','2','user079-mbx001-1','82',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('314','157','82','2','user079-mbx001-2','82',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('158','82','2','user079-mbx002','user079-mbx002pw', 'user079-mbx002@domain002.com', 'User 79', '60', '60', '100', '/home/daniell/domains/domain002/user079-mbx002', '5', '82',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('315','158','82','2','user079-mbx002-1','82',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('316','158','82','2','user079-mbx002-2','82',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('83','2','user080', PASSWORD('user080pw'),'user080pw','User 80','U','true','5','53',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('159','83','2','user080-mbx001','user080-mbx001pw', 'user080-mbx001@domain002.com', 'User 80', '60', '60', '100', '/home/daniell/domains/domain002/user080-mbx001', '5', '83',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('317','159','83','2','user080-mbx001-1','83',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('318','159','83','2','user080-mbx001-2','83',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('160','83','2','user080-mbx002','user080-mbx002pw', 'user080-mbx002@domain002.com', 'User 80', '60', '60', '100', '/home/daniell/domains/domain002/user080-mbx002', '5', '83',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('319','160','83','2','user080-mbx002-1','83',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('320','160','83','2','user080-mbx002-2','83',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('84','2','user081', PASSWORD('user081pw'),'user081pw','User 81','U','true','5','53',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('161','84','2','user081-mbx001','user081-mbx001pw', 'user081-mbx001@domain002.com', 'User 81', '60', '60', '100', '/home/daniell/domains/domain002/user081-mbx001', '5', '84',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('321','161','84','2','user081-mbx001-1','84',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('322','161','84','2','user081-mbx001-2','84',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('162','84','2','user081-mbx002','user081-mbx002pw', 'user081-mbx002@domain002.com', 'User 81', '60', '60', '100', '/home/daniell/domains/domain002/user081-mbx002', '5', '84',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('323','162','84','2','user081-mbx002-1','84',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('324','162','84','2','user081-mbx002-2','84',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('85','2','user082', PASSWORD('user082pw'),'user082pw','User 82','U','true','5','53',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('163','85','2','user082-mbx001','user082-mbx001pw', 'user082-mbx001@domain002.com', 'User 82', '60', '60', '100', '/home/daniell/domains/domain002/user082-mbx001', '5', '85',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('325','163','85','2','user082-mbx001-1','85',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('326','163','85','2','user082-mbx001-2','85',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('164','85','2','user082-mbx002','user082-mbx002pw', 'user082-mbx002@domain002.com', 'User 82', '60', '60', '100', '/home/daniell/domains/domain002/user082-mbx002', '5', '85',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('327','164','85','2','user082-mbx002-1','85',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('328','164','85','2','user082-mbx002-2','85',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('86','2','user083', PASSWORD('user083pw'),'user083pw','User 83','U','true','5','53',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('165','86','2','user083-mbx001','user083-mbx001pw', 'user083-mbx001@domain002.com', 'User 83', '60', '60', '100', '/home/daniell/domains/domain002/user083-mbx001', '5', '86',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('329','165','86','2','user083-mbx001-1','86',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('330','165','86','2','user083-mbx001-2','86',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('166','86','2','user083-mbx002','user083-mbx002pw', 'user083-mbx002@domain002.com', 'User 83', '60', '60', '100', '/home/daniell/domains/domain002/user083-mbx002', '5', '86',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('331','166','86','2','user083-mbx002-1','86',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('332','166','86','2','user083-mbx002-2','86',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('87','2','user084', PASSWORD('user084pw'),'user084pw','User 84','U','true','5','53',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('167','87','2','user084-mbx001','user084-mbx001pw', 'user084-mbx001@domain002.com', 'User 84', '60', '60', '100', '/home/daniell/domains/domain002/user084-mbx001', '5', '87',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('333','167','87','2','user084-mbx001-1','87',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('334','167','87','2','user084-mbx001-2','87',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('168','87','2','user084-mbx002','user084-mbx002pw', 'user084-mbx002@domain002.com', 'User 84', '60', '60', '100', '/home/daniell/domains/domain002/user084-mbx002', '5', '87',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('335','168','87','2','user084-mbx002-1','87',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('336','168','87','2','user084-mbx002-2','87',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('88','2','user085', PASSWORD('user085pw'),'user085pw','User 85','U','true','5','53',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('169','88','2','user085-mbx001','user085-mbx001pw', 'user085-mbx001@domain002.com', 'User 85', '60', '60', '100', '/home/daniell/domains/domain002/user085-mbx001', '5', '88',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('337','169','88','2','user085-mbx001-1','88',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('338','169','88','2','user085-mbx001-2','88',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('170','88','2','user085-mbx002','user085-mbx002pw', 'user085-mbx002@domain002.com', 'User 85', '60', '60', '100', '/home/daniell/domains/domain002/user085-mbx002', '5', '88',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('339','170','88','2','user085-mbx002-1','88',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('340','170','88','2','user085-mbx002-2','88',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('89','2','user086', PASSWORD('user086pw'),'user086pw','User 86','U','true','5','53',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('171','89','2','user086-mbx001','user086-mbx001pw', 'user086-mbx001@domain002.com', 'User 86', '60', '60', '100', '/home/daniell/domains/domain002/user086-mbx001', '5', '89',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('341','171','89','2','user086-mbx001-1','89',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('342','171','89','2','user086-mbx001-2','89',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('172','89','2','user086-mbx002','user086-mbx002pw', 'user086-mbx002@domain002.com', 'User 86', '60', '60', '100', '/home/daniell/domains/domain002/user086-mbx002', '5', '89',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('343','172','89','2','user086-mbx002-1','89',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('344','172','89','2','user086-mbx002-2','89',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('90','2','user087', PASSWORD('user087pw'),'user087pw','User 87','U','true','5','53',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('173','90','2','user087-mbx001','user087-mbx001pw', 'user087-mbx001@domain002.com', 'User 87', '60', '60', '100', '/home/daniell/domains/domain002/user087-mbx001', '5', '90',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('345','173','90','2','user087-mbx001-1','90',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('346','173','90','2','user087-mbx001-2','90',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('174','90','2','user087-mbx002','user087-mbx002pw', 'user087-mbx002@domain002.com', 'User 87', '60', '60', '100', '/home/daniell/domains/domain002/user087-mbx002', '5', '90',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('347','174','90','2','user087-mbx002-1','90',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('348','174','90','2','user087-mbx002-2','90',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('91','2','user088', PASSWORD('user088pw'),'user088pw','User 88','U','true','5','53',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('175','91','2','user088-mbx001','user088-mbx001pw', 'user088-mbx001@domain002.com', 'User 88', '60', '60', '100', '/home/daniell/domains/domain002/user088-mbx001', '5', '91',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('349','175','91','2','user088-mbx001-1','91',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('350','175','91','2','user088-mbx001-2','91',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('176','91','2','user088-mbx002','user088-mbx002pw', 'user088-mbx002@domain002.com', 'User 88', '60', '60', '100', '/home/daniell/domains/domain002/user088-mbx002', '5', '91',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('351','176','91','2','user088-mbx002-1','91',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('352','176','91','2','user088-mbx002-2','91',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('92','2','user089', PASSWORD('user089pw'),'user089pw','User 89','U','true','5','53',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('177','92','2','user089-mbx001','user089-mbx001pw', 'user089-mbx001@domain002.com', 'User 89', '60', '60', '100', '/home/daniell/domains/domain002/user089-mbx001', '5', '92',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('353','177','92','2','user089-mbx001-1','92',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('354','177','92','2','user089-mbx001-2','92',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('178','92','2','user089-mbx002','user089-mbx002pw', 'user089-mbx002@domain002.com', 'User 89', '60', '60', '100', '/home/daniell/domains/domain002/user089-mbx002', '5', '92',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('355','178','92','2','user089-mbx002-1','92',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('356','178','92','2','user089-mbx002-2','92',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('93','2','user090', PASSWORD('user090pw'),'user090pw','User 90','U','true','5','53',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('179','93','2','user090-mbx001','user090-mbx001pw', 'user090-mbx001@domain002.com', 'User 90', '60', '60', '100', '/home/daniell/domains/domain002/user090-mbx001', '5', '93',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('357','179','93','2','user090-mbx001-1','93',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('358','179','93','2','user090-mbx001-2','93',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('180','93','2','user090-mbx002','user090-mbx002pw', 'user090-mbx002@domain002.com', 'User 90', '60', '60', '100', '/home/daniell/domains/domain002/user090-mbx002', '5', '93',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('359','180','93','2','user090-mbx002-1','93',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('360','180','93','2','user090-mbx002-2','93',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('94','2','user091', PASSWORD('user091pw'),'user091pw','User 91','U','true','5','53',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('181','94','2','user091-mbx001','user091-mbx001pw', 'user091-mbx001@domain002.com', 'User 91', '60', '60', '100', '/home/daniell/domains/domain002/user091-mbx001', '5', '94',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('361','181','94','2','user091-mbx001-1','94',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('362','181','94','2','user091-mbx001-2','94',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('182','94','2','user091-mbx002','user091-mbx002pw', 'user091-mbx002@domain002.com', 'User 91', '60', '60', '100', '/home/daniell/domains/domain002/user091-mbx002', '5', '94',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('363','182','94','2','user091-mbx002-1','94',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('364','182','94','2','user091-mbx002-2','94',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('95','2','user092', PASSWORD('user092pw'),'user092pw','User 92','U','true','5','53',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('183','95','2','user092-mbx001','user092-mbx001pw', 'user092-mbx001@domain002.com', 'User 92', '60', '60', '100', '/home/daniell/domains/domain002/user092-mbx001', '5', '95',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('365','183','95','2','user092-mbx001-1','95',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('366','183','95','2','user092-mbx001-2','95',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('184','95','2','user092-mbx002','user092-mbx002pw', 'user092-mbx002@domain002.com', 'User 92', '60', '60', '100', '/home/daniell/domains/domain002/user092-mbx002', '5', '95',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('367','184','95','2','user092-mbx002-1','95',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('368','184','95','2','user092-mbx002-2','95',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('96','2','user093', PASSWORD('user093pw'),'user093pw','User 93','U','true','5','53',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('185','96','2','user093-mbx001','user093-mbx001pw', 'user093-mbx001@domain002.com', 'User 93', '60', '60', '100', '/home/daniell/domains/domain002/user093-mbx001', '5', '96',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('369','185','96','2','user093-mbx001-1','96',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('370','185','96','2','user093-mbx001-2','96',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('186','96','2','user093-mbx002','user093-mbx002pw', 'user093-mbx002@domain002.com', 'User 93', '60', '60', '100', '/home/daniell/domains/domain002/user093-mbx002', '5', '96',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('371','186','96','2','user093-mbx002-1','96',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('372','186','96','2','user093-mbx002-2','96',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('97','2','user094', PASSWORD('user094pw'),'user094pw','User 94','U','true','5','53',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('187','97','2','user094-mbx001','user094-mbx001pw', 'user094-mbx001@domain002.com', 'User 94', '60', '60', '100', '/home/daniell/domains/domain002/user094-mbx001', '5', '97',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('373','187','97','2','user094-mbx001-1','97',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('374','187','97','2','user094-mbx001-2','97',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('188','97','2','user094-mbx002','user094-mbx002pw', 'user094-mbx002@domain002.com', 'User 94', '60', '60', '100', '/home/daniell/domains/domain002/user094-mbx002', '5', '97',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('375','188','97','2','user094-mbx002-1','97',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('376','188','97','2','user094-mbx002-2','97',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('98','2','user095', PASSWORD('user095pw'),'user095pw','User 95','U','true','5','53',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('189','98','2','user095-mbx001','user095-mbx001pw', 'user095-mbx001@domain002.com', 'User 95', '60', '60', '100', '/home/daniell/domains/domain002/user095-mbx001', '5', '98',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('377','189','98','2','user095-mbx001-1','98',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('378','189','98','2','user095-mbx001-2','98',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('190','98','2','user095-mbx002','user095-mbx002pw', 'user095-mbx002@domain002.com', 'User 95', '60', '60', '100', '/home/daniell/domains/domain002/user095-mbx002', '5', '98',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('379','190','98','2','user095-mbx002-1','98',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('380','190','98','2','user095-mbx002-2','98',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('99','2','user096', PASSWORD('user096pw'),'user096pw','User 96','U','true','5','53',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('191','99','2','user096-mbx001','user096-mbx001pw', 'user096-mbx001@domain002.com', 'User 96', '60', '60', '100', '/home/daniell/domains/domain002/user096-mbx001', '5', '99',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('381','191','99','2','user096-mbx001-1','99',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('382','191','99','2','user096-mbx001-2','99',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('192','99','2','user096-mbx002','user096-mbx002pw', 'user096-mbx002@domain002.com', 'User 96', '60', '60', '100', '/home/daniell/domains/domain002/user096-mbx002', '5', '99',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('383','192','99','2','user096-mbx002-1','99',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('384','192','99','2','user096-mbx002-2','99',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('100','2','user097', PASSWORD('user097pw'),'user097pw','User 97','U','true','5','53',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('193','100','2','user097-mbx001','user097-mbx001pw', 'user097-mbx001@domain002.com', 'User 97', '60', '60', '100', '/home/daniell/domains/domain002/user097-mbx001', '5', '100',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('385','193','100','2','user097-mbx001-1','100',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('386','193','100','2','user097-mbx001-2','100',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('194','100','2','user097-mbx002','user097-mbx002pw', 'user097-mbx002@domain002.com', 'User 97', '60', '60', '100', '/home/daniell/domains/domain002/user097-mbx002', '5', '100',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('387','194','100','2','user097-mbx002-1','100',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('388','194','100','2','user097-mbx002-2','100',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('101','2','user098', PASSWORD('user098pw'),'user098pw','User 98','U','true','5','53',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('195','101','2','user098-mbx001','user098-mbx001pw', 'user098-mbx001@domain002.com', 'User 98', '60', '60', '100', '/home/daniell/domains/domain002/user098-mbx001', '5', '101',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('389','195','101','2','user098-mbx001-1','101',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('390','195','101','2','user098-mbx001-2','101',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('196','101','2','user098-mbx002','user098-mbx002pw', 'user098-mbx002@domain002.com', 'User 98', '60', '60', '100', '/home/daniell/domains/domain002/user098-mbx002', '5', '101',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('391','196','101','2','user098-mbx002-1','101',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('392','196','101','2','user098-mbx002-2','101',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('102','2','user099', PASSWORD('user099pw'),'user099pw','User 99','U','true','5','53',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('197','102','2','user099-mbx001','user099-mbx001pw', 'user099-mbx001@domain002.com', 'User 99', '60', '60', '100', '/home/daniell/domains/domain002/user099-mbx001', '5', '102',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('393','197','102','2','user099-mbx001-1','102',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('394','197','102','2','user099-mbx001-2','102',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('198','102','2','user099-mbx002','user099-mbx002pw', 'user099-mbx002@domain002.com', 'User 99', '60', '60', '100', '/home/daniell/domains/domain002/user099-mbx002', '5', '102',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('395','198','102','2','user099-mbx002-1','102',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('396','198','102','2','user099-mbx002-2','102',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('103','2','user100', PASSWORD('user100pw'),'user100pw','User 100','U','true','5','53',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('199','103','2','user100-mbx001','user100-mbx001pw', 'user100-mbx001@domain002.com', 'User 100', '60', '60', '100', '/home/daniell/domains/domain002/user100-mbx001', '5', '103',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('397','199','103','2','user100-mbx001-1','103',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('398','199','103','2','user100-mbx001-2','103',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('200','103','2','user100-mbx002','user100-mbx002pw', 'user100-mbx002@domain002.com', 'User 100', '60', '60', '100', '/home/daniell/domains/domain002/user100-mbx002', '5', '103',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('399','200','103','2','user100-mbx002-1','103',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('400','200','103','2','user100-mbx002-2','103',NOW());

INSERT INTO Domains
(DomainId,Domainname,Uid,Gid,Directory,Quota,MailboxLimit,AliasLimit,EditBy,EditWhen)
VALUES
('3','domain003.com','60','60','/home/daniell/domains/domain003','100','5','5','1',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,EditBy,EditWhen)
VALUES
('104','0','admin003',PASSWORD('admin003pw'),'admin003pw','Administrator 3','A','true','1',NOW());

INSERT INTO DomainAccess (AccountId, DomainId) VALUES ('104','3');

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('105','3','user101', PASSWORD('user101pw'),'user101pw','User 101','U','true','5','104',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('201','105','3','user101-mbx001','user101-mbx001pw', 'user101-mbx001@domain003.com', 'User 101', '60', '60', '100', '/home/daniell/domains/domain003/user101-mbx001', '5', '105',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('401','201','105','3','user101-mbx001-1','105',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('402','201','105','3','user101-mbx001-2','105',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('202','105','3','user101-mbx002','user101-mbx002pw', 'user101-mbx002@domain003.com', 'User 101', '60', '60', '100', '/home/daniell/domains/domain003/user101-mbx002', '5', '105',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('403','202','105','3','user101-mbx002-1','105',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('404','202','105','3','user101-mbx002-2','105',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('106','3','user102', PASSWORD('user102pw'),'user102pw','User 102','U','true','5','104',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('203','106','3','user102-mbx001','user102-mbx001pw', 'user102-mbx001@domain003.com', 'User 102', '60', '60', '100', '/home/daniell/domains/domain003/user102-mbx001', '5', '106',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('405','203','106','3','user102-mbx001-1','106',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('406','203','106','3','user102-mbx001-2','106',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('204','106','3','user102-mbx002','user102-mbx002pw', 'user102-mbx002@domain003.com', 'User 102', '60', '60', '100', '/home/daniell/domains/domain003/user102-mbx002', '5', '106',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('407','204','106','3','user102-mbx002-1','106',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('408','204','106','3','user102-mbx002-2','106',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('107','3','user103', PASSWORD('user103pw'),'user103pw','User 103','U','true','5','104',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('205','107','3','user103-mbx001','user103-mbx001pw', 'user103-mbx001@domain003.com', 'User 103', '60', '60', '100', '/home/daniell/domains/domain003/user103-mbx001', '5', '107',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('409','205','107','3','user103-mbx001-1','107',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('410','205','107','3','user103-mbx001-2','107',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('206','107','3','user103-mbx002','user103-mbx002pw', 'user103-mbx002@domain003.com', 'User 103', '60', '60', '100', '/home/daniell/domains/domain003/user103-mbx002', '5', '107',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('411','206','107','3','user103-mbx002-1','107',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('412','206','107','3','user103-mbx002-2','107',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('108','3','user104', PASSWORD('user104pw'),'user104pw','User 104','U','true','5','104',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('207','108','3','user104-mbx001','user104-mbx001pw', 'user104-mbx001@domain003.com', 'User 104', '60', '60', '100', '/home/daniell/domains/domain003/user104-mbx001', '5', '108',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('413','207','108','3','user104-mbx001-1','108',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('414','207','108','3','user104-mbx001-2','108',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('208','108','3','user104-mbx002','user104-mbx002pw', 'user104-mbx002@domain003.com', 'User 104', '60', '60', '100', '/home/daniell/domains/domain003/user104-mbx002', '5', '108',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('415','208','108','3','user104-mbx002-1','108',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('416','208','108','3','user104-mbx002-2','108',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('109','3','user105', PASSWORD('user105pw'),'user105pw','User 105','U','true','5','104',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('209','109','3','user105-mbx001','user105-mbx001pw', 'user105-mbx001@domain003.com', 'User 105', '60', '60', '100', '/home/daniell/domains/domain003/user105-mbx001', '5', '109',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('417','209','109','3','user105-mbx001-1','109',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('418','209','109','3','user105-mbx001-2','109',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('210','109','3','user105-mbx002','user105-mbx002pw', 'user105-mbx002@domain003.com', 'User 105', '60', '60', '100', '/home/daniell/domains/domain003/user105-mbx002', '5', '109',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('419','210','109','3','user105-mbx002-1','109',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('420','210','109','3','user105-mbx002-2','109',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('110','3','user106', PASSWORD('user106pw'),'user106pw','User 106','U','true','5','104',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('211','110','3','user106-mbx001','user106-mbx001pw', 'user106-mbx001@domain003.com', 'User 106', '60', '60', '100', '/home/daniell/domains/domain003/user106-mbx001', '5', '110',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('421','211','110','3','user106-mbx001-1','110',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('422','211','110','3','user106-mbx001-2','110',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('212','110','3','user106-mbx002','user106-mbx002pw', 'user106-mbx002@domain003.com', 'User 106', '60', '60', '100', '/home/daniell/domains/domain003/user106-mbx002', '5', '110',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('423','212','110','3','user106-mbx002-1','110',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('424','212','110','3','user106-mbx002-2','110',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('111','3','user107', PASSWORD('user107pw'),'user107pw','User 107','U','true','5','104',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('213','111','3','user107-mbx001','user107-mbx001pw', 'user107-mbx001@domain003.com', 'User 107', '60', '60', '100', '/home/daniell/domains/domain003/user107-mbx001', '5', '111',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('425','213','111','3','user107-mbx001-1','111',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('426','213','111','3','user107-mbx001-2','111',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('214','111','3','user107-mbx002','user107-mbx002pw', 'user107-mbx002@domain003.com', 'User 107', '60', '60', '100', '/home/daniell/domains/domain003/user107-mbx002', '5', '111',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('427','214','111','3','user107-mbx002-1','111',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('428','214','111','3','user107-mbx002-2','111',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('112','3','user108', PASSWORD('user108pw'),'user108pw','User 108','U','true','5','104',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('215','112','3','user108-mbx001','user108-mbx001pw', 'user108-mbx001@domain003.com', 'User 108', '60', '60', '100', '/home/daniell/domains/domain003/user108-mbx001', '5', '112',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('429','215','112','3','user108-mbx001-1','112',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('430','215','112','3','user108-mbx001-2','112',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('216','112','3','user108-mbx002','user108-mbx002pw', 'user108-mbx002@domain003.com', 'User 108', '60', '60', '100', '/home/daniell/domains/domain003/user108-mbx002', '5', '112',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('431','216','112','3','user108-mbx002-1','112',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('432','216','112','3','user108-mbx002-2','112',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('113','3','user109', PASSWORD('user109pw'),'user109pw','User 109','U','true','5','104',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('217','113','3','user109-mbx001','user109-mbx001pw', 'user109-mbx001@domain003.com', 'User 109', '60', '60', '100', '/home/daniell/domains/domain003/user109-mbx001', '5', '113',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('433','217','113','3','user109-mbx001-1','113',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('434','217','113','3','user109-mbx001-2','113',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('218','113','3','user109-mbx002','user109-mbx002pw', 'user109-mbx002@domain003.com', 'User 109', '60', '60', '100', '/home/daniell/domains/domain003/user109-mbx002', '5', '113',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('435','218','113','3','user109-mbx002-1','113',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('436','218','113','3','user109-mbx002-2','113',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('114','3','user110', PASSWORD('user110pw'),'user110pw','User 110','U','true','5','104',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('219','114','3','user110-mbx001','user110-mbx001pw', 'user110-mbx001@domain003.com', 'User 110', '60', '60', '100', '/home/daniell/domains/domain003/user110-mbx001', '5', '114',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('437','219','114','3','user110-mbx001-1','114',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('438','219','114','3','user110-mbx001-2','114',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('220','114','3','user110-mbx002','user110-mbx002pw', 'user110-mbx002@domain003.com', 'User 110', '60', '60', '100', '/home/daniell/domains/domain003/user110-mbx002', '5', '114',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('439','220','114','3','user110-mbx002-1','114',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('440','220','114','3','user110-mbx002-2','114',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('115','3','user111', PASSWORD('user111pw'),'user111pw','User 111','U','true','5','104',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('221','115','3','user111-mbx001','user111-mbx001pw', 'user111-mbx001@domain003.com', 'User 111', '60', '60', '100', '/home/daniell/domains/domain003/user111-mbx001', '5', '115',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('441','221','115','3','user111-mbx001-1','115',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('442','221','115','3','user111-mbx001-2','115',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('222','115','3','user111-mbx002','user111-mbx002pw', 'user111-mbx002@domain003.com', 'User 111', '60', '60', '100', '/home/daniell/domains/domain003/user111-mbx002', '5', '115',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('443','222','115','3','user111-mbx002-1','115',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('444','222','115','3','user111-mbx002-2','115',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('116','3','user112', PASSWORD('user112pw'),'user112pw','User 112','U','true','5','104',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('223','116','3','user112-mbx001','user112-mbx001pw', 'user112-mbx001@domain003.com', 'User 112', '60', '60', '100', '/home/daniell/domains/domain003/user112-mbx001', '5', '116',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('445','223','116','3','user112-mbx001-1','116',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('446','223','116','3','user112-mbx001-2','116',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('224','116','3','user112-mbx002','user112-mbx002pw', 'user112-mbx002@domain003.com', 'User 112', '60', '60', '100', '/home/daniell/domains/domain003/user112-mbx002', '5', '116',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('447','224','116','3','user112-mbx002-1','116',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('448','224','116','3','user112-mbx002-2','116',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('117','3','user113', PASSWORD('user113pw'),'user113pw','User 113','U','true','5','104',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('225','117','3','user113-mbx001','user113-mbx001pw', 'user113-mbx001@domain003.com', 'User 113', '60', '60', '100', '/home/daniell/domains/domain003/user113-mbx001', '5', '117',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('449','225','117','3','user113-mbx001-1','117',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('450','225','117','3','user113-mbx001-2','117',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('226','117','3','user113-mbx002','user113-mbx002pw', 'user113-mbx002@domain003.com', 'User 113', '60', '60', '100', '/home/daniell/domains/domain003/user113-mbx002', '5', '117',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('451','226','117','3','user113-mbx002-1','117',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('452','226','117','3','user113-mbx002-2','117',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('118','3','user114', PASSWORD('user114pw'),'user114pw','User 114','U','true','5','104',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('227','118','3','user114-mbx001','user114-mbx001pw', 'user114-mbx001@domain003.com', 'User 114', '60', '60', '100', '/home/daniell/domains/domain003/user114-mbx001', '5', '118',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('453','227','118','3','user114-mbx001-1','118',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('454','227','118','3','user114-mbx001-2','118',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('228','118','3','user114-mbx002','user114-mbx002pw', 'user114-mbx002@domain003.com', 'User 114', '60', '60', '100', '/home/daniell/domains/domain003/user114-mbx002', '5', '118',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('455','228','118','3','user114-mbx002-1','118',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('456','228','118','3','user114-mbx002-2','118',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('119','3','user115', PASSWORD('user115pw'),'user115pw','User 115','U','true','5','104',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('229','119','3','user115-mbx001','user115-mbx001pw', 'user115-mbx001@domain003.com', 'User 115', '60', '60', '100', '/home/daniell/domains/domain003/user115-mbx001', '5', '119',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('457','229','119','3','user115-mbx001-1','119',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('458','229','119','3','user115-mbx001-2','119',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('230','119','3','user115-mbx002','user115-mbx002pw', 'user115-mbx002@domain003.com', 'User 115', '60', '60', '100', '/home/daniell/domains/domain003/user115-mbx002', '5', '119',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('459','230','119','3','user115-mbx002-1','119',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('460','230','119','3','user115-mbx002-2','119',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('120','3','user116', PASSWORD('user116pw'),'user116pw','User 116','U','true','5','104',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('231','120','3','user116-mbx001','user116-mbx001pw', 'user116-mbx001@domain003.com', 'User 116', '60', '60', '100', '/home/daniell/domains/domain003/user116-mbx001', '5', '120',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('461','231','120','3','user116-mbx001-1','120',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('462','231','120','3','user116-mbx001-2','120',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('232','120','3','user116-mbx002','user116-mbx002pw', 'user116-mbx002@domain003.com', 'User 116', '60', '60', '100', '/home/daniell/domains/domain003/user116-mbx002', '5', '120',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('463','232','120','3','user116-mbx002-1','120',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('464','232','120','3','user116-mbx002-2','120',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('121','3','user117', PASSWORD('user117pw'),'user117pw','User 117','U','true','5','104',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('233','121','3','user117-mbx001','user117-mbx001pw', 'user117-mbx001@domain003.com', 'User 117', '60', '60', '100', '/home/daniell/domains/domain003/user117-mbx001', '5', '121',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('465','233','121','3','user117-mbx001-1','121',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('466','233','121','3','user117-mbx001-2','121',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('234','121','3','user117-mbx002','user117-mbx002pw', 'user117-mbx002@domain003.com', 'User 117', '60', '60', '100', '/home/daniell/domains/domain003/user117-mbx002', '5', '121',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('467','234','121','3','user117-mbx002-1','121',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('468','234','121','3','user117-mbx002-2','121',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('122','3','user118', PASSWORD('user118pw'),'user118pw','User 118','U','true','5','104',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('235','122','3','user118-mbx001','user118-mbx001pw', 'user118-mbx001@domain003.com', 'User 118', '60', '60', '100', '/home/daniell/domains/domain003/user118-mbx001', '5', '122',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('469','235','122','3','user118-mbx001-1','122',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('470','235','122','3','user118-mbx001-2','122',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('236','122','3','user118-mbx002','user118-mbx002pw', 'user118-mbx002@domain003.com', 'User 118', '60', '60', '100', '/home/daniell/domains/domain003/user118-mbx002', '5', '122',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('471','236','122','3','user118-mbx002-1','122',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('472','236','122','3','user118-mbx002-2','122',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('123','3','user119', PASSWORD('user119pw'),'user119pw','User 119','U','true','5','104',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('237','123','3','user119-mbx001','user119-mbx001pw', 'user119-mbx001@domain003.com', 'User 119', '60', '60', '100', '/home/daniell/domains/domain003/user119-mbx001', '5', '123',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('473','237','123','3','user119-mbx001-1','123',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('474','237','123','3','user119-mbx001-2','123',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('238','123','3','user119-mbx002','user119-mbx002pw', 'user119-mbx002@domain003.com', 'User 119', '60', '60', '100', '/home/daniell/domains/domain003/user119-mbx002', '5', '123',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('475','238','123','3','user119-mbx002-1','123',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('476','238','123','3','user119-mbx002-2','123',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('124','3','user120', PASSWORD('user120pw'),'user120pw','User 120','U','true','5','104',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('239','124','3','user120-mbx001','user120-mbx001pw', 'user120-mbx001@domain003.com', 'User 120', '60', '60', '100', '/home/daniell/domains/domain003/user120-mbx001', '5', '124',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('477','239','124','3','user120-mbx001-1','124',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('478','239','124','3','user120-mbx001-2','124',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('240','124','3','user120-mbx002','user120-mbx002pw', 'user120-mbx002@domain003.com', 'User 120', '60', '60', '100', '/home/daniell/domains/domain003/user120-mbx002', '5', '124',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('479','240','124','3','user120-mbx002-1','124',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('480','240','124','3','user120-mbx002-2','124',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('125','3','user121', PASSWORD('user121pw'),'user121pw','User 121','U','true','5','104',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('241','125','3','user121-mbx001','user121-mbx001pw', 'user121-mbx001@domain003.com', 'User 121', '60', '60', '100', '/home/daniell/domains/domain003/user121-mbx001', '5', '125',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('481','241','125','3','user121-mbx001-1','125',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('482','241','125','3','user121-mbx001-2','125',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('242','125','3','user121-mbx002','user121-mbx002pw', 'user121-mbx002@domain003.com', 'User 121', '60', '60', '100', '/home/daniell/domains/domain003/user121-mbx002', '5', '125',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('483','242','125','3','user121-mbx002-1','125',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('484','242','125','3','user121-mbx002-2','125',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('126','3','user122', PASSWORD('user122pw'),'user122pw','User 122','U','true','5','104',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('243','126','3','user122-mbx001','user122-mbx001pw', 'user122-mbx001@domain003.com', 'User 122', '60', '60', '100', '/home/daniell/domains/domain003/user122-mbx001', '5', '126',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('485','243','126','3','user122-mbx001-1','126',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('486','243','126','3','user122-mbx001-2','126',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('244','126','3','user122-mbx002','user122-mbx002pw', 'user122-mbx002@domain003.com', 'User 122', '60', '60', '100', '/home/daniell/domains/domain003/user122-mbx002', '5', '126',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('487','244','126','3','user122-mbx002-1','126',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('488','244','126','3','user122-mbx002-2','126',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('127','3','user123', PASSWORD('user123pw'),'user123pw','User 123','U','true','5','104',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('245','127','3','user123-mbx001','user123-mbx001pw', 'user123-mbx001@domain003.com', 'User 123', '60', '60', '100', '/home/daniell/domains/domain003/user123-mbx001', '5', '127',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('489','245','127','3','user123-mbx001-1','127',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('490','245','127','3','user123-mbx001-2','127',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('246','127','3','user123-mbx002','user123-mbx002pw', 'user123-mbx002@domain003.com', 'User 123', '60', '60', '100', '/home/daniell/domains/domain003/user123-mbx002', '5', '127',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('491','246','127','3','user123-mbx002-1','127',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('492','246','127','3','user123-mbx002-2','127',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('128','3','user124', PASSWORD('user124pw'),'user124pw','User 124','U','true','5','104',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('247','128','3','user124-mbx001','user124-mbx001pw', 'user124-mbx001@domain003.com', 'User 124', '60', '60', '100', '/home/daniell/domains/domain003/user124-mbx001', '5', '128',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('493','247','128','3','user124-mbx001-1','128',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('494','247','128','3','user124-mbx001-2','128',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('248','128','3','user124-mbx002','user124-mbx002pw', 'user124-mbx002@domain003.com', 'User 124', '60', '60', '100', '/home/daniell/domains/domain003/user124-mbx002', '5', '128',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('495','248','128','3','user124-mbx002-1','128',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('496','248','128','3','user124-mbx002-2','128',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('129','3','user125', PASSWORD('user125pw'),'user125pw','User 125','U','true','5','104',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('249','129','3','user125-mbx001','user125-mbx001pw', 'user125-mbx001@domain003.com', 'User 125', '60', '60', '100', '/home/daniell/domains/domain003/user125-mbx001', '5', '129',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('497','249','129','3','user125-mbx001-1','129',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('498','249','129','3','user125-mbx001-2','129',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('250','129','3','user125-mbx002','user125-mbx002pw', 'user125-mbx002@domain003.com', 'User 125', '60', '60', '100', '/home/daniell/domains/domain003/user125-mbx002', '5', '129',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('499','250','129','3','user125-mbx002-1','129',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('500','250','129','3','user125-mbx002-2','129',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('130','3','user126', PASSWORD('user126pw'),'user126pw','User 126','U','true','5','104',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('251','130','3','user126-mbx001','user126-mbx001pw', 'user126-mbx001@domain003.com', 'User 126', '60', '60', '100', '/home/daniell/domains/domain003/user126-mbx001', '5', '130',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('501','251','130','3','user126-mbx001-1','130',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('502','251','130','3','user126-mbx001-2','130',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('252','130','3','user126-mbx002','user126-mbx002pw', 'user126-mbx002@domain003.com', 'User 126', '60', '60', '100', '/home/daniell/domains/domain003/user126-mbx002', '5', '130',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('503','252','130','3','user126-mbx002-1','130',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('504','252','130','3','user126-mbx002-2','130',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('131','3','user127', PASSWORD('user127pw'),'user127pw','User 127','U','true','5','104',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('253','131','3','user127-mbx001','user127-mbx001pw', 'user127-mbx001@domain003.com', 'User 127', '60', '60', '100', '/home/daniell/domains/domain003/user127-mbx001', '5', '131',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('505','253','131','3','user127-mbx001-1','131',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('506','253','131','3','user127-mbx001-2','131',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('254','131','3','user127-mbx002','user127-mbx002pw', 'user127-mbx002@domain003.com', 'User 127', '60', '60', '100', '/home/daniell/domains/domain003/user127-mbx002', '5', '131',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('507','254','131','3','user127-mbx002-1','131',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('508','254','131','3','user127-mbx002-2','131',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('132','3','user128', PASSWORD('user128pw'),'user128pw','User 128','U','true','5','104',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('255','132','3','user128-mbx001','user128-mbx001pw', 'user128-mbx001@domain003.com', 'User 128', '60', '60', '100', '/home/daniell/domains/domain003/user128-mbx001', '5', '132',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('509','255','132','3','user128-mbx001-1','132',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('510','255','132','3','user128-mbx001-2','132',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('256','132','3','user128-mbx002','user128-mbx002pw', 'user128-mbx002@domain003.com', 'User 128', '60', '60', '100', '/home/daniell/domains/domain003/user128-mbx002', '5', '132',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('511','256','132','3','user128-mbx002-1','132',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('512','256','132','3','user128-mbx002-2','132',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('133','3','user129', PASSWORD('user129pw'),'user129pw','User 129','U','true','5','104',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('257','133','3','user129-mbx001','user129-mbx001pw', 'user129-mbx001@domain003.com', 'User 129', '60', '60', '100', '/home/daniell/domains/domain003/user129-mbx001', '5', '133',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('513','257','133','3','user129-mbx001-1','133',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('514','257','133','3','user129-mbx001-2','133',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('258','133','3','user129-mbx002','user129-mbx002pw', 'user129-mbx002@domain003.com', 'User 129', '60', '60', '100', '/home/daniell/domains/domain003/user129-mbx002', '5', '133',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('515','258','133','3','user129-mbx002-1','133',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('516','258','133','3','user129-mbx002-2','133',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('134','3','user130', PASSWORD('user130pw'),'user130pw','User 130','U','true','5','104',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('259','134','3','user130-mbx001','user130-mbx001pw', 'user130-mbx001@domain003.com', 'User 130', '60', '60', '100', '/home/daniell/domains/domain003/user130-mbx001', '5', '134',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('517','259','134','3','user130-mbx001-1','134',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('518','259','134','3','user130-mbx001-2','134',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('260','134','3','user130-mbx002','user130-mbx002pw', 'user130-mbx002@domain003.com', 'User 130', '60', '60', '100', '/home/daniell/domains/domain003/user130-mbx002', '5', '134',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('519','260','134','3','user130-mbx002-1','134',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('520','260','134','3','user130-mbx002-2','134',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('135','3','user131', PASSWORD('user131pw'),'user131pw','User 131','U','true','5','104',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('261','135','3','user131-mbx001','user131-mbx001pw', 'user131-mbx001@domain003.com', 'User 131', '60', '60', '100', '/home/daniell/domains/domain003/user131-mbx001', '5', '135',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('521','261','135','3','user131-mbx001-1','135',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('522','261','135','3','user131-mbx001-2','135',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('262','135','3','user131-mbx002','user131-mbx002pw', 'user131-mbx002@domain003.com', 'User 131', '60', '60', '100', '/home/daniell/domains/domain003/user131-mbx002', '5', '135',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('523','262','135','3','user131-mbx002-1','135',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('524','262','135','3','user131-mbx002-2','135',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('136','3','user132', PASSWORD('user132pw'),'user132pw','User 132','U','true','5','104',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('263','136','3','user132-mbx001','user132-mbx001pw', 'user132-mbx001@domain003.com', 'User 132', '60', '60', '100', '/home/daniell/domains/domain003/user132-mbx001', '5', '136',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('525','263','136','3','user132-mbx001-1','136',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('526','263','136','3','user132-mbx001-2','136',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('264','136','3','user132-mbx002','user132-mbx002pw', 'user132-mbx002@domain003.com', 'User 132', '60', '60', '100', '/home/daniell/domains/domain003/user132-mbx002', '5', '136',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('527','264','136','3','user132-mbx002-1','136',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('528','264','136','3','user132-mbx002-2','136',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('137','3','user133', PASSWORD('user133pw'),'user133pw','User 133','U','true','5','104',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('265','137','3','user133-mbx001','user133-mbx001pw', 'user133-mbx001@domain003.com', 'User 133', '60', '60', '100', '/home/daniell/domains/domain003/user133-mbx001', '5', '137',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('529','265','137','3','user133-mbx001-1','137',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('530','265','137','3','user133-mbx001-2','137',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('266','137','3','user133-mbx002','user133-mbx002pw', 'user133-mbx002@domain003.com', 'User 133', '60', '60', '100', '/home/daniell/domains/domain003/user133-mbx002', '5', '137',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('531','266','137','3','user133-mbx002-1','137',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('532','266','137','3','user133-mbx002-2','137',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('138','3','user134', PASSWORD('user134pw'),'user134pw','User 134','U','true','5','104',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('267','138','3','user134-mbx001','user134-mbx001pw', 'user134-mbx001@domain003.com', 'User 134', '60', '60', '100', '/home/daniell/domains/domain003/user134-mbx001', '5', '138',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('533','267','138','3','user134-mbx001-1','138',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('534','267','138','3','user134-mbx001-2','138',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('268','138','3','user134-mbx002','user134-mbx002pw', 'user134-mbx002@domain003.com', 'User 134', '60', '60', '100', '/home/daniell/domains/domain003/user134-mbx002', '5', '138',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('535','268','138','3','user134-mbx002-1','138',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('536','268','138','3','user134-mbx002-2','138',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('139','3','user135', PASSWORD('user135pw'),'user135pw','User 135','U','true','5','104',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('269','139','3','user135-mbx001','user135-mbx001pw', 'user135-mbx001@domain003.com', 'User 135', '60', '60', '100', '/home/daniell/domains/domain003/user135-mbx001', '5', '139',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('537','269','139','3','user135-mbx001-1','139',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('538','269','139','3','user135-mbx001-2','139',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('270','139','3','user135-mbx002','user135-mbx002pw', 'user135-mbx002@domain003.com', 'User 135', '60', '60', '100', '/home/daniell/domains/domain003/user135-mbx002', '5', '139',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('539','270','139','3','user135-mbx002-1','139',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('540','270','139','3','user135-mbx002-2','139',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('140','3','user136', PASSWORD('user136pw'),'user136pw','User 136','U','true','5','104',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('271','140','3','user136-mbx001','user136-mbx001pw', 'user136-mbx001@domain003.com', 'User 136', '60', '60', '100', '/home/daniell/domains/domain003/user136-mbx001', '5', '140',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('541','271','140','3','user136-mbx001-1','140',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('542','271','140','3','user136-mbx001-2','140',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('272','140','3','user136-mbx002','user136-mbx002pw', 'user136-mbx002@domain003.com', 'User 136', '60', '60', '100', '/home/daniell/domains/domain003/user136-mbx002', '5', '140',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('543','272','140','3','user136-mbx002-1','140',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('544','272','140','3','user136-mbx002-2','140',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('141','3','user137', PASSWORD('user137pw'),'user137pw','User 137','U','true','5','104',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('273','141','3','user137-mbx001','user137-mbx001pw', 'user137-mbx001@domain003.com', 'User 137', '60', '60', '100', '/home/daniell/domains/domain003/user137-mbx001', '5', '141',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('545','273','141','3','user137-mbx001-1','141',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('546','273','141','3','user137-mbx001-2','141',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('274','141','3','user137-mbx002','user137-mbx002pw', 'user137-mbx002@domain003.com', 'User 137', '60', '60', '100', '/home/daniell/domains/domain003/user137-mbx002', '5', '141',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('547','274','141','3','user137-mbx002-1','141',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('548','274','141','3','user137-mbx002-2','141',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('142','3','user138', PASSWORD('user138pw'),'user138pw','User 138','U','true','5','104',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('275','142','3','user138-mbx001','user138-mbx001pw', 'user138-mbx001@domain003.com', 'User 138', '60', '60', '100', '/home/daniell/domains/domain003/user138-mbx001', '5', '142',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('549','275','142','3','user138-mbx001-1','142',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('550','275','142','3','user138-mbx001-2','142',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('276','142','3','user138-mbx002','user138-mbx002pw', 'user138-mbx002@domain003.com', 'User 138', '60', '60', '100', '/home/daniell/domains/domain003/user138-mbx002', '5', '142',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('551','276','142','3','user138-mbx002-1','142',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('552','276','142','3','user138-mbx002-2','142',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('143','3','user139', PASSWORD('user139pw'),'user139pw','User 139','U','true','5','104',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('277','143','3','user139-mbx001','user139-mbx001pw', 'user139-mbx001@domain003.com', 'User 139', '60', '60', '100', '/home/daniell/domains/domain003/user139-mbx001', '5', '143',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('553','277','143','3','user139-mbx001-1','143',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('554','277','143','3','user139-mbx001-2','143',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('278','143','3','user139-mbx002','user139-mbx002pw', 'user139-mbx002@domain003.com', 'User 139', '60', '60', '100', '/home/daniell/domains/domain003/user139-mbx002', '5', '143',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('555','278','143','3','user139-mbx002-1','143',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('556','278','143','3','user139-mbx002-2','143',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('144','3','user140', PASSWORD('user140pw'),'user140pw','User 140','U','true','5','104',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('279','144','3','user140-mbx001','user140-mbx001pw', 'user140-mbx001@domain003.com', 'User 140', '60', '60', '100', '/home/daniell/domains/domain003/user140-mbx001', '5', '144',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('557','279','144','3','user140-mbx001-1','144',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('558','279','144','3','user140-mbx001-2','144',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('280','144','3','user140-mbx002','user140-mbx002pw', 'user140-mbx002@domain003.com', 'User 140', '60', '60', '100', '/home/daniell/domains/domain003/user140-mbx002', '5', '144',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('559','280','144','3','user140-mbx002-1','144',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('560','280','144','3','user140-mbx002-2','144',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('145','3','user141', PASSWORD('user141pw'),'user141pw','User 141','U','true','5','104',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('281','145','3','user141-mbx001','user141-mbx001pw', 'user141-mbx001@domain003.com', 'User 141', '60', '60', '100', '/home/daniell/domains/domain003/user141-mbx001', '5', '145',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('561','281','145','3','user141-mbx001-1','145',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('562','281','145','3','user141-mbx001-2','145',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('282','145','3','user141-mbx002','user141-mbx002pw', 'user141-mbx002@domain003.com', 'User 141', '60', '60', '100', '/home/daniell/domains/domain003/user141-mbx002', '5', '145',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('563','282','145','3','user141-mbx002-1','145',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('564','282','145','3','user141-mbx002-2','145',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('146','3','user142', PASSWORD('user142pw'),'user142pw','User 142','U','true','5','104',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('283','146','3','user142-mbx001','user142-mbx001pw', 'user142-mbx001@domain003.com', 'User 142', '60', '60', '100', '/home/daniell/domains/domain003/user142-mbx001', '5', '146',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('565','283','146','3','user142-mbx001-1','146',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('566','283','146','3','user142-mbx001-2','146',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('284','146','3','user142-mbx002','user142-mbx002pw', 'user142-mbx002@domain003.com', 'User 142', '60', '60', '100', '/home/daniell/domains/domain003/user142-mbx002', '5', '146',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('567','284','146','3','user142-mbx002-1','146',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('568','284','146','3','user142-mbx002-2','146',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('147','3','user143', PASSWORD('user143pw'),'user143pw','User 143','U','true','5','104',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('285','147','3','user143-mbx001','user143-mbx001pw', 'user143-mbx001@domain003.com', 'User 143', '60', '60', '100', '/home/daniell/domains/domain003/user143-mbx001', '5', '147',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('569','285','147','3','user143-mbx001-1','147',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('570','285','147','3','user143-mbx001-2','147',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('286','147','3','user143-mbx002','user143-mbx002pw', 'user143-mbx002@domain003.com', 'User 143', '60', '60', '100', '/home/daniell/domains/domain003/user143-mbx002', '5', '147',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('571','286','147','3','user143-mbx002-1','147',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('572','286','147','3','user143-mbx002-2','147',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('148','3','user144', PASSWORD('user144pw'),'user144pw','User 144','U','true','5','104',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('287','148','3','user144-mbx001','user144-mbx001pw', 'user144-mbx001@domain003.com', 'User 144', '60', '60', '100', '/home/daniell/domains/domain003/user144-mbx001', '5', '148',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('573','287','148','3','user144-mbx001-1','148',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('574','287','148','3','user144-mbx001-2','148',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('288','148','3','user144-mbx002','user144-mbx002pw', 'user144-mbx002@domain003.com', 'User 144', '60', '60', '100', '/home/daniell/domains/domain003/user144-mbx002', '5', '148',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('575','288','148','3','user144-mbx002-1','148',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('576','288','148','3','user144-mbx002-2','148',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('149','3','user145', PASSWORD('user145pw'),'user145pw','User 145','U','true','5','104',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('289','149','3','user145-mbx001','user145-mbx001pw', 'user145-mbx001@domain003.com', 'User 145', '60', '60', '100', '/home/daniell/domains/domain003/user145-mbx001', '5', '149',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('577','289','149','3','user145-mbx001-1','149',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('578','289','149','3','user145-mbx001-2','149',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('290','149','3','user145-mbx002','user145-mbx002pw', 'user145-mbx002@domain003.com', 'User 145', '60', '60', '100', '/home/daniell/domains/domain003/user145-mbx002', '5', '149',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('579','290','149','3','user145-mbx002-1','149',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('580','290','149','3','user145-mbx002-2','149',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('150','3','user146', PASSWORD('user146pw'),'user146pw','User 146','U','true','5','104',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('291','150','3','user146-mbx001','user146-mbx001pw', 'user146-mbx001@domain003.com', 'User 146', '60', '60', '100', '/home/daniell/domains/domain003/user146-mbx001', '5', '150',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('581','291','150','3','user146-mbx001-1','150',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('582','291','150','3','user146-mbx001-2','150',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('292','150','3','user146-mbx002','user146-mbx002pw', 'user146-mbx002@domain003.com', 'User 146', '60', '60', '100', '/home/daniell/domains/domain003/user146-mbx002', '5', '150',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('583','292','150','3','user146-mbx002-1','150',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('584','292','150','3','user146-mbx002-2','150',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('151','3','user147', PASSWORD('user147pw'),'user147pw','User 147','U','true','5','104',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('293','151','3','user147-mbx001','user147-mbx001pw', 'user147-mbx001@domain003.com', 'User 147', '60', '60', '100', '/home/daniell/domains/domain003/user147-mbx001', '5', '151',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('585','293','151','3','user147-mbx001-1','151',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('586','293','151','3','user147-mbx001-2','151',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('294','151','3','user147-mbx002','user147-mbx002pw', 'user147-mbx002@domain003.com', 'User 147', '60', '60', '100', '/home/daniell/domains/domain003/user147-mbx002', '5', '151',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('587','294','151','3','user147-mbx002-1','151',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('588','294','151','3','user147-mbx002-2','151',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('152','3','user148', PASSWORD('user148pw'),'user148pw','User 148','U','true','5','104',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('295','152','3','user148-mbx001','user148-mbx001pw', 'user148-mbx001@domain003.com', 'User 148', '60', '60', '100', '/home/daniell/domains/domain003/user148-mbx001', '5', '152',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('589','295','152','3','user148-mbx001-1','152',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('590','295','152','3','user148-mbx001-2','152',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('296','152','3','user148-mbx002','user148-mbx002pw', 'user148-mbx002@domain003.com', 'User 148', '60', '60', '100', '/home/daniell/domains/domain003/user148-mbx002', '5', '152',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('591','296','152','3','user148-mbx002-1','152',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('592','296','152','3','user148-mbx002-2','152',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('153','3','user149', PASSWORD('user149pw'),'user149pw','User 149','U','true','5','104',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('297','153','3','user149-mbx001','user149-mbx001pw', 'user149-mbx001@domain003.com', 'User 149', '60', '60', '100', '/home/daniell/domains/domain003/user149-mbx001', '5', '153',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('593','297','153','3','user149-mbx001-1','153',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('594','297','153','3','user149-mbx001-2','153',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('298','153','3','user149-mbx002','user149-mbx002pw', 'user149-mbx002@domain003.com', 'User 149', '60', '60', '100', '/home/daniell/domains/domain003/user149-mbx002', '5', '153',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('595','298','153','3','user149-mbx002-1','153',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('596','298','153','3','user149-mbx002-2','153',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('154','3','user150', PASSWORD('user150pw'),'user150pw','User 150','U','true','5','104',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('299','154','3','user150-mbx001','user150-mbx001pw', 'user150-mbx001@domain003.com', 'User 150', '60', '60', '100', '/home/daniell/domains/domain003/user150-mbx001', '5', '154',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('597','299','154','3','user150-mbx001-1','154',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('598','299','154','3','user150-mbx001-2','154',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('300','154','3','user150-mbx002','user150-mbx002pw', 'user150-mbx002@domain003.com', 'User 150', '60', '60', '100', '/home/daniell/domains/domain003/user150-mbx002', '5', '154',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('599','300','154','3','user150-mbx002-1','154',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('600','300','154','3','user150-mbx002-2','154',NOW());

INSERT INTO Domains
(DomainId,Domainname,Uid,Gid,Directory,Quota,MailboxLimit,AliasLimit,EditBy,EditWhen)
VALUES
('4','domain004.com','60','60','/home/daniell/domains/domain004','100','5','5','1',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,EditBy,EditWhen)
VALUES
('155','0','admin004',PASSWORD('admin004pw'),'admin004pw','Administrator 4','A','true','1',NOW());

INSERT INTO DomainAccess (AccountId, DomainId) VALUES ('155','4');

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('156','4','user151', PASSWORD('user151pw'),'user151pw','User 151','U','true','5','155',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('301','156','4','user151-mbx001','user151-mbx001pw', 'user151-mbx001@domain004.com', 'User 151', '60', '60', '100', '/home/daniell/domains/domain004/user151-mbx001', '5', '156',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('601','301','156','4','user151-mbx001-1','156',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('602','301','156','4','user151-mbx001-2','156',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('302','156','4','user151-mbx002','user151-mbx002pw', 'user151-mbx002@domain004.com', 'User 151', '60', '60', '100', '/home/daniell/domains/domain004/user151-mbx002', '5', '156',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('603','302','156','4','user151-mbx002-1','156',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('604','302','156','4','user151-mbx002-2','156',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('157','4','user152', PASSWORD('user152pw'),'user152pw','User 152','U','true','5','155',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('303','157','4','user152-mbx001','user152-mbx001pw', 'user152-mbx001@domain004.com', 'User 152', '60', '60', '100', '/home/daniell/domains/domain004/user152-mbx001', '5', '157',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('605','303','157','4','user152-mbx001-1','157',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('606','303','157','4','user152-mbx001-2','157',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('304','157','4','user152-mbx002','user152-mbx002pw', 'user152-mbx002@domain004.com', 'User 152', '60', '60', '100', '/home/daniell/domains/domain004/user152-mbx002', '5', '157',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('607','304','157','4','user152-mbx002-1','157',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('608','304','157','4','user152-mbx002-2','157',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('158','4','user153', PASSWORD('user153pw'),'user153pw','User 153','U','true','5','155',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('305','158','4','user153-mbx001','user153-mbx001pw', 'user153-mbx001@domain004.com', 'User 153', '60', '60', '100', '/home/daniell/domains/domain004/user153-mbx001', '5', '158',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('609','305','158','4','user153-mbx001-1','158',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('610','305','158','4','user153-mbx001-2','158',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('306','158','4','user153-mbx002','user153-mbx002pw', 'user153-mbx002@domain004.com', 'User 153', '60', '60', '100', '/home/daniell/domains/domain004/user153-mbx002', '5', '158',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('611','306','158','4','user153-mbx002-1','158',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('612','306','158','4','user153-mbx002-2','158',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('159','4','user154', PASSWORD('user154pw'),'user154pw','User 154','U','true','5','155',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('307','159','4','user154-mbx001','user154-mbx001pw', 'user154-mbx001@domain004.com', 'User 154', '60', '60', '100', '/home/daniell/domains/domain004/user154-mbx001', '5', '159',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('613','307','159','4','user154-mbx001-1','159',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('614','307','159','4','user154-mbx001-2','159',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('308','159','4','user154-mbx002','user154-mbx002pw', 'user154-mbx002@domain004.com', 'User 154', '60', '60', '100', '/home/daniell/domains/domain004/user154-mbx002', '5', '159',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('615','308','159','4','user154-mbx002-1','159',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('616','308','159','4','user154-mbx002-2','159',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('160','4','user155', PASSWORD('user155pw'),'user155pw','User 155','U','true','5','155',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('309','160','4','user155-mbx001','user155-mbx001pw', 'user155-mbx001@domain004.com', 'User 155', '60', '60', '100', '/home/daniell/domains/domain004/user155-mbx001', '5', '160',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('617','309','160','4','user155-mbx001-1','160',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('618','309','160','4','user155-mbx001-2','160',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('310','160','4','user155-mbx002','user155-mbx002pw', 'user155-mbx002@domain004.com', 'User 155', '60', '60', '100', '/home/daniell/domains/domain004/user155-mbx002', '5', '160',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('619','310','160','4','user155-mbx002-1','160',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('620','310','160','4','user155-mbx002-2','160',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('161','4','user156', PASSWORD('user156pw'),'user156pw','User 156','U','true','5','155',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('311','161','4','user156-mbx001','user156-mbx001pw', 'user156-mbx001@domain004.com', 'User 156', '60', '60', '100', '/home/daniell/domains/domain004/user156-mbx001', '5', '161',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('621','311','161','4','user156-mbx001-1','161',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('622','311','161','4','user156-mbx001-2','161',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('312','161','4','user156-mbx002','user156-mbx002pw', 'user156-mbx002@domain004.com', 'User 156', '60', '60', '100', '/home/daniell/domains/domain004/user156-mbx002', '5', '161',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('623','312','161','4','user156-mbx002-1','161',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('624','312','161','4','user156-mbx002-2','161',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('162','4','user157', PASSWORD('user157pw'),'user157pw','User 157','U','true','5','155',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('313','162','4','user157-mbx001','user157-mbx001pw', 'user157-mbx001@domain004.com', 'User 157', '60', '60', '100', '/home/daniell/domains/domain004/user157-mbx001', '5', '162',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('625','313','162','4','user157-mbx001-1','162',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('626','313','162','4','user157-mbx001-2','162',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('314','162','4','user157-mbx002','user157-mbx002pw', 'user157-mbx002@domain004.com', 'User 157', '60', '60', '100', '/home/daniell/domains/domain004/user157-mbx002', '5', '162',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('627','314','162','4','user157-mbx002-1','162',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('628','314','162','4','user157-mbx002-2','162',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('163','4','user158', PASSWORD('user158pw'),'user158pw','User 158','U','true','5','155',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('315','163','4','user158-mbx001','user158-mbx001pw', 'user158-mbx001@domain004.com', 'User 158', '60', '60', '100', '/home/daniell/domains/domain004/user158-mbx001', '5', '163',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('629','315','163','4','user158-mbx001-1','163',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('630','315','163','4','user158-mbx001-2','163',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('316','163','4','user158-mbx002','user158-mbx002pw', 'user158-mbx002@domain004.com', 'User 158', '60', '60', '100', '/home/daniell/domains/domain004/user158-mbx002', '5', '163',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('631','316','163','4','user158-mbx002-1','163',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('632','316','163','4','user158-mbx002-2','163',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('164','4','user159', PASSWORD('user159pw'),'user159pw','User 159','U','true','5','155',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('317','164','4','user159-mbx001','user159-mbx001pw', 'user159-mbx001@domain004.com', 'User 159', '60', '60', '100', '/home/daniell/domains/domain004/user159-mbx001', '5', '164',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('633','317','164','4','user159-mbx001-1','164',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('634','317','164','4','user159-mbx001-2','164',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('318','164','4','user159-mbx002','user159-mbx002pw', 'user159-mbx002@domain004.com', 'User 159', '60', '60', '100', '/home/daniell/domains/domain004/user159-mbx002', '5', '164',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('635','318','164','4','user159-mbx002-1','164',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('636','318','164','4','user159-mbx002-2','164',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('165','4','user160', PASSWORD('user160pw'),'user160pw','User 160','U','true','5','155',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('319','165','4','user160-mbx001','user160-mbx001pw', 'user160-mbx001@domain004.com', 'User 160', '60', '60', '100', '/home/daniell/domains/domain004/user160-mbx001', '5', '165',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('637','319','165','4','user160-mbx001-1','165',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('638','319','165','4','user160-mbx001-2','165',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('320','165','4','user160-mbx002','user160-mbx002pw', 'user160-mbx002@domain004.com', 'User 160', '60', '60', '100', '/home/daniell/domains/domain004/user160-mbx002', '5', '165',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('639','320','165','4','user160-mbx002-1','165',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('640','320','165','4','user160-mbx002-2','165',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('166','4','user161', PASSWORD('user161pw'),'user161pw','User 161','U','true','5','155',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('321','166','4','user161-mbx001','user161-mbx001pw', 'user161-mbx001@domain004.com', 'User 161', '60', '60', '100', '/home/daniell/domains/domain004/user161-mbx001', '5', '166',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('641','321','166','4','user161-mbx001-1','166',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('642','321','166','4','user161-mbx001-2','166',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('322','166','4','user161-mbx002','user161-mbx002pw', 'user161-mbx002@domain004.com', 'User 161', '60', '60', '100', '/home/daniell/domains/domain004/user161-mbx002', '5', '166',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('643','322','166','4','user161-mbx002-1','166',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('644','322','166','4','user161-mbx002-2','166',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('167','4','user162', PASSWORD('user162pw'),'user162pw','User 162','U','true','5','155',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('323','167','4','user162-mbx001','user162-mbx001pw', 'user162-mbx001@domain004.com', 'User 162', '60', '60', '100', '/home/daniell/domains/domain004/user162-mbx001', '5', '167',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('645','323','167','4','user162-mbx001-1','167',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('646','323','167','4','user162-mbx001-2','167',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('324','167','4','user162-mbx002','user162-mbx002pw', 'user162-mbx002@domain004.com', 'User 162', '60', '60', '100', '/home/daniell/domains/domain004/user162-mbx002', '5', '167',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('647','324','167','4','user162-mbx002-1','167',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('648','324','167','4','user162-mbx002-2','167',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('168','4','user163', PASSWORD('user163pw'),'user163pw','User 163','U','true','5','155',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('325','168','4','user163-mbx001','user163-mbx001pw', 'user163-mbx001@domain004.com', 'User 163', '60', '60', '100', '/home/daniell/domains/domain004/user163-mbx001', '5', '168',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('649','325','168','4','user163-mbx001-1','168',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('650','325','168','4','user163-mbx001-2','168',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('326','168','4','user163-mbx002','user163-mbx002pw', 'user163-mbx002@domain004.com', 'User 163', '60', '60', '100', '/home/daniell/domains/domain004/user163-mbx002', '5', '168',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('651','326','168','4','user163-mbx002-1','168',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('652','326','168','4','user163-mbx002-2','168',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('169','4','user164', PASSWORD('user164pw'),'user164pw','User 164','U','true','5','155',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('327','169','4','user164-mbx001','user164-mbx001pw', 'user164-mbx001@domain004.com', 'User 164', '60', '60', '100', '/home/daniell/domains/domain004/user164-mbx001', '5', '169',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('653','327','169','4','user164-mbx001-1','169',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('654','327','169','4','user164-mbx001-2','169',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('328','169','4','user164-mbx002','user164-mbx002pw', 'user164-mbx002@domain004.com', 'User 164', '60', '60', '100', '/home/daniell/domains/domain004/user164-mbx002', '5', '169',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('655','328','169','4','user164-mbx002-1','169',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('656','328','169','4','user164-mbx002-2','169',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('170','4','user165', PASSWORD('user165pw'),'user165pw','User 165','U','true','5','155',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('329','170','4','user165-mbx001','user165-mbx001pw', 'user165-mbx001@domain004.com', 'User 165', '60', '60', '100', '/home/daniell/domains/domain004/user165-mbx001', '5', '170',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('657','329','170','4','user165-mbx001-1','170',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('658','329','170','4','user165-mbx001-2','170',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('330','170','4','user165-mbx002','user165-mbx002pw', 'user165-mbx002@domain004.com', 'User 165', '60', '60', '100', '/home/daniell/domains/domain004/user165-mbx002', '5', '170',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('659','330','170','4','user165-mbx002-1','170',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('660','330','170','4','user165-mbx002-2','170',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('171','4','user166', PASSWORD('user166pw'),'user166pw','User 166','U','true','5','155',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('331','171','4','user166-mbx001','user166-mbx001pw', 'user166-mbx001@domain004.com', 'User 166', '60', '60', '100', '/home/daniell/domains/domain004/user166-mbx001', '5', '171',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('661','331','171','4','user166-mbx001-1','171',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('662','331','171','4','user166-mbx001-2','171',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('332','171','4','user166-mbx002','user166-mbx002pw', 'user166-mbx002@domain004.com', 'User 166', '60', '60', '100', '/home/daniell/domains/domain004/user166-mbx002', '5', '171',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('663','332','171','4','user166-mbx002-1','171',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('664','332','171','4','user166-mbx002-2','171',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('172','4','user167', PASSWORD('user167pw'),'user167pw','User 167','U','true','5','155',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('333','172','4','user167-mbx001','user167-mbx001pw', 'user167-mbx001@domain004.com', 'User 167', '60', '60', '100', '/home/daniell/domains/domain004/user167-mbx001', '5', '172',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('665','333','172','4','user167-mbx001-1','172',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('666','333','172','4','user167-mbx001-2','172',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('334','172','4','user167-mbx002','user167-mbx002pw', 'user167-mbx002@domain004.com', 'User 167', '60', '60', '100', '/home/daniell/domains/domain004/user167-mbx002', '5', '172',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('667','334','172','4','user167-mbx002-1','172',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('668','334','172','4','user167-mbx002-2','172',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('173','4','user168', PASSWORD('user168pw'),'user168pw','User 168','U','true','5','155',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('335','173','4','user168-mbx001','user168-mbx001pw', 'user168-mbx001@domain004.com', 'User 168', '60', '60', '100', '/home/daniell/domains/domain004/user168-mbx001', '5', '173',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('669','335','173','4','user168-mbx001-1','173',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('670','335','173','4','user168-mbx001-2','173',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('336','173','4','user168-mbx002','user168-mbx002pw', 'user168-mbx002@domain004.com', 'User 168', '60', '60', '100', '/home/daniell/domains/domain004/user168-mbx002', '5', '173',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('671','336','173','4','user168-mbx002-1','173',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('672','336','173','4','user168-mbx002-2','173',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('174','4','user169', PASSWORD('user169pw'),'user169pw','User 169','U','true','5','155',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('337','174','4','user169-mbx001','user169-mbx001pw', 'user169-mbx001@domain004.com', 'User 169', '60', '60', '100', '/home/daniell/domains/domain004/user169-mbx001', '5', '174',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('673','337','174','4','user169-mbx001-1','174',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('674','337','174','4','user169-mbx001-2','174',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('338','174','4','user169-mbx002','user169-mbx002pw', 'user169-mbx002@domain004.com', 'User 169', '60', '60', '100', '/home/daniell/domains/domain004/user169-mbx002', '5', '174',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('675','338','174','4','user169-mbx002-1','174',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('676','338','174','4','user169-mbx002-2','174',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('175','4','user170', PASSWORD('user170pw'),'user170pw','User 170','U','true','5','155',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('339','175','4','user170-mbx001','user170-mbx001pw', 'user170-mbx001@domain004.com', 'User 170', '60', '60', '100', '/home/daniell/domains/domain004/user170-mbx001', '5', '175',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('677','339','175','4','user170-mbx001-1','175',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('678','339','175','4','user170-mbx001-2','175',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('340','175','4','user170-mbx002','user170-mbx002pw', 'user170-mbx002@domain004.com', 'User 170', '60', '60', '100', '/home/daniell/domains/domain004/user170-mbx002', '5', '175',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('679','340','175','4','user170-mbx002-1','175',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('680','340','175','4','user170-mbx002-2','175',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('176','4','user171', PASSWORD('user171pw'),'user171pw','User 171','U','true','5','155',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('341','176','4','user171-mbx001','user171-mbx001pw', 'user171-mbx001@domain004.com', 'User 171', '60', '60', '100', '/home/daniell/domains/domain004/user171-mbx001', '5', '176',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('681','341','176','4','user171-mbx001-1','176',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('682','341','176','4','user171-mbx001-2','176',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('342','176','4','user171-mbx002','user171-mbx002pw', 'user171-mbx002@domain004.com', 'User 171', '60', '60', '100', '/home/daniell/domains/domain004/user171-mbx002', '5', '176',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('683','342','176','4','user171-mbx002-1','176',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('684','342','176','4','user171-mbx002-2','176',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('177','4','user172', PASSWORD('user172pw'),'user172pw','User 172','U','true','5','155',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('343','177','4','user172-mbx001','user172-mbx001pw', 'user172-mbx001@domain004.com', 'User 172', '60', '60', '100', '/home/daniell/domains/domain004/user172-mbx001', '5', '177',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('685','343','177','4','user172-mbx001-1','177',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('686','343','177','4','user172-mbx001-2','177',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('344','177','4','user172-mbx002','user172-mbx002pw', 'user172-mbx002@domain004.com', 'User 172', '60', '60', '100', '/home/daniell/domains/domain004/user172-mbx002', '5', '177',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('687','344','177','4','user172-mbx002-1','177',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('688','344','177','4','user172-mbx002-2','177',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('178','4','user173', PASSWORD('user173pw'),'user173pw','User 173','U','true','5','155',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('345','178','4','user173-mbx001','user173-mbx001pw', 'user173-mbx001@domain004.com', 'User 173', '60', '60', '100', '/home/daniell/domains/domain004/user173-mbx001', '5', '178',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('689','345','178','4','user173-mbx001-1','178',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('690','345','178','4','user173-mbx001-2','178',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('346','178','4','user173-mbx002','user173-mbx002pw', 'user173-mbx002@domain004.com', 'User 173', '60', '60', '100', '/home/daniell/domains/domain004/user173-mbx002', '5', '178',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('691','346','178','4','user173-mbx002-1','178',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('692','346','178','4','user173-mbx002-2','178',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('179','4','user174', PASSWORD('user174pw'),'user174pw','User 174','U','true','5','155',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('347','179','4','user174-mbx001','user174-mbx001pw', 'user174-mbx001@domain004.com', 'User 174', '60', '60', '100', '/home/daniell/domains/domain004/user174-mbx001', '5', '179',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('693','347','179','4','user174-mbx001-1','179',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('694','347','179','4','user174-mbx001-2','179',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('348','179','4','user174-mbx002','user174-mbx002pw', 'user174-mbx002@domain004.com', 'User 174', '60', '60', '100', '/home/daniell/domains/domain004/user174-mbx002', '5', '179',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('695','348','179','4','user174-mbx002-1','179',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('696','348','179','4','user174-mbx002-2','179',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('180','4','user175', PASSWORD('user175pw'),'user175pw','User 175','U','true','5','155',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('349','180','4','user175-mbx001','user175-mbx001pw', 'user175-mbx001@domain004.com', 'User 175', '60', '60', '100', '/home/daniell/domains/domain004/user175-mbx001', '5', '180',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('697','349','180','4','user175-mbx001-1','180',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('698','349','180','4','user175-mbx001-2','180',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('350','180','4','user175-mbx002','user175-mbx002pw', 'user175-mbx002@domain004.com', 'User 175', '60', '60', '100', '/home/daniell/domains/domain004/user175-mbx002', '5', '180',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('699','350','180','4','user175-mbx002-1','180',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('700','350','180','4','user175-mbx002-2','180',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('181','4','user176', PASSWORD('user176pw'),'user176pw','User 176','U','true','5','155',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('351','181','4','user176-mbx001','user176-mbx001pw', 'user176-mbx001@domain004.com', 'User 176', '60', '60', '100', '/home/daniell/domains/domain004/user176-mbx001', '5', '181',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('701','351','181','4','user176-mbx001-1','181',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('702','351','181','4','user176-mbx001-2','181',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('352','181','4','user176-mbx002','user176-mbx002pw', 'user176-mbx002@domain004.com', 'User 176', '60', '60', '100', '/home/daniell/domains/domain004/user176-mbx002', '5', '181',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('703','352','181','4','user176-mbx002-1','181',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('704','352','181','4','user176-mbx002-2','181',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('182','4','user177', PASSWORD('user177pw'),'user177pw','User 177','U','true','5','155',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('353','182','4','user177-mbx001','user177-mbx001pw', 'user177-mbx001@domain004.com', 'User 177', '60', '60', '100', '/home/daniell/domains/domain004/user177-mbx001', '5', '182',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('705','353','182','4','user177-mbx001-1','182',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('706','353','182','4','user177-mbx001-2','182',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('354','182','4','user177-mbx002','user177-mbx002pw', 'user177-mbx002@domain004.com', 'User 177', '60', '60', '100', '/home/daniell/domains/domain004/user177-mbx002', '5', '182',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('707','354','182','4','user177-mbx002-1','182',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('708','354','182','4','user177-mbx002-2','182',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('183','4','user178', PASSWORD('user178pw'),'user178pw','User 178','U','true','5','155',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('355','183','4','user178-mbx001','user178-mbx001pw', 'user178-mbx001@domain004.com', 'User 178', '60', '60', '100', '/home/daniell/domains/domain004/user178-mbx001', '5', '183',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('709','355','183','4','user178-mbx001-1','183',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('710','355','183','4','user178-mbx001-2','183',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('356','183','4','user178-mbx002','user178-mbx002pw', 'user178-mbx002@domain004.com', 'User 178', '60', '60', '100', '/home/daniell/domains/domain004/user178-mbx002', '5', '183',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('711','356','183','4','user178-mbx002-1','183',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('712','356','183','4','user178-mbx002-2','183',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('184','4','user179', PASSWORD('user179pw'),'user179pw','User 179','U','true','5','155',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('357','184','4','user179-mbx001','user179-mbx001pw', 'user179-mbx001@domain004.com', 'User 179', '60', '60', '100', '/home/daniell/domains/domain004/user179-mbx001', '5', '184',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('713','357','184','4','user179-mbx001-1','184',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('714','357','184','4','user179-mbx001-2','184',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('358','184','4','user179-mbx002','user179-mbx002pw', 'user179-mbx002@domain004.com', 'User 179', '60', '60', '100', '/home/daniell/domains/domain004/user179-mbx002', '5', '184',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('715','358','184','4','user179-mbx002-1','184',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('716','358','184','4','user179-mbx002-2','184',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('185','4','user180', PASSWORD('user180pw'),'user180pw','User 180','U','true','5','155',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('359','185','4','user180-mbx001','user180-mbx001pw', 'user180-mbx001@domain004.com', 'User 180', '60', '60', '100', '/home/daniell/domains/domain004/user180-mbx001', '5', '185',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('717','359','185','4','user180-mbx001-1','185',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('718','359','185','4','user180-mbx001-2','185',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('360','185','4','user180-mbx002','user180-mbx002pw', 'user180-mbx002@domain004.com', 'User 180', '60', '60', '100', '/home/daniell/domains/domain004/user180-mbx002', '5', '185',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('719','360','185','4','user180-mbx002-1','185',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('720','360','185','4','user180-mbx002-2','185',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('186','4','user181', PASSWORD('user181pw'),'user181pw','User 181','U','true','5','155',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('361','186','4','user181-mbx001','user181-mbx001pw', 'user181-mbx001@domain004.com', 'User 181', '60', '60', '100', '/home/daniell/domains/domain004/user181-mbx001', '5', '186',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('721','361','186','4','user181-mbx001-1','186',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('722','361','186','4','user181-mbx001-2','186',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('362','186','4','user181-mbx002','user181-mbx002pw', 'user181-mbx002@domain004.com', 'User 181', '60', '60', '100', '/home/daniell/domains/domain004/user181-mbx002', '5', '186',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('723','362','186','4','user181-mbx002-1','186',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('724','362','186','4','user181-mbx002-2','186',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('187','4','user182', PASSWORD('user182pw'),'user182pw','User 182','U','true','5','155',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('363','187','4','user182-mbx001','user182-mbx001pw', 'user182-mbx001@domain004.com', 'User 182', '60', '60', '100', '/home/daniell/domains/domain004/user182-mbx001', '5', '187',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('725','363','187','4','user182-mbx001-1','187',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('726','363','187','4','user182-mbx001-2','187',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('364','187','4','user182-mbx002','user182-mbx002pw', 'user182-mbx002@domain004.com', 'User 182', '60', '60', '100', '/home/daniell/domains/domain004/user182-mbx002', '5', '187',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('727','364','187','4','user182-mbx002-1','187',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('728','364','187','4','user182-mbx002-2','187',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('188','4','user183', PASSWORD('user183pw'),'user183pw','User 183','U','true','5','155',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('365','188','4','user183-mbx001','user183-mbx001pw', 'user183-mbx001@domain004.com', 'User 183', '60', '60', '100', '/home/daniell/domains/domain004/user183-mbx001', '5', '188',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('729','365','188','4','user183-mbx001-1','188',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('730','365','188','4','user183-mbx001-2','188',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('366','188','4','user183-mbx002','user183-mbx002pw', 'user183-mbx002@domain004.com', 'User 183', '60', '60', '100', '/home/daniell/domains/domain004/user183-mbx002', '5', '188',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('731','366','188','4','user183-mbx002-1','188',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('732','366','188','4','user183-mbx002-2','188',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('189','4','user184', PASSWORD('user184pw'),'user184pw','User 184','U','true','5','155',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('367','189','4','user184-mbx001','user184-mbx001pw', 'user184-mbx001@domain004.com', 'User 184', '60', '60', '100', '/home/daniell/domains/domain004/user184-mbx001', '5', '189',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('733','367','189','4','user184-mbx001-1','189',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('734','367','189','4','user184-mbx001-2','189',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('368','189','4','user184-mbx002','user184-mbx002pw', 'user184-mbx002@domain004.com', 'User 184', '60', '60', '100', '/home/daniell/domains/domain004/user184-mbx002', '5', '189',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('735','368','189','4','user184-mbx002-1','189',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('736','368','189','4','user184-mbx002-2','189',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('190','4','user185', PASSWORD('user185pw'),'user185pw','User 185','U','true','5','155',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('369','190','4','user185-mbx001','user185-mbx001pw', 'user185-mbx001@domain004.com', 'User 185', '60', '60', '100', '/home/daniell/domains/domain004/user185-mbx001', '5', '190',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('737','369','190','4','user185-mbx001-1','190',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('738','369','190','4','user185-mbx001-2','190',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('370','190','4','user185-mbx002','user185-mbx002pw', 'user185-mbx002@domain004.com', 'User 185', '60', '60', '100', '/home/daniell/domains/domain004/user185-mbx002', '5', '190',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('739','370','190','4','user185-mbx002-1','190',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('740','370','190','4','user185-mbx002-2','190',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('191','4','user186', PASSWORD('user186pw'),'user186pw','User 186','U','true','5','155',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('371','191','4','user186-mbx001','user186-mbx001pw', 'user186-mbx001@domain004.com', 'User 186', '60', '60', '100', '/home/daniell/domains/domain004/user186-mbx001', '5', '191',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('741','371','191','4','user186-mbx001-1','191',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('742','371','191','4','user186-mbx001-2','191',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('372','191','4','user186-mbx002','user186-mbx002pw', 'user186-mbx002@domain004.com', 'User 186', '60', '60', '100', '/home/daniell/domains/domain004/user186-mbx002', '5', '191',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('743','372','191','4','user186-mbx002-1','191',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('744','372','191','4','user186-mbx002-2','191',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('192','4','user187', PASSWORD('user187pw'),'user187pw','User 187','U','true','5','155',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('373','192','4','user187-mbx001','user187-mbx001pw', 'user187-mbx001@domain004.com', 'User 187', '60', '60', '100', '/home/daniell/domains/domain004/user187-mbx001', '5', '192',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('745','373','192','4','user187-mbx001-1','192',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('746','373','192','4','user187-mbx001-2','192',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('374','192','4','user187-mbx002','user187-mbx002pw', 'user187-mbx002@domain004.com', 'User 187', '60', '60', '100', '/home/daniell/domains/domain004/user187-mbx002', '5', '192',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('747','374','192','4','user187-mbx002-1','192',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('748','374','192','4','user187-mbx002-2','192',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('193','4','user188', PASSWORD('user188pw'),'user188pw','User 188','U','true','5','155',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('375','193','4','user188-mbx001','user188-mbx001pw', 'user188-mbx001@domain004.com', 'User 188', '60', '60', '100', '/home/daniell/domains/domain004/user188-mbx001', '5', '193',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('749','375','193','4','user188-mbx001-1','193',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('750','375','193','4','user188-mbx001-2','193',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('376','193','4','user188-mbx002','user188-mbx002pw', 'user188-mbx002@domain004.com', 'User 188', '60', '60', '100', '/home/daniell/domains/domain004/user188-mbx002', '5', '193',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('751','376','193','4','user188-mbx002-1','193',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('752','376','193','4','user188-mbx002-2','193',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('194','4','user189', PASSWORD('user189pw'),'user189pw','User 189','U','true','5','155',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('377','194','4','user189-mbx001','user189-mbx001pw', 'user189-mbx001@domain004.com', 'User 189', '60', '60', '100', '/home/daniell/domains/domain004/user189-mbx001', '5', '194',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('753','377','194','4','user189-mbx001-1','194',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('754','377','194','4','user189-mbx001-2','194',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('378','194','4','user189-mbx002','user189-mbx002pw', 'user189-mbx002@domain004.com', 'User 189', '60', '60', '100', '/home/daniell/domains/domain004/user189-mbx002', '5', '194',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('755','378','194','4','user189-mbx002-1','194',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('756','378','194','4','user189-mbx002-2','194',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('195','4','user190', PASSWORD('user190pw'),'user190pw','User 190','U','true','5','155',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('379','195','4','user190-mbx001','user190-mbx001pw', 'user190-mbx001@domain004.com', 'User 190', '60', '60', '100', '/home/daniell/domains/domain004/user190-mbx001', '5', '195',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('757','379','195','4','user190-mbx001-1','195',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('758','379','195','4','user190-mbx001-2','195',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('380','195','4','user190-mbx002','user190-mbx002pw', 'user190-mbx002@domain004.com', 'User 190', '60', '60', '100', '/home/daniell/domains/domain004/user190-mbx002', '5', '195',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('759','380','195','4','user190-mbx002-1','195',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('760','380','195','4','user190-mbx002-2','195',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('196','4','user191', PASSWORD('user191pw'),'user191pw','User 191','U','true','5','155',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('381','196','4','user191-mbx001','user191-mbx001pw', 'user191-mbx001@domain004.com', 'User 191', '60', '60', '100', '/home/daniell/domains/domain004/user191-mbx001', '5', '196',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('761','381','196','4','user191-mbx001-1','196',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('762','381','196','4','user191-mbx001-2','196',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('382','196','4','user191-mbx002','user191-mbx002pw', 'user191-mbx002@domain004.com', 'User 191', '60', '60', '100', '/home/daniell/domains/domain004/user191-mbx002', '5', '196',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('763','382','196','4','user191-mbx002-1','196',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('764','382','196','4','user191-mbx002-2','196',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('197','4','user192', PASSWORD('user192pw'),'user192pw','User 192','U','true','5','155',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('383','197','4','user192-mbx001','user192-mbx001pw', 'user192-mbx001@domain004.com', 'User 192', '60', '60', '100', '/home/daniell/domains/domain004/user192-mbx001', '5', '197',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('765','383','197','4','user192-mbx001-1','197',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('766','383','197','4','user192-mbx001-2','197',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('384','197','4','user192-mbx002','user192-mbx002pw', 'user192-mbx002@domain004.com', 'User 192', '60', '60', '100', '/home/daniell/domains/domain004/user192-mbx002', '5', '197',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('767','384','197','4','user192-mbx002-1','197',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('768','384','197','4','user192-mbx002-2','197',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('198','4','user193', PASSWORD('user193pw'),'user193pw','User 193','U','true','5','155',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('385','198','4','user193-mbx001','user193-mbx001pw', 'user193-mbx001@domain004.com', 'User 193', '60', '60', '100', '/home/daniell/domains/domain004/user193-mbx001', '5', '198',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('769','385','198','4','user193-mbx001-1','198',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('770','385','198','4','user193-mbx001-2','198',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('386','198','4','user193-mbx002','user193-mbx002pw', 'user193-mbx002@domain004.com', 'User 193', '60', '60', '100', '/home/daniell/domains/domain004/user193-mbx002', '5', '198',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('771','386','198','4','user193-mbx002-1','198',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('772','386','198','4','user193-mbx002-2','198',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('199','4','user194', PASSWORD('user194pw'),'user194pw','User 194','U','true','5','155',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('387','199','4','user194-mbx001','user194-mbx001pw', 'user194-mbx001@domain004.com', 'User 194', '60', '60', '100', '/home/daniell/domains/domain004/user194-mbx001', '5', '199',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('773','387','199','4','user194-mbx001-1','199',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('774','387','199','4','user194-mbx001-2','199',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('388','199','4','user194-mbx002','user194-mbx002pw', 'user194-mbx002@domain004.com', 'User 194', '60', '60', '100', '/home/daniell/domains/domain004/user194-mbx002', '5', '199',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('775','388','199','4','user194-mbx002-1','199',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('776','388','199','4','user194-mbx002-2','199',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('200','4','user195', PASSWORD('user195pw'),'user195pw','User 195','U','true','5','155',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('389','200','4','user195-mbx001','user195-mbx001pw', 'user195-mbx001@domain004.com', 'User 195', '60', '60', '100', '/home/daniell/domains/domain004/user195-mbx001', '5', '200',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('777','389','200','4','user195-mbx001-1','200',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('778','389','200','4','user195-mbx001-2','200',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('390','200','4','user195-mbx002','user195-mbx002pw', 'user195-mbx002@domain004.com', 'User 195', '60', '60', '100', '/home/daniell/domains/domain004/user195-mbx002', '5', '200',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('779','390','200','4','user195-mbx002-1','200',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('780','390','200','4','user195-mbx002-2','200',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('201','4','user196', PASSWORD('user196pw'),'user196pw','User 196','U','true','5','155',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('391','201','4','user196-mbx001','user196-mbx001pw', 'user196-mbx001@domain004.com', 'User 196', '60', '60', '100', '/home/daniell/domains/domain004/user196-mbx001', '5', '201',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('781','391','201','4','user196-mbx001-1','201',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('782','391','201','4','user196-mbx001-2','201',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('392','201','4','user196-mbx002','user196-mbx002pw', 'user196-mbx002@domain004.com', 'User 196', '60', '60', '100', '/home/daniell/domains/domain004/user196-mbx002', '5', '201',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('783','392','201','4','user196-mbx002-1','201',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('784','392','201','4','user196-mbx002-2','201',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('202','4','user197', PASSWORD('user197pw'),'user197pw','User 197','U','true','5','155',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('393','202','4','user197-mbx001','user197-mbx001pw', 'user197-mbx001@domain004.com', 'User 197', '60', '60', '100', '/home/daniell/domains/domain004/user197-mbx001', '5', '202',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('785','393','202','4','user197-mbx001-1','202',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('786','393','202','4','user197-mbx001-2','202',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('394','202','4','user197-mbx002','user197-mbx002pw', 'user197-mbx002@domain004.com', 'User 197', '60', '60', '100', '/home/daniell/domains/domain004/user197-mbx002', '5', '202',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('787','394','202','4','user197-mbx002-1','202',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('788','394','202','4','user197-mbx002-2','202',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('203','4','user198', PASSWORD('user198pw'),'user198pw','User 198','U','true','5','155',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('395','203','4','user198-mbx001','user198-mbx001pw', 'user198-mbx001@domain004.com', 'User 198', '60', '60', '100', '/home/daniell/domains/domain004/user198-mbx001', '5', '203',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('789','395','203','4','user198-mbx001-1','203',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('790','395','203','4','user198-mbx001-2','203',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('396','203','4','user198-mbx002','user198-mbx002pw', 'user198-mbx002@domain004.com', 'User 198', '60', '60', '100', '/home/daniell/domains/domain004/user198-mbx002', '5', '203',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('791','396','203','4','user198-mbx002-1','203',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('792','396','203','4','user198-mbx002-2','203',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('204','4','user199', PASSWORD('user199pw'),'user199pw','User 199','U','true','5','155',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('397','204','4','user199-mbx001','user199-mbx001pw', 'user199-mbx001@domain004.com', 'User 199', '60', '60', '100', '/home/daniell/domains/domain004/user199-mbx001', '5', '204',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('793','397','204','4','user199-mbx001-1','204',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('794','397','204','4','user199-mbx001-2','204',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('398','204','4','user199-mbx002','user199-mbx002pw', 'user199-mbx002@domain004.com', 'User 199', '60', '60', '100', '/home/daniell/domains/domain004/user199-mbx002', '5', '204',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('795','398','204','4','user199-mbx002-1','204',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('796','398','204','4','user199-mbx002-2','204',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('205','4','user200', PASSWORD('user200pw'),'user200pw','User 200','U','true','5','155',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('399','205','4','user200-mbx001','user200-mbx001pw', 'user200-mbx001@domain004.com', 'User 200', '60', '60', '100', '/home/daniell/domains/domain004/user200-mbx001', '5', '205',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('797','399','205','4','user200-mbx001-1','205',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('798','399','205','4','user200-mbx001-2','205',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('400','205','4','user200-mbx002','user200-mbx002pw', 'user200-mbx002@domain004.com', 'User 200', '60', '60', '100', '/home/daniell/domains/domain004/user200-mbx002', '5', '205',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('799','400','205','4','user200-mbx002-1','205',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('800','400','205','4','user200-mbx002-2','205',NOW());

INSERT INTO Domains
(DomainId,Domainname,Uid,Gid,Directory,Quota,MailboxLimit,AliasLimit,EditBy,EditWhen)
VALUES
('5','domain005.com','60','60','/home/daniell/domains/domain005','100','5','5','1',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,EditBy,EditWhen)
VALUES
('206','0','admin005',PASSWORD('admin005pw'),'admin005pw','Administrator 5','A','true','1',NOW());

INSERT INTO DomainAccess (AccountId, DomainId) VALUES ('206','5');

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('207','5','user201', PASSWORD('user201pw'),'user201pw','User 201','U','true','5','206',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('401','207','5','user201-mbx001','user201-mbx001pw', 'user201-mbx001@domain005.com', 'User 201', '60', '60', '100', '/home/daniell/domains/domain005/user201-mbx001', '5', '207',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('801','401','207','5','user201-mbx001-1','207',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('802','401','207','5','user201-mbx001-2','207',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('402','207','5','user201-mbx002','user201-mbx002pw', 'user201-mbx002@domain005.com', 'User 201', '60', '60', '100', '/home/daniell/domains/domain005/user201-mbx002', '5', '207',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('803','402','207','5','user201-mbx002-1','207',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('804','402','207','5','user201-mbx002-2','207',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('208','5','user202', PASSWORD('user202pw'),'user202pw','User 202','U','true','5','206',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('403','208','5','user202-mbx001','user202-mbx001pw', 'user202-mbx001@domain005.com', 'User 202', '60', '60', '100', '/home/daniell/domains/domain005/user202-mbx001', '5', '208',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('805','403','208','5','user202-mbx001-1','208',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('806','403','208','5','user202-mbx001-2','208',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('404','208','5','user202-mbx002','user202-mbx002pw', 'user202-mbx002@domain005.com', 'User 202', '60', '60', '100', '/home/daniell/domains/domain005/user202-mbx002', '5', '208',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('807','404','208','5','user202-mbx002-1','208',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('808','404','208','5','user202-mbx002-2','208',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('209','5','user203', PASSWORD('user203pw'),'user203pw','User 203','U','true','5','206',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('405','209','5','user203-mbx001','user203-mbx001pw', 'user203-mbx001@domain005.com', 'User 203', '60', '60', '100', '/home/daniell/domains/domain005/user203-mbx001', '5', '209',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('809','405','209','5','user203-mbx001-1','209',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('810','405','209','5','user203-mbx001-2','209',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('406','209','5','user203-mbx002','user203-mbx002pw', 'user203-mbx002@domain005.com', 'User 203', '60', '60', '100', '/home/daniell/domains/domain005/user203-mbx002', '5', '209',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('811','406','209','5','user203-mbx002-1','209',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('812','406','209','5','user203-mbx002-2','209',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('210','5','user204', PASSWORD('user204pw'),'user204pw','User 204','U','true','5','206',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('407','210','5','user204-mbx001','user204-mbx001pw', 'user204-mbx001@domain005.com', 'User 204', '60', '60', '100', '/home/daniell/domains/domain005/user204-mbx001', '5', '210',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('813','407','210','5','user204-mbx001-1','210',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('814','407','210','5','user204-mbx001-2','210',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('408','210','5','user204-mbx002','user204-mbx002pw', 'user204-mbx002@domain005.com', 'User 204', '60', '60', '100', '/home/daniell/domains/domain005/user204-mbx002', '5', '210',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('815','408','210','5','user204-mbx002-1','210',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('816','408','210','5','user204-mbx002-2','210',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('211','5','user205', PASSWORD('user205pw'),'user205pw','User 205','U','true','5','206',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('409','211','5','user205-mbx001','user205-mbx001pw', 'user205-mbx001@domain005.com', 'User 205', '60', '60', '100', '/home/daniell/domains/domain005/user205-mbx001', '5', '211',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('817','409','211','5','user205-mbx001-1','211',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('818','409','211','5','user205-mbx001-2','211',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('410','211','5','user205-mbx002','user205-mbx002pw', 'user205-mbx002@domain005.com', 'User 205', '60', '60', '100', '/home/daniell/domains/domain005/user205-mbx002', '5', '211',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('819','410','211','5','user205-mbx002-1','211',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('820','410','211','5','user205-mbx002-2','211',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('212','5','user206', PASSWORD('user206pw'),'user206pw','User 206','U','true','5','206',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('411','212','5','user206-mbx001','user206-mbx001pw', 'user206-mbx001@domain005.com', 'User 206', '60', '60', '100', '/home/daniell/domains/domain005/user206-mbx001', '5', '212',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('821','411','212','5','user206-mbx001-1','212',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('822','411','212','5','user206-mbx001-2','212',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('412','212','5','user206-mbx002','user206-mbx002pw', 'user206-mbx002@domain005.com', 'User 206', '60', '60', '100', '/home/daniell/domains/domain005/user206-mbx002', '5', '212',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('823','412','212','5','user206-mbx002-1','212',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('824','412','212','5','user206-mbx002-2','212',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('213','5','user207', PASSWORD('user207pw'),'user207pw','User 207','U','true','5','206',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('413','213','5','user207-mbx001','user207-mbx001pw', 'user207-mbx001@domain005.com', 'User 207', '60', '60', '100', '/home/daniell/domains/domain005/user207-mbx001', '5', '213',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('825','413','213','5','user207-mbx001-1','213',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('826','413','213','5','user207-mbx001-2','213',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('414','213','5','user207-mbx002','user207-mbx002pw', 'user207-mbx002@domain005.com', 'User 207', '60', '60', '100', '/home/daniell/domains/domain005/user207-mbx002', '5', '213',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('827','414','213','5','user207-mbx002-1','213',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('828','414','213','5','user207-mbx002-2','213',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('214','5','user208', PASSWORD('user208pw'),'user208pw','User 208','U','true','5','206',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('415','214','5','user208-mbx001','user208-mbx001pw', 'user208-mbx001@domain005.com', 'User 208', '60', '60', '100', '/home/daniell/domains/domain005/user208-mbx001', '5', '214',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('829','415','214','5','user208-mbx001-1','214',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('830','415','214','5','user208-mbx001-2','214',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('416','214','5','user208-mbx002','user208-mbx002pw', 'user208-mbx002@domain005.com', 'User 208', '60', '60', '100', '/home/daniell/domains/domain005/user208-mbx002', '5', '214',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('831','416','214','5','user208-mbx002-1','214',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('832','416','214','5','user208-mbx002-2','214',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('215','5','user209', PASSWORD('user209pw'),'user209pw','User 209','U','true','5','206',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('417','215','5','user209-mbx001','user209-mbx001pw', 'user209-mbx001@domain005.com', 'User 209', '60', '60', '100', '/home/daniell/domains/domain005/user209-mbx001', '5', '215',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('833','417','215','5','user209-mbx001-1','215',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('834','417','215','5','user209-mbx001-2','215',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('418','215','5','user209-mbx002','user209-mbx002pw', 'user209-mbx002@domain005.com', 'User 209', '60', '60', '100', '/home/daniell/domains/domain005/user209-mbx002', '5', '215',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('835','418','215','5','user209-mbx002-1','215',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('836','418','215','5','user209-mbx002-2','215',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('216','5','user210', PASSWORD('user210pw'),'user210pw','User 210','U','true','5','206',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('419','216','5','user210-mbx001','user210-mbx001pw', 'user210-mbx001@domain005.com', 'User 210', '60', '60', '100', '/home/daniell/domains/domain005/user210-mbx001', '5', '216',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('837','419','216','5','user210-mbx001-1','216',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('838','419','216','5','user210-mbx001-2','216',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('420','216','5','user210-mbx002','user210-mbx002pw', 'user210-mbx002@domain005.com', 'User 210', '60', '60', '100', '/home/daniell/domains/domain005/user210-mbx002', '5', '216',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('839','420','216','5','user210-mbx002-1','216',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('840','420','216','5','user210-mbx002-2','216',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('217','5','user211', PASSWORD('user211pw'),'user211pw','User 211','U','true','5','206',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('421','217','5','user211-mbx001','user211-mbx001pw', 'user211-mbx001@domain005.com', 'User 211', '60', '60', '100', '/home/daniell/domains/domain005/user211-mbx001', '5', '217',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('841','421','217','5','user211-mbx001-1','217',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('842','421','217','5','user211-mbx001-2','217',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('422','217','5','user211-mbx002','user211-mbx002pw', 'user211-mbx002@domain005.com', 'User 211', '60', '60', '100', '/home/daniell/domains/domain005/user211-mbx002', '5', '217',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('843','422','217','5','user211-mbx002-1','217',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('844','422','217','5','user211-mbx002-2','217',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('218','5','user212', PASSWORD('user212pw'),'user212pw','User 212','U','true','5','206',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('423','218','5','user212-mbx001','user212-mbx001pw', 'user212-mbx001@domain005.com', 'User 212', '60', '60', '100', '/home/daniell/domains/domain005/user212-mbx001', '5', '218',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('845','423','218','5','user212-mbx001-1','218',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('846','423','218','5','user212-mbx001-2','218',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('424','218','5','user212-mbx002','user212-mbx002pw', 'user212-mbx002@domain005.com', 'User 212', '60', '60', '100', '/home/daniell/domains/domain005/user212-mbx002', '5', '218',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('847','424','218','5','user212-mbx002-1','218',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('848','424','218','5','user212-mbx002-2','218',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('219','5','user213', PASSWORD('user213pw'),'user213pw','User 213','U','true','5','206',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('425','219','5','user213-mbx001','user213-mbx001pw', 'user213-mbx001@domain005.com', 'User 213', '60', '60', '100', '/home/daniell/domains/domain005/user213-mbx001', '5', '219',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('849','425','219','5','user213-mbx001-1','219',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('850','425','219','5','user213-mbx001-2','219',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('426','219','5','user213-mbx002','user213-mbx002pw', 'user213-mbx002@domain005.com', 'User 213', '60', '60', '100', '/home/daniell/domains/domain005/user213-mbx002', '5', '219',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('851','426','219','5','user213-mbx002-1','219',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('852','426','219','5','user213-mbx002-2','219',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('220','5','user214', PASSWORD('user214pw'),'user214pw','User 214','U','true','5','206',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('427','220','5','user214-mbx001','user214-mbx001pw', 'user214-mbx001@domain005.com', 'User 214', '60', '60', '100', '/home/daniell/domains/domain005/user214-mbx001', '5', '220',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('853','427','220','5','user214-mbx001-1','220',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('854','427','220','5','user214-mbx001-2','220',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('428','220','5','user214-mbx002','user214-mbx002pw', 'user214-mbx002@domain005.com', 'User 214', '60', '60', '100', '/home/daniell/domains/domain005/user214-mbx002', '5', '220',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('855','428','220','5','user214-mbx002-1','220',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('856','428','220','5','user214-mbx002-2','220',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('221','5','user215', PASSWORD('user215pw'),'user215pw','User 215','U','true','5','206',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('429','221','5','user215-mbx001','user215-mbx001pw', 'user215-mbx001@domain005.com', 'User 215', '60', '60', '100', '/home/daniell/domains/domain005/user215-mbx001', '5', '221',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('857','429','221','5','user215-mbx001-1','221',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('858','429','221','5','user215-mbx001-2','221',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('430','221','5','user215-mbx002','user215-mbx002pw', 'user215-mbx002@domain005.com', 'User 215', '60', '60', '100', '/home/daniell/domains/domain005/user215-mbx002', '5', '221',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('859','430','221','5','user215-mbx002-1','221',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('860','430','221','5','user215-mbx002-2','221',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('222','5','user216', PASSWORD('user216pw'),'user216pw','User 216','U','true','5','206',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('431','222','5','user216-mbx001','user216-mbx001pw', 'user216-mbx001@domain005.com', 'User 216', '60', '60', '100', '/home/daniell/domains/domain005/user216-mbx001', '5', '222',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('861','431','222','5','user216-mbx001-1','222',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('862','431','222','5','user216-mbx001-2','222',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('432','222','5','user216-mbx002','user216-mbx002pw', 'user216-mbx002@domain005.com', 'User 216', '60', '60', '100', '/home/daniell/domains/domain005/user216-mbx002', '5', '222',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('863','432','222','5','user216-mbx002-1','222',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('864','432','222','5','user216-mbx002-2','222',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('223','5','user217', PASSWORD('user217pw'),'user217pw','User 217','U','true','5','206',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('433','223','5','user217-mbx001','user217-mbx001pw', 'user217-mbx001@domain005.com', 'User 217', '60', '60', '100', '/home/daniell/domains/domain005/user217-mbx001', '5', '223',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('865','433','223','5','user217-mbx001-1','223',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('866','433','223','5','user217-mbx001-2','223',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('434','223','5','user217-mbx002','user217-mbx002pw', 'user217-mbx002@domain005.com', 'User 217', '60', '60', '100', '/home/daniell/domains/domain005/user217-mbx002', '5', '223',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('867','434','223','5','user217-mbx002-1','223',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('868','434','223','5','user217-mbx002-2','223',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('224','5','user218', PASSWORD('user218pw'),'user218pw','User 218','U','true','5','206',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('435','224','5','user218-mbx001','user218-mbx001pw', 'user218-mbx001@domain005.com', 'User 218', '60', '60', '100', '/home/daniell/domains/domain005/user218-mbx001', '5', '224',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('869','435','224','5','user218-mbx001-1','224',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('870','435','224','5','user218-mbx001-2','224',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('436','224','5','user218-mbx002','user218-mbx002pw', 'user218-mbx002@domain005.com', 'User 218', '60', '60', '100', '/home/daniell/domains/domain005/user218-mbx002', '5', '224',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('871','436','224','5','user218-mbx002-1','224',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('872','436','224','5','user218-mbx002-2','224',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('225','5','user219', PASSWORD('user219pw'),'user219pw','User 219','U','true','5','206',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('437','225','5','user219-mbx001','user219-mbx001pw', 'user219-mbx001@domain005.com', 'User 219', '60', '60', '100', '/home/daniell/domains/domain005/user219-mbx001', '5', '225',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('873','437','225','5','user219-mbx001-1','225',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('874','437','225','5','user219-mbx001-2','225',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('438','225','5','user219-mbx002','user219-mbx002pw', 'user219-mbx002@domain005.com', 'User 219', '60', '60', '100', '/home/daniell/domains/domain005/user219-mbx002', '5', '225',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('875','438','225','5','user219-mbx002-1','225',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('876','438','225','5','user219-mbx002-2','225',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('226','5','user220', PASSWORD('user220pw'),'user220pw','User 220','U','true','5','206',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('439','226','5','user220-mbx001','user220-mbx001pw', 'user220-mbx001@domain005.com', 'User 220', '60', '60', '100', '/home/daniell/domains/domain005/user220-mbx001', '5', '226',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('877','439','226','5','user220-mbx001-1','226',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('878','439','226','5','user220-mbx001-2','226',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('440','226','5','user220-mbx002','user220-mbx002pw', 'user220-mbx002@domain005.com', 'User 220', '60', '60', '100', '/home/daniell/domains/domain005/user220-mbx002', '5', '226',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('879','440','226','5','user220-mbx002-1','226',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('880','440','226','5','user220-mbx002-2','226',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('227','5','user221', PASSWORD('user221pw'),'user221pw','User 221','U','true','5','206',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('441','227','5','user221-mbx001','user221-mbx001pw', 'user221-mbx001@domain005.com', 'User 221', '60', '60', '100', '/home/daniell/domains/domain005/user221-mbx001', '5', '227',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('881','441','227','5','user221-mbx001-1','227',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('882','441','227','5','user221-mbx001-2','227',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('442','227','5','user221-mbx002','user221-mbx002pw', 'user221-mbx002@domain005.com', 'User 221', '60', '60', '100', '/home/daniell/domains/domain005/user221-mbx002', '5', '227',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('883','442','227','5','user221-mbx002-1','227',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('884','442','227','5','user221-mbx002-2','227',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('228','5','user222', PASSWORD('user222pw'),'user222pw','User 222','U','true','5','206',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('443','228','5','user222-mbx001','user222-mbx001pw', 'user222-mbx001@domain005.com', 'User 222', '60', '60', '100', '/home/daniell/domains/domain005/user222-mbx001', '5', '228',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('885','443','228','5','user222-mbx001-1','228',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('886','443','228','5','user222-mbx001-2','228',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('444','228','5','user222-mbx002','user222-mbx002pw', 'user222-mbx002@domain005.com', 'User 222', '60', '60', '100', '/home/daniell/domains/domain005/user222-mbx002', '5', '228',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('887','444','228','5','user222-mbx002-1','228',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('888','444','228','5','user222-mbx002-2','228',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('229','5','user223', PASSWORD('user223pw'),'user223pw','User 223','U','true','5','206',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('445','229','5','user223-mbx001','user223-mbx001pw', 'user223-mbx001@domain005.com', 'User 223', '60', '60', '100', '/home/daniell/domains/domain005/user223-mbx001', '5', '229',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('889','445','229','5','user223-mbx001-1','229',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('890','445','229','5','user223-mbx001-2','229',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('446','229','5','user223-mbx002','user223-mbx002pw', 'user223-mbx002@domain005.com', 'User 223', '60', '60', '100', '/home/daniell/domains/domain005/user223-mbx002', '5', '229',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('891','446','229','5','user223-mbx002-1','229',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('892','446','229','5','user223-mbx002-2','229',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('230','5','user224', PASSWORD('user224pw'),'user224pw','User 224','U','true','5','206',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('447','230','5','user224-mbx001','user224-mbx001pw', 'user224-mbx001@domain005.com', 'User 224', '60', '60', '100', '/home/daniell/domains/domain005/user224-mbx001', '5', '230',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('893','447','230','5','user224-mbx001-1','230',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('894','447','230','5','user224-mbx001-2','230',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('448','230','5','user224-mbx002','user224-mbx002pw', 'user224-mbx002@domain005.com', 'User 224', '60', '60', '100', '/home/daniell/domains/domain005/user224-mbx002', '5', '230',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('895','448','230','5','user224-mbx002-1','230',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('896','448','230','5','user224-mbx002-2','230',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('231','5','user225', PASSWORD('user225pw'),'user225pw','User 225','U','true','5','206',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('449','231','5','user225-mbx001','user225-mbx001pw', 'user225-mbx001@domain005.com', 'User 225', '60', '60', '100', '/home/daniell/domains/domain005/user225-mbx001', '5', '231',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('897','449','231','5','user225-mbx001-1','231',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('898','449','231','5','user225-mbx001-2','231',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('450','231','5','user225-mbx002','user225-mbx002pw', 'user225-mbx002@domain005.com', 'User 225', '60', '60', '100', '/home/daniell/domains/domain005/user225-mbx002', '5', '231',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('899','450','231','5','user225-mbx002-1','231',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('900','450','231','5','user225-mbx002-2','231',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('232','5','user226', PASSWORD('user226pw'),'user226pw','User 226','U','true','5','206',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('451','232','5','user226-mbx001','user226-mbx001pw', 'user226-mbx001@domain005.com', 'User 226', '60', '60', '100', '/home/daniell/domains/domain005/user226-mbx001', '5', '232',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('901','451','232','5','user226-mbx001-1','232',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('902','451','232','5','user226-mbx001-2','232',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('452','232','5','user226-mbx002','user226-mbx002pw', 'user226-mbx002@domain005.com', 'User 226', '60', '60', '100', '/home/daniell/domains/domain005/user226-mbx002', '5', '232',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('903','452','232','5','user226-mbx002-1','232',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('904','452','232','5','user226-mbx002-2','232',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('233','5','user227', PASSWORD('user227pw'),'user227pw','User 227','U','true','5','206',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('453','233','5','user227-mbx001','user227-mbx001pw', 'user227-mbx001@domain005.com', 'User 227', '60', '60', '100', '/home/daniell/domains/domain005/user227-mbx001', '5', '233',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('905','453','233','5','user227-mbx001-1','233',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('906','453','233','5','user227-mbx001-2','233',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('454','233','5','user227-mbx002','user227-mbx002pw', 'user227-mbx002@domain005.com', 'User 227', '60', '60', '100', '/home/daniell/domains/domain005/user227-mbx002', '5', '233',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('907','454','233','5','user227-mbx002-1','233',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('908','454','233','5','user227-mbx002-2','233',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('234','5','user228', PASSWORD('user228pw'),'user228pw','User 228','U','true','5','206',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('455','234','5','user228-mbx001','user228-mbx001pw', 'user228-mbx001@domain005.com', 'User 228', '60', '60', '100', '/home/daniell/domains/domain005/user228-mbx001', '5', '234',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('909','455','234','5','user228-mbx001-1','234',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('910','455','234','5','user228-mbx001-2','234',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('456','234','5','user228-mbx002','user228-mbx002pw', 'user228-mbx002@domain005.com', 'User 228', '60', '60', '100', '/home/daniell/domains/domain005/user228-mbx002', '5', '234',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('911','456','234','5','user228-mbx002-1','234',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('912','456','234','5','user228-mbx002-2','234',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('235','5','user229', PASSWORD('user229pw'),'user229pw','User 229','U','true','5','206',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('457','235','5','user229-mbx001','user229-mbx001pw', 'user229-mbx001@domain005.com', 'User 229', '60', '60', '100', '/home/daniell/domains/domain005/user229-mbx001', '5', '235',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('913','457','235','5','user229-mbx001-1','235',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('914','457','235','5','user229-mbx001-2','235',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('458','235','5','user229-mbx002','user229-mbx002pw', 'user229-mbx002@domain005.com', 'User 229', '60', '60', '100', '/home/daniell/domains/domain005/user229-mbx002', '5', '235',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('915','458','235','5','user229-mbx002-1','235',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('916','458','235','5','user229-mbx002-2','235',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('236','5','user230', PASSWORD('user230pw'),'user230pw','User 230','U','true','5','206',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('459','236','5','user230-mbx001','user230-mbx001pw', 'user230-mbx001@domain005.com', 'User 230', '60', '60', '100', '/home/daniell/domains/domain005/user230-mbx001', '5', '236',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('917','459','236','5','user230-mbx001-1','236',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('918','459','236','5','user230-mbx001-2','236',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('460','236','5','user230-mbx002','user230-mbx002pw', 'user230-mbx002@domain005.com', 'User 230', '60', '60', '100', '/home/daniell/domains/domain005/user230-mbx002', '5', '236',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('919','460','236','5','user230-mbx002-1','236',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('920','460','236','5','user230-mbx002-2','236',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('237','5','user231', PASSWORD('user231pw'),'user231pw','User 231','U','true','5','206',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('461','237','5','user231-mbx001','user231-mbx001pw', 'user231-mbx001@domain005.com', 'User 231', '60', '60', '100', '/home/daniell/domains/domain005/user231-mbx001', '5', '237',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('921','461','237','5','user231-mbx001-1','237',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('922','461','237','5','user231-mbx001-2','237',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('462','237','5','user231-mbx002','user231-mbx002pw', 'user231-mbx002@domain005.com', 'User 231', '60', '60', '100', '/home/daniell/domains/domain005/user231-mbx002', '5', '237',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('923','462','237','5','user231-mbx002-1','237',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('924','462','237','5','user231-mbx002-2','237',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('238','5','user232', PASSWORD('user232pw'),'user232pw','User 232','U','true','5','206',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('463','238','5','user232-mbx001','user232-mbx001pw', 'user232-mbx001@domain005.com', 'User 232', '60', '60', '100', '/home/daniell/domains/domain005/user232-mbx001', '5', '238',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('925','463','238','5','user232-mbx001-1','238',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('926','463','238','5','user232-mbx001-2','238',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('464','238','5','user232-mbx002','user232-mbx002pw', 'user232-mbx002@domain005.com', 'User 232', '60', '60', '100', '/home/daniell/domains/domain005/user232-mbx002', '5', '238',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('927','464','238','5','user232-mbx002-1','238',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('928','464','238','5','user232-mbx002-2','238',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('239','5','user233', PASSWORD('user233pw'),'user233pw','User 233','U','true','5','206',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('465','239','5','user233-mbx001','user233-mbx001pw', 'user233-mbx001@domain005.com', 'User 233', '60', '60', '100', '/home/daniell/domains/domain005/user233-mbx001', '5', '239',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('929','465','239','5','user233-mbx001-1','239',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('930','465','239','5','user233-mbx001-2','239',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('466','239','5','user233-mbx002','user233-mbx002pw', 'user233-mbx002@domain005.com', 'User 233', '60', '60', '100', '/home/daniell/domains/domain005/user233-mbx002', '5', '239',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('931','466','239','5','user233-mbx002-1','239',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('932','466','239','5','user233-mbx002-2','239',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('240','5','user234', PASSWORD('user234pw'),'user234pw','User 234','U','true','5','206',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('467','240','5','user234-mbx001','user234-mbx001pw', 'user234-mbx001@domain005.com', 'User 234', '60', '60', '100', '/home/daniell/domains/domain005/user234-mbx001', '5', '240',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('933','467','240','5','user234-mbx001-1','240',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('934','467','240','5','user234-mbx001-2','240',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('468','240','5','user234-mbx002','user234-mbx002pw', 'user234-mbx002@domain005.com', 'User 234', '60', '60', '100', '/home/daniell/domains/domain005/user234-mbx002', '5', '240',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('935','468','240','5','user234-mbx002-1','240',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('936','468','240','5','user234-mbx002-2','240',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('241','5','user235', PASSWORD('user235pw'),'user235pw','User 235','U','true','5','206',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('469','241','5','user235-mbx001','user235-mbx001pw', 'user235-mbx001@domain005.com', 'User 235', '60', '60', '100', '/home/daniell/domains/domain005/user235-mbx001', '5', '241',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('937','469','241','5','user235-mbx001-1','241',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('938','469','241','5','user235-mbx001-2','241',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('470','241','5','user235-mbx002','user235-mbx002pw', 'user235-mbx002@domain005.com', 'User 235', '60', '60', '100', '/home/daniell/domains/domain005/user235-mbx002', '5', '241',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('939','470','241','5','user235-mbx002-1','241',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('940','470','241','5','user235-mbx002-2','241',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('242','5','user236', PASSWORD('user236pw'),'user236pw','User 236','U','true','5','206',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('471','242','5','user236-mbx001','user236-mbx001pw', 'user236-mbx001@domain005.com', 'User 236', '60', '60', '100', '/home/daniell/domains/domain005/user236-mbx001', '5', '242',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('941','471','242','5','user236-mbx001-1','242',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('942','471','242','5','user236-mbx001-2','242',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('472','242','5','user236-mbx002','user236-mbx002pw', 'user236-mbx002@domain005.com', 'User 236', '60', '60', '100', '/home/daniell/domains/domain005/user236-mbx002', '5', '242',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('943','472','242','5','user236-mbx002-1','242',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('944','472','242','5','user236-mbx002-2','242',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('243','5','user237', PASSWORD('user237pw'),'user237pw','User 237','U','true','5','206',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('473','243','5','user237-mbx001','user237-mbx001pw', 'user237-mbx001@domain005.com', 'User 237', '60', '60', '100', '/home/daniell/domains/domain005/user237-mbx001', '5', '243',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('945','473','243','5','user237-mbx001-1','243',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('946','473','243','5','user237-mbx001-2','243',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('474','243','5','user237-mbx002','user237-mbx002pw', 'user237-mbx002@domain005.com', 'User 237', '60', '60', '100', '/home/daniell/domains/domain005/user237-mbx002', '5', '243',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('947','474','243','5','user237-mbx002-1','243',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('948','474','243','5','user237-mbx002-2','243',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('244','5','user238', PASSWORD('user238pw'),'user238pw','User 238','U','true','5','206',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('475','244','5','user238-mbx001','user238-mbx001pw', 'user238-mbx001@domain005.com', 'User 238', '60', '60', '100', '/home/daniell/domains/domain005/user238-mbx001', '5', '244',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('949','475','244','5','user238-mbx001-1','244',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('950','475','244','5','user238-mbx001-2','244',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('476','244','5','user238-mbx002','user238-mbx002pw', 'user238-mbx002@domain005.com', 'User 238', '60', '60', '100', '/home/daniell/domains/domain005/user238-mbx002', '5', '244',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('951','476','244','5','user238-mbx002-1','244',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('952','476','244','5','user238-mbx002-2','244',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('245','5','user239', PASSWORD('user239pw'),'user239pw','User 239','U','true','5','206',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('477','245','5','user239-mbx001','user239-mbx001pw', 'user239-mbx001@domain005.com', 'User 239', '60', '60', '100', '/home/daniell/domains/domain005/user239-mbx001', '5', '245',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('953','477','245','5','user239-mbx001-1','245',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('954','477','245','5','user239-mbx001-2','245',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('478','245','5','user239-mbx002','user239-mbx002pw', 'user239-mbx002@domain005.com', 'User 239', '60', '60', '100', '/home/daniell/domains/domain005/user239-mbx002', '5', '245',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('955','478','245','5','user239-mbx002-1','245',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('956','478','245','5','user239-mbx002-2','245',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('246','5','user240', PASSWORD('user240pw'),'user240pw','User 240','U','true','5','206',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('479','246','5','user240-mbx001','user240-mbx001pw', 'user240-mbx001@domain005.com', 'User 240', '60', '60', '100', '/home/daniell/domains/domain005/user240-mbx001', '5', '246',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('957','479','246','5','user240-mbx001-1','246',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('958','479','246','5','user240-mbx001-2','246',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('480','246','5','user240-mbx002','user240-mbx002pw', 'user240-mbx002@domain005.com', 'User 240', '60', '60', '100', '/home/daniell/domains/domain005/user240-mbx002', '5', '246',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('959','480','246','5','user240-mbx002-1','246',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('960','480','246','5','user240-mbx002-2','246',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('247','5','user241', PASSWORD('user241pw'),'user241pw','User 241','U','true','5','206',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('481','247','5','user241-mbx001','user241-mbx001pw', 'user241-mbx001@domain005.com', 'User 241', '60', '60', '100', '/home/daniell/domains/domain005/user241-mbx001', '5', '247',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('961','481','247','5','user241-mbx001-1','247',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('962','481','247','5','user241-mbx001-2','247',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('482','247','5','user241-mbx002','user241-mbx002pw', 'user241-mbx002@domain005.com', 'User 241', '60', '60', '100', '/home/daniell/domains/domain005/user241-mbx002', '5', '247',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('963','482','247','5','user241-mbx002-1','247',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('964','482','247','5','user241-mbx002-2','247',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('248','5','user242', PASSWORD('user242pw'),'user242pw','User 242','U','true','5','206',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('483','248','5','user242-mbx001','user242-mbx001pw', 'user242-mbx001@domain005.com', 'User 242', '60', '60', '100', '/home/daniell/domains/domain005/user242-mbx001', '5', '248',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('965','483','248','5','user242-mbx001-1','248',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('966','483','248','5','user242-mbx001-2','248',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('484','248','5','user242-mbx002','user242-mbx002pw', 'user242-mbx002@domain005.com', 'User 242', '60', '60', '100', '/home/daniell/domains/domain005/user242-mbx002', '5', '248',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('967','484','248','5','user242-mbx002-1','248',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('968','484','248','5','user242-mbx002-2','248',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('249','5','user243', PASSWORD('user243pw'),'user243pw','User 243','U','true','5','206',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('485','249','5','user243-mbx001','user243-mbx001pw', 'user243-mbx001@domain005.com', 'User 243', '60', '60', '100', '/home/daniell/domains/domain005/user243-mbx001', '5', '249',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('969','485','249','5','user243-mbx001-1','249',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('970','485','249','5','user243-mbx001-2','249',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('486','249','5','user243-mbx002','user243-mbx002pw', 'user243-mbx002@domain005.com', 'User 243', '60', '60', '100', '/home/daniell/domains/domain005/user243-mbx002', '5', '249',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('971','486','249','5','user243-mbx002-1','249',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('972','486','249','5','user243-mbx002-2','249',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('250','5','user244', PASSWORD('user244pw'),'user244pw','User 244','U','true','5','206',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('487','250','5','user244-mbx001','user244-mbx001pw', 'user244-mbx001@domain005.com', 'User 244', '60', '60', '100', '/home/daniell/domains/domain005/user244-mbx001', '5', '250',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('973','487','250','5','user244-mbx001-1','250',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('974','487','250','5','user244-mbx001-2','250',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('488','250','5','user244-mbx002','user244-mbx002pw', 'user244-mbx002@domain005.com', 'User 244', '60', '60', '100', '/home/daniell/domains/domain005/user244-mbx002', '5', '250',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('975','488','250','5','user244-mbx002-1','250',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('976','488','250','5','user244-mbx002-2','250',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('251','5','user245', PASSWORD('user245pw'),'user245pw','User 245','U','true','5','206',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('489','251','5','user245-mbx001','user245-mbx001pw', 'user245-mbx001@domain005.com', 'User 245', '60', '60', '100', '/home/daniell/domains/domain005/user245-mbx001', '5', '251',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('977','489','251','5','user245-mbx001-1','251',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('978','489','251','5','user245-mbx001-2','251',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('490','251','5','user245-mbx002','user245-mbx002pw', 'user245-mbx002@domain005.com', 'User 245', '60', '60', '100', '/home/daniell/domains/domain005/user245-mbx002', '5', '251',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('979','490','251','5','user245-mbx002-1','251',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('980','490','251','5','user245-mbx002-2','251',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('252','5','user246', PASSWORD('user246pw'),'user246pw','User 246','U','true','5','206',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('491','252','5','user246-mbx001','user246-mbx001pw', 'user246-mbx001@domain005.com', 'User 246', '60', '60', '100', '/home/daniell/domains/domain005/user246-mbx001', '5', '252',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('981','491','252','5','user246-mbx001-1','252',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('982','491','252','5','user246-mbx001-2','252',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('492','252','5','user246-mbx002','user246-mbx002pw', 'user246-mbx002@domain005.com', 'User 246', '60', '60', '100', '/home/daniell/domains/domain005/user246-mbx002', '5', '252',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('983','492','252','5','user246-mbx002-1','252',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('984','492','252','5','user246-mbx002-2','252',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('253','5','user247', PASSWORD('user247pw'),'user247pw','User 247','U','true','5','206',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('493','253','5','user247-mbx001','user247-mbx001pw', 'user247-mbx001@domain005.com', 'User 247', '60', '60', '100', '/home/daniell/domains/domain005/user247-mbx001', '5', '253',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('985','493','253','5','user247-mbx001-1','253',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('986','493','253','5','user247-mbx001-2','253',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('494','253','5','user247-mbx002','user247-mbx002pw', 'user247-mbx002@domain005.com', 'User 247', '60', '60', '100', '/home/daniell/domains/domain005/user247-mbx002', '5', '253',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('987','494','253','5','user247-mbx002-1','253',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('988','494','253','5','user247-mbx002-2','253',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('254','5','user248', PASSWORD('user248pw'),'user248pw','User 248','U','true','5','206',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('495','254','5','user248-mbx001','user248-mbx001pw', 'user248-mbx001@domain005.com', 'User 248', '60', '60', '100', '/home/daniell/domains/domain005/user248-mbx001', '5', '254',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('989','495','254','5','user248-mbx001-1','254',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('990','495','254','5','user248-mbx001-2','254',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('496','254','5','user248-mbx002','user248-mbx002pw', 'user248-mbx002@domain005.com', 'User 248', '60', '60', '100', '/home/daniell/domains/domain005/user248-mbx002', '5', '254',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('991','496','254','5','user248-mbx002-1','254',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('992','496','254','5','user248-mbx002-2','254',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('255','5','user249', PASSWORD('user249pw'),'user249pw','User 249','U','true','5','206',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('497','255','5','user249-mbx001','user249-mbx001pw', 'user249-mbx001@domain005.com', 'User 249', '60', '60', '100', '/home/daniell/domains/domain005/user249-mbx001', '5', '255',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('993','497','255','5','user249-mbx001-1','255',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('994','497','255','5','user249-mbx001-2','255',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('498','255','5','user249-mbx002','user249-mbx002pw', 'user249-mbx002@domain005.com', 'User 249', '60', '60', '100', '/home/daniell/domains/domain005/user249-mbx002', '5', '255',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('995','498','255','5','user249-mbx002-1','255',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('996','498','255','5','user249-mbx002-2','255',NOW());

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,MailboxLimit,EditBy,EditWhen)
VALUES
('256','5','user250', PASSWORD('user250pw'),'user250pw','User 250','U','true','5','206',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('499','256','5','user250-mbx001','user250-mbx001pw', 'user250-mbx001@domain005.com', 'User 250', '60', '60', '100', '/home/daniell/domains/domain005/user250-mbx001', '5', '256',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('997','499','256','5','user250-mbx001-1','256',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('998','499','256','5','user250-mbx001-2','256',NOW());

INSERT INTO Mail
(MailboxId,AccountId,DomainId,MailboxName,ClearPass,UserName,FullName,Uid,Gid,Quota,Home,AliasLimit,EditBy,EditWhen)
VALUES
('500','256','5','user250-mbx002','user250-mbx002pw', 'user250-mbx002@domain005.com', 'User 250', '60', '60', '100', '/home/daniell/domains/domain005/user250-mbx002', '5', '256',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('999','500','256','5','user250-mbx002-1','256',NOW());

INSERT INTO Aliases
(AliasId,MailboxId,AccountId,DomainId,Alias,EditBy,EditWhen)
VALUES
('1000','500','256','5','user250-mbx002-2','256',NOW());


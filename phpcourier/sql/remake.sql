use phpcourier;

DROP TABLE IF EXISTS Domains;
DROP TABLE IF EXISTS DomainAccess;
DROP TABLE IF EXISTS Accounts;
DROP TABLE IF EXISTS Forwards;
DROP TABLE IF EXISTS Mail;
DROP TABLE IF EXISTS Aliases;
DROP TABLE IF EXISTS UpdateTime;
DROP TABLE IF EXISTS Sessions;

CREATE TABLE Domains
(
	DomainId		INT NOT NULL AUTO_INCREMENT,
	DomainName		VARCHAR(100) NOT NULL,
	Uid				INT,
	Gid				INT,
	Directory		VARCHAR(255),
	Quota			VARCHAR(50),
	MailboxLimit	INT,
	AliasLimit		INT,
	PrimaryDomain		enum('true', 'false'),
	EditBy			INT,
	EditWhen		DATETIME,

	PRIMARY KEY (DomainId),
	UNIQUE KEY DomainName (DomainName)
);

CREATE TABLE Accounts
(
	AccountId		INT NOT NULL AUTO_INCREMENT,
	DomainId		INT NOT NULL,
	AccountName		VARCHAR(255) NOT NULL,
	CryptPass		VARCHAR(50) NOT NULL,
	ClearPass		VARCHAR(50) NOT NULL,
	OldPass			VARCHAR(50),
	FullName		VARCHAR(255),
	PhoneNumber		VARCHAR(50),
	CompanyName		VARCHAR(255),
	AdminNotes		BLOB,	
	UserNotes		BLOB,
	AccountType		enum ('M','A','U'),
	MailboxLimit	INT NOT NULL,
	Active			enum ('true','false'),
	EditBy			INT,
	EditWhen		DATETIME,

	PRIMARY KEY (AccountId),
	UNIQUE KEY AccountName (AccountName)
);

CREATE TABLE DomainAccess
(
	AccountId		INT NOT NULL,
	DomainId		INT NOT NULL,
	
	PRIMARY KEY (AccountId, DomainId)
);

CREATE TABLE Mail
(
	MailboxId		INT NOT NULL AUTO_INCREMENT,
	AccountId		INT NOT NULL,
	DomainId		INT NOT NULL,
	MailboxName		VARCHAR(100) NOT NULL,
	AliasLimit		INT NOT NULL,

	UserName		VARCHAR(100) NOT NULL,
	FullName		VARCHAR(255) NOT NULL,
	CryptPass		VARCHAR(50) NOT NULL,
	ClearPass		VARCHAR(50) NOT NULL,
	OldPass			VARCHAR(50),
	Uid				INT NOT NULL,
	Gid				INT NOT NULL,
	Home			VARCHAR(255),
	Quota			VARCHAR(50),

	EditBy			INT,
	EditWhen		DATETIME,

	PRIMARY KEY (MailboxId),
	UNIQUE KEY UserName (DomainId, MailboxName)
);

CREATE TABLE Aliases
(
	AliasId			INT NOT NULL AUTO_INCREMENT,
	MailboxId		INT NOT NULL,
	AccountId		INT NOT NULL,
	DomainId		INT NOT NULL,
	Alias			VARCHAR(50) NOT NULL,
	EditBy			INT,
	EditWhen		DATETIME,

	PRIMARY KEY (AliasId),
	UNIQUE KEY Alias (DomainId, Alias)
);

CREATE TABLE Forwards
(
	ForwardId		INT NOT NULL AUTO_INCREMENT,
	AccountId		INT NOT NULL,
	DomainId		INT NOT NULL,
	FromAddress		VARCHAR(100),
	ToAddress		VARCHAR(100),
	EditBy			INT,
	EditWhen		DATETIME,

	PRIMARY KEY (ForwardId)
);

CREATE TABLE UpdateTime
(
	AliasExtractTime		DATETIME,
	AliasUpdateTime			DATETIME,
	DomainExtractTime		DATETIME,
	DomainUpdateTime		DATETIME
);

CREATE TABLE Sessions
(
	SessionKey		CHAR(32) NOT NULL PRIMARY KEY,
	AccountId		INT NOT NULL,
	AccountName		VARCHAR(25),
	AccountType		enum ('M','A','U'),
	DomainId		INT,
	Expiration		INT
);

INSERT INTO Accounts
(AccountId,DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,EditBy,EditWhen)
VALUES
('1','0','root', PASSWORD('pisvs4'),'pisvs4','Root Administrator','M','true','1',NOW());

INSERT INTO UpdateTime (AliasExtractTime, AliasUpdateTime, DomainUpdateTime, DomainExtractTime) VALUES (NOW(),NOW(),NOW(),NOW());

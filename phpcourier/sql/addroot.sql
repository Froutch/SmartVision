use phpcourier;

INSERT INTO Accounts
(DomainId,AccountName,CryptPass,ClearPass,FullName,AccountType,Active,EditBy,EditWhen)
VALUES
('0','root', PASSWORD('pisvs4'),'pisvs4','Talon Root Administrator','M','true','1',NOW());

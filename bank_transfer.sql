-- Create two sample bank accounts and transfer $20 between them. 

CREATE TABLE accounts (
  account_id INT PRIMARY KEY,
  balance DECIMAL(10,2)
);

INSERT INTO accounts (account_id, balance)
VALUES (1, 100.00), (2, 50.00);

--Move $20 from account 1 to account 2.
BEGIN TRANSACTION;

UPDATE accounts
SET balance = balance - 20 
WHERE account_id = 1;

UPDATE accounts
SET balance = balance + 20
WHERE account_id = 2;

COMMIT;

--Show the balances after the transfer.
SELECT * FROM accounts;

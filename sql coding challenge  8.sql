USE company_triggers_transactions;

--  Create base tables

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName VARCHAR(100),
    ProductName VARCHAR(100),
    Amount DECIMAL(10,2),
    OrderDate DATE
);

CREATE TABLE Order_History (
    HistoryID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    CustomerName VARCHAR(100),
    ProductName VARCHAR(100),
    Amount DECIMAL(10,2),
    OrderDate DATE,
    DeletedOn TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


INSERT INTO Orders (CustomerName, ProductName, Amount, OrderDate) VALUES
('anu', 'Laptop', 75000, '2024-12-10'),
('Bavi', 'Keyboard', 2500, '2024-12-12'),
('karthi', 'Mouse', 1200, '2024-12-14');

DELIMITER $$

CREATE TRIGGER after_order_delete
AFTER DELETE ON Orders
FOR EACH ROW
BEGIN
    INSERT INTO Order_History (OrderID, CustomerName, ProductName, Amount, OrderDate)
    VALUES (OLD.OrderID, OLD.CustomerName, OLD.ProductName, OLD.Amount, OLD.OrderDate);
END $$

DELIMITER ;


DELETE FROM Orders WHERE OrderID = 2;


SELECT * FROM Order_History;

CREATE USER IF NOT EXISTS 'junior_analyst'@'localhost' IDENTIFIED BY 'password123';


GRANT SELECT ON company_triggers_transactions.* TO 'junior_analyst'@'localhost';

SHOW GRANTS FOR 'junior_analyst'@'localhost';


CREATE TABLE BankAccounts (
    AccountID INT PRIMARY KEY AUTO_INCREMENT,
    AccountHolder VARCHAR(100),
    Balance DECIMAL(10,2)
);

INSERT INTO BankAccounts (AccountHolder, Balance) VALUES
('david', 10000.00),
('alice', 5000.00);


SET SQL_SAFE_UPDATES = 0;


UPDATE BankAccounts
SET Balance = Balance - 2000
WHERE AccountHolder = 'david';

SET SQL_SAFE_UPDATES = 1;

SET SQL_SAFE_UPDATES = 0;


UPDATE BankAccounts
SET Balance = Balance + 2000
WHERE AccountHolder = 'Mary';

SET SQL_SAFE_UPDATES = 1;

-- Use SAVEPOINT for testing
SAVEPOINT before_check;

-- Check balances (simulate issue)
SELECT * FROM BankAccounts;

-- If everything is fine:
COMMIT;

-- If there’s any issue, use:
-- ROLLBACK TO before_check;

-- Verify final data
SELECT * FROM BankAccounts;
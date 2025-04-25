-- Create Performance table
CREATE TABLE Performance (
    SellerID INT,
    Month VARCHAR(20),
    SalesAmount DECIMAL(10, 2)
);

-- Insert 50 sample records
INSERT INTO Performance (SellerID, Month, SalesAmount) VALUES
(1, 'January', 1200.50),
(1, 'February', 1350.00),
(1, 'March', 1600.75),
(1, 'April', 1100.00),
(1, 'May', 1700.25),
(1, 'June', 1900.40),

(2, 'January', 800.00),
(2, 'February', 950.00),
(2, 'March', 990.25),
(2, 'April', 1000.00),
(2, 'May', 1050.60),
(2, 'June', 1100.00),

(3, 'January', 1500.00),
(3, 'February', 1580.90),
(3, 'March', 1400.00),
(3, 'April', 1600.75),
(3, 'May', 1700.00),
(3, 'June', 1650.25),

(4, 'January', 700.00),
(4, 'February', 850.50),
(4, 'March', 900.00),
(4, 'April', 950.75),
(4, 'May', 980.00),
(4, 'June', 1000.00),

(5, 'January', 1300.30),
(5, 'February', 1350.40),
(5, 'March', 1200.00),
(5, 'April', 1400.00),
(5, 'May', 1550.00),
(5, 'June', 1600.00),

(6, 'January', 1100.00),
(6, 'February', 1000.50),
(6, 'March', 1250.75),
(6, 'April', 1350.60),
(6, 'May', 1450.20),
(6, 'June', 1600.90),

(7, 'January', 900.40),
(7, 'February', 980.10);

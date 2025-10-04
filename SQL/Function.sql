-- functions.sql
DELIMITER $$
CREATE FUNCTION total_spent(p_customer_id INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
  DECLARE v_total DECIMAL(10,2) DEFAULT 0.00;
  SELECT IFNULL(SUM(Amount),0) INTO v_total
    FROM Orders
    WHERE CustomerID = p_customer_id;
  RETURN v_total;
END $$
DELIMITER ;



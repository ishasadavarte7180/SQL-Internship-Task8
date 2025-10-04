-- procedures.sql
DELIMITER $$
CREATE PROCEDURE add_order(
  IN p_customer_id INT,
  IN p_amount DECIMAL(10,2),
  OUT p_order_id INT
)
BEGIN
  DECLARE v_exists INT DEFAULT 0;

  -- check customer exists
  SELECT COUNT(*) INTO v_exists FROM Customers WHERE CustomerID = p_customer_id;

  IF v_exists = 0 THEN
    -- raise an error if customer not found
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Customer does not exist';
  ELSE
    INSERT INTO Orders (CustomerID, Amount) VALUES (p_customer_id, p_amount);
    SET p_order_id = LAST_INSERT_ID();
  END IF;
END $$
DELIMITER ;

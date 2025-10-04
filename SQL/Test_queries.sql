USE ShopDB;

-- 1) Call procedure to add order for customer 1
CALL add_order(1, 150.75, @new_order_id);
SELECT @new_order_id AS inserted_order_id;

-- 2) Call function to get total spent
SELECT total_spent(1) AS customer1_total;

-- 3) Show orders
SELECT * FROM Orders WHERE CustomerID = 1;

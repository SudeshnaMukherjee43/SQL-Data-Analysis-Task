-- =================================================
-- TASK 3: SQL DATA ANALYSIS DELIVERABLE
-- Objective: Analyze E-commerce database patterns
-- =================================================

-- 1. JOINS & AGGREGATE FUNCTIONS
-- Calculates total revenue per customer
SELECT u.user_name, SUM(o.total_amount) AS total_spent
FROM Users u
JOIN Orders o ON u.user_id = o.user_id
GROUP BY u.user_name;

-- 2. WHERE & ORDER BY
-- Identifies high-value transactions over 500
SELECT * FROM Orders 
WHERE total_amount > 500 
ORDER BY total_amount DESC;

-- 3. SUBQUERIES
-- Finds users whose spending is above the platform average
SELECT user_name 
FROM Users 
WHERE user_id IN (
    SELECT user_id 
    FROM Orders 
    WHERE total_amount > (SELECT AVG(total_amount) FROM Orders)
);

-- 4. VIEWS
-- Pulling data from the created 'User_Report' view
SELECT * FROM User_Report;

-- 5. INDEXING (Optimization)
-- Created to speed up lookups on the foreign key
CREATE INDEX idx_user_id ON Orders(user_id);
USE node_mysql_app; 

SELECT * FROM USERS; 

-- 1. What is the earliest date a user joined
SELECT DATE_FORMAT(created_at, '%M %D, %Y') FROM users
ORDER BY created_at DESC
LIMIT 1; 

-- 2. Find the Email of the First (Earliest) User
SELECT email, DATE_FORMAT(created_at, '%M %D, %Y')
FROM users
ORDER BY created_at
LIMIT 1;  

SELECT email, DATE_FORMAT(created_at, '%M %D, %Y')
FROM users WHERE created_at = (SELECT MIN(created_at) FROM users);

-- 3. Users According to the Month they Joined
SELECT DATE_FORMAT(created_at, '%M') AS month_, count(*) AS count_
FROM users
GROUP BY month_
ORDER BY count_ DESC;

-- 4. Count number of users with yahoo emails
SELECT count(*) AS yahoo_users FROM users
WHERE email LIKE '%@yahoo.com%';

-- 5 Calculate Total Number of Users for each email host
USE node_mysql_app; 
SELECT 
    CASE
        WHEN email LIKE '%@gmail.com%' THEN 'gmail'
        WHEN email LIKE '%@yahoo.com%' THEN 'yahoo'
        WHEN email LIKE '%@hotmail.com%' THEN 'hotmail'
        ELSE 'other'
    END AS provider,
    COUNT(*) AS total_users
FROM users
GROUP BY provider
ORDER BY total_users DESC;


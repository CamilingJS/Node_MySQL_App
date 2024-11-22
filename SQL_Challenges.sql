USE node_mysql_app; 

SELECT * FROM USERS; 

-- Business Problem: A manager on the marketing team comes to you to ask about the performance of their recent email campaign. They want to know how many users have clicked the link in the email. You decide to calculate the distribution of the number of email link clicks per user. 
WITH email_link_clicks AS (
    SELECT
        Count(*) as num_link_clicks,
        UserID
    FROM FrontendEventLog el
    WHERE 
        EventID = 5
    GROUP BY
        UserID
)

SELECT
    num_link_clicks,
    Count(*) AS Num_Users
FROM email_link_clicks
GROUP BY num_link_clicks;

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


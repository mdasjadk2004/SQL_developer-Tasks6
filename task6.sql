--total number of post from user_id=1 using sub scaler query.
SELECT username,
       (SELECT COUNT(*) FROM posts WHERE user_id = users.user_id) AS total_posts
FROM users
WHERE user_id = 1;
-------Using exist---------------------------------------------------
SELECT u.user_id, u.username
FROM users u
WHERE EXISTS (
    SELECT 1
    FROM posts p
    WHERE p.user_id = u.user_id
      AND p.post_id > (
          SELECT MAX(i.post_id)
          FROM interactions i
          WHERE i.user_id = u.user_id
      )
)order by user_id asc;
---------perfrom just a subquery using IN -------------------------------------------------------
SELECT DISTINCT u.username
FROM users u
WHERE u.user_id IN (
    SELECT i.user_id
    FROM interactions i
    WHERE i.post_id IN (
        SELECT p.post_id
        FROM posts p
        WHERE p.user_id = 1
    )
);

------------correlated subquery--------------------------------------------------------
SELECT p.post_id, p.content
FROM posts p
WHERE EXISTS (
    SELECT 1
    FROM interactions i
    WHERE i.post_id = p.post_id
);
-----------single row subquery------------------------------------------------------------
SELECT username
FROM users
WHERE user_id = (
    SELECT user_id
    FROM posts
    ORDER BY post_date DESC
    fetch first 1 rows only
);
--------EXIST and NOT EXISTS subquery-----------------------------------------------------------
SELECT u.user_id, u.username, u.full_name
FROM users u
WHERE EXISTS (
    SELECT 1
    FROM interactions i
    WHERE i.user_id = u.user_id
      AND i.interaction_type = 'Share'
)
AND NOT EXISTS (
    SELECT 1
    FROM interactions i
    WHERE i.user_id = u.user_id
      AND i.interaction_type = 'Comment'
      AND i.post_id = 1
      
)
order by u.user_id asc;
---------NON -correlated subquery-----------------------------------------------------------------
SELECT username
FROM users
WHERE user_id = (
    SELECT user_id
    FROM posts
    ORDER BY post_date DESC
    FETCH FIRST 1 ROWS ONLY
);


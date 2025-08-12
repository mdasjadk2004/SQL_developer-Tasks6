# SQL_developer-Tasks6
In SQL, a subquery is a query nested inside another query.
Subqueries can return a single value, multiple values, or simply a Boolean result (TRUE/FALSE).
They are used to break down complex queries into smaller, manageable steps.
There are two main classifications:
Scalar Subqueries – Return a single value.
Row or Table Subqueries – Return multiple rows or columns.
EXISTS / NOT EXISTS Subqueries – Return a Boolean result based on whether a matching row exists.
IN Subqueries – Check if a value exists within a set returned by the subquery.
Subqueries can also be:
Correlated – The subquery depends on a value from the outer query and executes for each row of the outer query.
Non-Correlated – The subquery runs independently and is executed only once.

Breakdown of Queries Used
Scalar Subquery (Correlated)

Retrieves a user’s name and the total number of posts they have made.

The subquery uses the outer query’s user_id to count posts.

EXISTS with Aggregation (Correlated)

Checks if a user has a post with a post_id greater than their last interaction’s post_id.

Uses EXISTS to return only those users where the condition is true.

Nested IN (Non-Correlated)

Finds users who interacted with posts created by a specific user.

Inner queries run independently, without referencing the outer query.

EXISTS for Matching Records (Correlated)

Returns posts that have at least one interaction.

Correlated because the subquery refers to the post from the outer query.

Single-Row Subquery with = (Non-Correlated)

Finds the username of the user who created the most recent post.

The subquery runs independently and returns a single value.

EXISTS + NOT EXISTS (Correlated)

Finds users who shared at least one post but did not comment on a specific post.

Both subqueries reference the outer query’s user_id.

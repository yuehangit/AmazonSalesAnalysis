CREATE TABLE users AS
SELECT
  unnest(string_to_array(user_id, ',')) AS u_id,
  unnest(string_to_array(username, ',')) AS username
FROM
  combined_users;

DELETE FROM users
WHERE u_id IS NULL;


DELETE FROM users a USING (
    SELECT MIN(ctid) as ctid, u_id
    FROM users
    GROUP BY u_id HAVING COUNT(*) > 1
) b
WHERE a.u_id = b.u_id
AND a.ctid <> b.ctid;

ALTER TABLE users
ADD PRIMARY KEY (u_id),
ALTER COLUMN u_id TYPE varchar(40),
ALTER COLUMN username TYPE varchar(60);




CREATE TABLE sep_users AS
SELECT
  unnest(string_to_array(user_id, ',')) AS u_id,
  unnest(string_to_array(username, ',')) AS username
FROM
  users;

DELETE FROM sep_users
WHERE u_id IS NULL;

DELETE FROM sep_users
USING (
  SELECT u_id, 
         ROW_NUMBER() OVER (PARTITION BY u_id ORDER BY u_id) AS row_num
  FROM sep_users
) AS DuplicateCTE
WHERE sep_users.u_id = DuplicateCTE.u_id
  AND DuplicateCTE.row_num > 1;

ALTER TABLE sep_users
ADD PRIMARY KEY (u_id),
ALTER COLUMN u_id TYPE varchar(40),
ALTER COLUMN username TYPE varchar(60);




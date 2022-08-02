
-- member.sql

-- checkUser
select 
       id
     , name
     , tel
     , gender
     , profile
     , regdate
     , active
  from tblUser
 where id = 'chae' and pw = '1111';
 
-- checkAdmin
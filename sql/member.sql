
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

select 
       name
     , id
  from tblAdmin
 where id = 'admin' and pw = '1111';

select * from tblAdmin;
select * from tblUser;


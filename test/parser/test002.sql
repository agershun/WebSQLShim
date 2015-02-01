-- this version is using your browser's built-in SQLite
CREATE TABLE supportContacts
	(
     id integer primary key, 
     type varchar(20), 
     details varchar(30)
    );

INSERT INTO supportContacts
(id, type, details)
VALUES
(1, 'Email', 'admin@sqlfiddle.com');

INSERT INTO supportContacts
(id, type, details)
VALUES
(2, 'Twitter', '@sqlfiddle');

select * from supportContacts
order by id desc
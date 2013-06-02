insert into groups(group_name) values ('Users');
insert into groups(group_name) values ('Administrators');

insert into group_authorities(group_id, authority) select id,'ROLE_USER' from groups where group_name='Users'; 
insert into group_authorities(group_id, authority) select id,'ROLE_USER' from groups where group_name='Administrators'; 
insert into group_authorities(group_id, authority) select id,'ROLE_ADMIN' from groups where group_name='Administrators'; 

-- Ch 4 Salted User
insert into users(username, password, enabled, salt) values ('gmarano','gmarano1234',true,CAST(RAND()*1000000000 AS varchar(25)));
insert into users(username, password, enabled, salt) values ('empleado','empleado',true,CAST(RAND()*1000000000 AS varchar(25)));

insert into group_members(group_id, username) select id,'empleado' from groups where group_name='Users';
insert into group_members(group_id, username) select id,'gmarano' from groups where group_name='Administrators';

commit;

CREATE TABLE lguname_system..sys_role (
  name varchar(50) NOT NULL ,
  domain varchar(50) NOT NULL,
  PRIMARY KEY  (name,domain)
) 
GO


CREATE TABLE lguname_system..sys_role_permission (
  sysrole varchar(50) NOT NULL,
  domain varchar(50) NOT NULL,
  [key] varchar(50) NOT NULL,
  title varchar(50) default NULL,
  module varchar(50) default NULL,
  PRIMARY KEY  (sysrole,domain,[key])
) 
GO

ALTER TABLE lguname_system..sys_role_permission
	ADD CONSTRAINT FK_sys_role_permission_sys_role FOREIGN KEY (sysrole, domain) REFERENCES sys_role (name, domain)
go

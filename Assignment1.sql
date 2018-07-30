CREATE DATABASE DBLAB;
USE DBLAB;
CREATE TABLE Paper_details( paper_id VARCHAR(40), paper_title VARCHAR(100), paper_type ENUM('conference','journal'), publication DATE);
CREATE TABLE Paper_author(paper_id VARCHAR(100),author_id VARCHAR(100));
CREATE TABLE Author_details(author_id VARCHAR(100),author_type ENUM('student', 'faculty'));
CREATE TABLE Student_details(student_id VARCHAR(100),student_name VARCHAR(100),student_institute VARCHAR(100),department VARCHAR(100),DOB DATE,research_area VARCHAR(100));
CREATE TABLE Faculty_details(faculty_id VARCHAR(100),faculty_name VARCHAR(100),faculty_institute VARCHAR(100),department VARCHAR(100), DOB DATE,research_area VARCHAR(100));
CREATE TABLE Supervisor(faculty_id varchar(100),student_id varchar(100));
show tables;

/*
ADDING DATA
*/

INSERT INTO Paper_details VALUES ('1','PAPER_ONE','conference','1997-04-29');
INSERT INTO Paper_details VALUES ('2','PAPER_TWO','conference','1999-07-19');
INSERT INTO Paper_details VALUES ('3','PAPER_THREE','journal','2010-03-10');
INSERT INTO Paper_details VALUES ('4','PAPER_FOUR','journal','2013-06-20');
INSERT INTO Paper_details VALUES ('5','PAPER_FIVE','conference','2007-06-12');
INSERT INTO Paper_details VALUES ('6','PAPER_SIX','conference','2004-01-02');
INSERT INTO Paper_details VALUES ('7','PAPER_SEVEN','conference','1904-11-02');
INSERT INTO Paper_details VALUES ('8','PAPER_EIGHT','conference','1984-07-02');
INSERT INTO Paper_details VALUES ('9','PAPER_NINE','journal','1934-11-22');
INSERT INTO Paper_details VALUES ('10','PAPER_TEN','conference','2000-01-02');

 select * from Paper_details;
 
INSERT INTO Paper_author VALUES ('1','10');
INSERT INTO Paper_author VALUES ('2','9');
INSERT INTO Paper_author VALUES ('3','8');
INSERT INTO Paper_author VALUES ('4','7');
INSERT INTO Paper_author VALUES ('5','6');
INSERT INTO Paper_author VALUES ('6','5');
INSERT INTO Paper_author VALUES ('7','4');
INSERT INTO Paper_author VALUES ('8','3');
INSERT INTO Paper_author VALUES ('9','2');
INSERT INTO Paper_author VALUES ('10','1');

select * from Paper_author;

INSERT INTO Author_details VALUES ('1','student');
INSERT INTO Author_details VALUES ('2','student');
INSERT INTO Author_details VALUES ('3','student');
INSERT INTO Author_details VALUES ('4','faculty');
INSERT INTO Author_details VALUES ('5','student');
INSERT INTO Author_details VALUES ('6','student');
INSERT INTO Author_details VALUES ('7','student');
INSERT INTO Author_details VALUES ('8','faculty');
INSERT INTO Author_details VALUES ('9','faculty');
INSERT INTO Author_details VALUES ('10','faculty');

select * from Author_details;

INSERT INTO Student_details VALUES ('1','faculty-kumar','iitp','cse','1997-04-29','AI');
INSERT INTO Student_details VALUES ('2','name kumar','iitp','cse','1999-04-29','AI');
INSERT INTO Student_details VALUES ('3','Afaculty-kumar','iitp','cse','1995-04-29','AI');
INSERT INTO Student_details VALUES ('4','kumar','iitp','cse','1987-04-29','AI');
INSERT INTO Student_details VALUES ('5','kumars','iitp','cse','1997-03-29','Big Data');
INSERT INTO Student_details VALUES ('6','a','iitp','ee','2007-04-19','ML');
INSERT INTO Student_details VALUES ('7','b','iitp','ee','2000-04-19','ML');
INSERT INTO Student_details VALUES ('8','c','iitp','cse','1997-12-11','Big Data');
INSERT INTO Student_details VALUES ('9','d','iitp','cse','2017-04-09','ML');
INSERT INTO Student_details VALUES ('10','g','iitp','cse','1990-04-19','DL');

select * from Student_details;



INSERT INTO Faculty_details VALUES ('10','faculty-kumar','iitp','cse','1997-04-29','AI');
INSERT INTO Faculty_details VALUES ('2','name kumar','iitp','cse','1999-04-29','AI');
INSERT INTO Faculty_details VALUES ('31','Afaculty-kumar','iitp','cse','1995-04-29','AI');
INSERT INTO Faculty_details VALUES ('4','kumar','iitp','cse','1987-04-29','AI');
INSERT INTO Faculty_details VALUES ('53','kumars','iitp','cse','1997-03-29','Big Data');
INSERT INTO Faculty_details VALUES ('6','ab','iitp','ee','2007-04-19','ML');
INSERT INTO Faculty_details VALUES ('73','bc','iitp','ee','2000-04-19','ML');
INSERT INTO Faculty_details VALUES ('8','ca','iitp','cse','1997-12-11','Big Data');
INSERT INTO Faculty_details VALUES ('92','df','iitp','cse','2017-04-09','ML');
INSERT INTO Faculty_details VALUES ('81','g','iitp','cse','1990-04-19','DL');

select * from Faculty_details;


INSERT INTO Supervisor VALUES ('10','1');
INSERT INTO Supervisor VALUES ('2','2');
INSERT INTO Supervisor VALUES ('31','3');
INSERT INTO Supervisor VALUES ('4','4');
INSERT INTO Supervisor VALUES ('53','5');
INSERT INTO Supervisor VALUES ('6','6');
INSERT INTO Supervisor VALUES ('73','7');
INSERT INTO Supervisor VALUES ('8','8');
INSERT INTO Supervisor VALUES ('92','9');
INSERT INTO Supervisor VALUES ('81','10');

select * from Supervisor;

alter table Paper_details add PRIMARY KEY (paper_id);
alter table Author_details add PRIMARY KEY (author_id);
alter table Student_details add PRIMARY KEY (student_id);
alter table Faculty_details add PRIMARY KEY (faculty_id,research_area);
alter table Paper_author add PRIMARY KEY (paper_id,author_id);
alter table Supervisor add PRIMARY KEY (faculty_id,student_id);

alter table Paper_author add FOREIGN KEY (paper_id) REFERENCES Paper_details(paper_id);
alter table Paper_author add FOREIGN KEY (author_id) REFERENCES author_details(author_id);
alter table Supervisor add FOREIGN KEY (faculty_id) REFERENCES Faculty_details(faculty_id);
alter table Supervisor add FOREIGN KEY (student_id) REFERENCES Student_details(student_id);

select * from Paper_details where paper_type='conference';

select * from Student_details where research_area='Big Data';

select count(*) from Paper_details where paper_type='journal';
select * from Student_details where DOB>'1990-4-1' and DOB<'2000-3-31';
select * from Faculty_details where research_area='AI' and faculty_institute='iitp';
select * from Faculty_details where research_area='AI' and research_area='Big Data';
select * from Student_details where student_name like '%kumar';

SELECT paper_id,COUNT(*) as cn FROM
Paper_author GROUP BY paper_id HAVING cn>1; 

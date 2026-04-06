create table professor(
	professor_id int primary key,
	professor_name varchar(30),
	department varchar(100) 
);

create table student(
	student_id int primary key,
	student_name varchar(100),
	major varchar(100)
);

create table course(
	course_id int,
	section_id int,
	professor_id int,
	course_name varchar(100),
	primary key(course_id, section_id),
	foreign key(professor_id) references professor(professor_id)
);

create table enrollment(
	student_id int, 
	course_id int,
	section_id int, 
	grade varchar(2),
	points numeric(4,2), 
	enrollment_at date,
	primary key(student_id, course_id),
	foreign key(student_id) references student(student_id),
	foreign key(course_id, section_id) references course(course_id, section_id)
);
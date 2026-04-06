Table professor {
  professor_id int [primary key]
  professor_name varchar(30)
  department varchar(100)
}

Table student {
  student_id int [primary key]
  student_name varchar(100)
  major varchar(100)
}

Table course {
  course_id int
  section_id int
  professor_id int
  course_name varchar(100)

  Indexes {
    (course_id, section_id) [pk]
  }
}

Table enrollment {
  student_id int
  course_id int
  section_id int
  grade varchar(2)
  points numeric(4,2)
  enrollment_at date

  Indexes {
    (student_id, course_id) [pk]
  }
}

Ref: course.professor_id > professor.professor_id
Ref: enrollment.student_id > student.student_id
Ref: enrollment.(course_id, section_id) > course.(course_id, section_id) 
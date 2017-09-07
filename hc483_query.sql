use hc483;

#Q1:
# get the names, college IDs, and course sections of all students being taught by a particular faculty member
# the particular faculty member I chose is faculty_ID=001
select faculty_id,student_first_name,student.student_last_name,student.department_id,section.section_id
from student_course_taken
	inner join course
		on course.course_id=student_course_taken.course_id
    inner join student
		on student.student_id=student_course_taken.student_id
	inner join section
		on section.course_id=course.course_id
where course.faculty_id=1;


#Q2
# get the names of all students, and the smallest and largest section ID to which they are assigned.


select student.student_first_name,student.student_last_name,max(section.section_id),min(section.section_id)
from student_course_taken
	inner join course
		on course.course_id=student_course_taken.course_id
    inner join student
		on student.student_id=student_course_taken.student_id
	inner join section
		on section.course_id=course.course_id

	group by student.student_id;



#Q3
# delete a single department that already has a student or a faculty member assigned to it.
set FOREIGN_KEY_CHECKS =0;

delete from department 
	where department.department_id=1;

set FOREIGN_KEY_CHECKS=1;

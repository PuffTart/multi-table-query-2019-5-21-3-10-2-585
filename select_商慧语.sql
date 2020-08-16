# 1.查询同时存在1课程和2课程的情况

select 
	studentId
from	
	student_course
where
	courseId in (1,2)
group by 
	studentId
	having count(1) = 2;


# 2.查询同时存在1课程和2课程的情况

同1；

# 3.查询平均成绩大于等于60分的同学的学生编号和学生姓名和平均成绩

select
	t1.studentId
	,t2.name
	,avg(t1.score)
from
	student_course   t1
left join 
	student  t2
	on   t1.studentId = t2.id
group by
	t1.studentId
	,t2.name
	having  avg(score) >= 60;

# 4.查询在student_course表中不存在成绩的学生信息的SQL语句

select 
	t1.*
from 
	student   t1
left join 
	student_course  t2
	on  t1.id = t2.studentId
where 
	t2.studentId is null
group by
	t1.*;

# 5.查询所有有成绩的SQL

select * from student_course;

# 6.查询学过编号为1并且也学过编号为2的课程的同学的信息

select 
	t1.*
from 
	student   t1
right join 
	(select 
		studentId
	from	
		student_course
	where
		courseId in (1,2)
	group by 
		studentId
		having count(1) = 2
	)  t2
	on  t1.id = t2.studentId
group by 
	t1.*;



# 7.检索1课程分数小于60，按分数降序排列的学生信息

select 
	t1.*
	,t2.score
from 
	student   t1
right join 
	student_course  t2
	on  t1.id = t2.studentId
where 
	t2.couseid = 1 
	and t2.score < 60
group by
	t1.*,t2.score
order by 
	score desc;

# 8.查询每门课程的平均成绩，结果按平均成绩降序排列，平均成绩相同时，按课程编号升序排列

select
	courseId
	,avg(score)
from
	student_score  
group by
	courseId
order by 
	avg(score) desc,courseId;

# 9.查询课程名称为"数学"，且分数低于60的学生姓名和分数

select 
	t3.name
	,t1.score
from
	student_score  t1
left join
	course   t2
	on t1.courseId = t2.id
left join
	student   t3
	on t1.studentId = t3.id
where  
	t2.name = '数学'
	and  t1.score <60;

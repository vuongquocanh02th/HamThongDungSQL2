use quanlysinhvien;

-- hien thi cac mon hoc co credit lon nhat
select * from subject 
where credit = (select max(credit) from subject);

-- Hien thi cac mon hoc co diem thi lon nhat
select s.subId, s.subName, s.credit , m.mark
from mark m 
inner join subject s on m.subId = s.subId
where m.mark = (select max(mark) from mark);

-- hien thi thong tin sinh vien va diem trung binh moi sinh vien, xep hang diem giam dan
select
	s.studentId as studentId,
    s.studentName as studentName,
    round(avg(m.mark) , 2) as dtb
from student s 
inner join mark m on s.studentId = m.studentId
group by s.studentId, s.studentName
order by dtb desc;
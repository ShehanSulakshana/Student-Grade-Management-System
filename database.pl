
:- dynamic student/4.
% student(studentID, fname, lname, level).   level 3-6
student(1, shehan, sulakshana, 4).
student(2, gayan, thusitha, 4).
student(3, harshana, wijekoon, 4).
student(4, danu, sudarshan, 4).


:- dynamic marks/3.
% marks(StudentID, SubjectCode, Marks).
marks(1,isu4200 , 85).
marks(1,cou4300 , 65).
marks(1,cou4302 , 78).
marks(1,adu4230 , 79).
marks(1,cou4304 , 50).
marks(1,cou4201 , 45).
marks(2,isu4200 , 74).
marks(2,cou4300 , 55).
marks(2,cou4302 , 48).
marks(2,adu4230 , 39).
marks(2,cou4304 , 0).
marks(2,cou4201 , 85).
marks(3,isu4200 , 95).
marks(3,cou4300 , 35).
marks(3,cou4302 , 58).
marks(3,adu4230 , 99).
marks(3,cou4304 , 80).
marks(3,cou4201 , 43).


%GRADE RULES
grade(Mark, 'A') :- Mark >= 75.
grade(Mark, 'B') :- Mark >= 65, Mark < 75.
grade(Mark, 'C') :- Mark >= 50, Mark < 65.
grade(Mark, 'D') :- Mark >= 40, Mark < 50.
grade(Mark, 'F') :- Mark < 40.

%GPA
gpa_value('A',4.0).
gpa_value('B',3.5).
gpa_value('C',3.0).
gpa_value('D',2.5).
gpa_value('F',0).
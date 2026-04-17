:- consult(database).

% Show all students 
show_students :-
    topic('Students List'),
    forall(student(StudentID, FName, LName, Level),
           format('~w | ~w ~w - Level: ~w~n',
                  [StudentID, FName, LName, Level])).


% Show student by StudentID 
show_student:-
    topic('Students Details'),
    write('[?] - Enter Student ID : '), read(StudentID),
    nl,
    (student(StudentID, FName, LName, Level) ->
        nl,
        format('#~ ~w | ~w ~w | Level: ~w~n',[StudentID, FName, LName, Level]),
        nl
    ;nl,format('~n~n[Error] - No student found with ID = ~w~n~n', [StudentID]),nl ,nl).


add_student :-
    topic('Add New Student'),
    writeln('[?] - Enter Student ID :'), read(StudentID),
    writeln('[?] - Enter First Name :'), read(FName),
    writeln('[?] - Enter Last Name :'), read(LName),
    writeln('[?] - Enter Level (3-6) :'), read(Level),
    ( student_exists(StudentID) ->
        write('[Error] - Student already exists!') ,nl
    ; (Level < 3 ; Level > 6) ->
        write('[Error] - Invalid level (Only 3-6 allowed)!'),nl
    ; assertz(student(StudentID, FName, LName, Level)),
      write('#~ Student added successfully')
    ).


% Delete student with ID
delete_student :-
    topic('Delete Student'),
    write('[?] - Enter Student ID : '), read(StudentID),
    nl,
    ( retract(student(StudentID, FName, LName, Level)) ->
        format('#~ Removed student: ~w ~w ~n',
               [FName, LName]),

        retractall(marks(StudentID, _)),
        format('#~ Removed all marks for student ID ~w~n', [StudentID])
    ;
    format('~n~n[Error] - No student found with ID = ~w~n~n', [StudentID])
    ).



% Check student existence
student_exists(StudentID) :-
    student(StudentID, _, _, _).


% Show all mark record for an ID
show_marks:-
    topic('Student Marks'),
    write('[?] - Enter Student ID : '), read(StudentID),
    nl,
    ( student_exists(StudentID) ->
    write('#~ student id : '),write(StudentID),nl,
    write('#~ marks list :: '),
    nl,nl,
    forall(marks(StudentID,SubjectID,Marks),
        format('   ~w | ~w ~n',
                [SubjectID, Marks])) 
                
    ;nl,format('~n~n[Error] - No student found with ID = ~w~n~n', [StudentID]) ,nl ,nl).


% ############################################################


add_marks :-
    topic('Add Student Marks'),
    writeln('[?] - Enter Student ID :'), read(StudentID),
    writeln('[?] - Enter SubjectCode :'), read(SubjectCode),
    writeln('[?] - Enter marks :'), read(Marks),
    ( mark_exists(StudentID , SubjectCode) ->
        write('[Error] - Subject code already exists!') ,nl
    ; \+student_exists(StudentID) ->
       format('~n[Error] - No student found with ID = ~w~n', [StudentID])
    ; (Marks < 0 ; Marks > 100) ->
        write('[Error] - Invalid marks (Only 0-100 allowed)!'),nl
    ; assertz(marks(StudentID, SubjectCode, Marks)),
      write('#~ Student marks added successfully')
    ).


% Remove marks record
delete_marks :-
    topic('Delete Marks'),
    write('[?] - Enter Student ID : '), read(StudentID),
    nl,
    write('[?] - Enter Subject Code : '), read(SubjectCode),
    nl,
    ( retract(marks(StudentID, SubjectCode, _)) ->
        nl, write('#~ Marks deleted successfully.'), nl
    ;
        nl, write('[Error] - Subject Code not found.'), nl
    ).



% Check student existence
mark_exists(StudentID , SubjectCode) :-
    marks(StudentID, SubjectCode, _).

% Show option topic
topic(Name) :-
    nl,
    format('********* ~w *********~n',[Name]),
    nl.

    

% ############################################################


report_student:-
    topic('Student Report'),
    write('[?] - Enter Student ID : '), read(StudentID),
    nl,

    ( \+student_exists(StudentID) ->
        format('~n~n[Error] - No student found with ID = ~w~n~n', [StudentID])
    ;
    % Student Grades
    forall(marks(StudentID, Subject, Mark),
           ( grade(Mark, Grade),
             format(' ~w | marks = ~w | Grade = ~w~n',
                    [Subject, Mark, Grade])
           )),

    %GPA
    findall(GP,
            (marks(StudentID, _, Mark),
             grade(Mark, Grade),
             gpa_value(Grade, GP)),
            GPList),
    sum_list(GPList, GPsum),
    length(GPList, Count),
    GPA is GPsum / Count,
    Rounded is round(GPA * 100) / 100.0,
    nl,write('GPA : '), write(Rounded) , nl ,

    % Student Total Marks
    findall(Marks, marks(StudentID, _, Marks), List),
    sum_list(List, Sum),
    nl,
    write('Total Marks : '), write(Sum) ,nl , nl
    ).
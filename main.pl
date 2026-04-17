% main.pl
:- consult(logic).

% Example usage
run :- 
    nl ,nl , writeln('#======= Student & Grade Management System =======#'), nl ,nl ,
    writeln('    [1] - Add new student'),
    writeln('    [2] - Delete student'),
    writeln('    [3] - List all students'),
    writeln('    [4] - Student details by StudentID'),
    nl,
    writeln('    [5] - Add new marks'),
    writeln('    [6] - Delete marks record'),
    writeln('    [7] - Show student\'s marks'),
    writeln('    [8] - Student Report'),
    nl,
    writeln('    [0] - Exit'),
    nl ,nl,

    write('[?] - Select an option : ') ,read(Option) ,

    handle_selection(Option).


handle_selection(Option) :-
    ( Option > 8 ; Option < 0 ) ->
        ( nl,
          writeln('[Error] - Invalid Option'),
          writeln('[*] - Please try Again.'),
          nl )
    ; Option =:= 1 ->
        add_student , flow_confirmation
    ; Option =:= 2 ->
        delete_student , flow_confirmation
    ; Option =:= 3 ->
        show_students , flow_confirmation
    ; Option =:= 4 ->
        show_student , flow_confirmation
    ; Option =:= 5 ->
        add_marks , flow_confirmation
    ; Option =:= 6 ->
        delete_marks , flow_confirmation
    ; Option =:= 7 ->
        show_marks , flow_confirmation
    ; Option =:= 8 ->
        report_student , flow_confirmation 
    ; Option =:= 0 ->
            nl,writeln('#~ Thank you.'),nl
            
    ; nl,writeln('[Error] - Invalid Option'),
        writeln('[*] - Please try Again.'),nl.


flow_confirmation :- 
    sleep(2),
    nl,nl,
    writeln('[?] - Restart(1) / Exit (0) : ') , read(FlowOption),
    nl,
    (
        FlowOption=0 ->
            writeln('#~ Thank you.'),nl
        ;FlowOption=1 ->
            sleep(2),
            run
        ;writeln('[Error] - Invalid input.'),
        flow_confirmation   
    ).
# Student Grade Management System

A simple menu-driven Student and Grade Management System built in Prolog.

This project lets you manage students, store marks by subject, and generate a student report with grades and GPA.

## Features

- Add a new student
- Delete a student (and all marks for that student)
- List all students
- View student details by Student ID
- Add marks for a student and subject
- Delete a marks record
- Show all marks for a student
- Generate a student report:
  - Subject-wise marks and letter grades
  - GPA
  - Total marks

## Project Structure

```text
.
|- database.pl   % Dynamic facts + grade/GPA mappings
|- logic.pl      % Core predicates for student and marks operations
|- main.pl       % Menu flow and program entry point
`- README.md
```

## Data Model

The system uses these facts:

- `student(StudentID, FirstName, LastName, Level)`
- `marks(StudentID, SubjectCode, Marks)`

Constraints in logic:

- `Level` must be between 3 and 6
- `Marks` must be between 0 and 100
- A student ID must be unique
- A `(StudentID, SubjectCode)` marks record must be unique

## Grade and GPA Rules

Letter grades are assigned as:

- A: 75-100
- B: 65-74
- C: 50-64
- D: 40-49
- F: 0-39

GPA points:

- A = 4.0
- B = 3.5
- C = 3.0
- D = 2.5
- F = 0.0

For a student report, GPA is calculated as the average of GPA points from all recorded subjects.

## Requirements

- SWI-Prolog (recommended)

## How to Run

1. Open terminal in the project folder.
2. Start SWI-Prolog:

```bash
swipl
```

3. Load the main file:

```prolog
?- [main].
```

4. Start the application:

```prolog
?- start.
```

## Main Predicates

From menu flow:

- `start/0`
- `handle_selection/1`

From core logic:

- `show_students/0`
- `show_student/0`
- `add_student/0`
- `delete_student/0`
- `show_marks/0`
- `add_marks/0`
- `delete_marks/0`
- `report_student/0`

## Notes

- Data is stored in dynamic predicates during runtime.
- If you want permanent storage across runs, you can extend this project with file persistence (`tell/1`, `told/0`, `listing/1`, etc.).

## License

This project includes an MIT License. See `LICENSE` for details.

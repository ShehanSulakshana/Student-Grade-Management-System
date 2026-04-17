# Student Grade Management System

<p align="center">
  <strong>Elegant, menu-driven student and marks management in pure Prolog.</strong>
</p>

<p align="center">
  <img alt="Language" src="https://img.shields.io/badge/Language-Prolog-b22222?style=for-the-badge">
  <img alt="Runtime" src="https://img.shields.io/badge/Runtime-SWI--Prolog-1f6feb?style=for-the-badge">
  <img alt="Architecture" src="https://img.shields.io/badge/Architecture-Rule--Based-0f766e?style=for-the-badge">
  <img alt="License" src="https://img.shields.io/badge/License-MIT-2e7d32?style=for-the-badge">
</p>

## Overview

This project is a console-based Student and Grade Management System built with Prolog.
It focuses on clean rule-based logic for managing students, subject marks, grade assignment,
and GPA generation through a straightforward interactive workflow.

## Why This Project Stands Out

- Strong separation of concerns between data, logic, and application flow
- Menu-driven CLI for simple usage and demonstration
- Declarative grade and GPA rules that are easy to audit
- Dynamic fact updates for add/delete operations during runtime

## Capabilities

| Area | What You Can Do |
| --- | --- |
| Student Management | Add, delete, list, and view student details by ID |
| Marks Management | Add and remove marks by student and subject |
| Reporting | Print student report with grades, GPA, and total marks |
| Validation | Prevent duplicate student IDs, validate levels and marks ranges |

## Application Menu

The interactive entry point offers these options:

| Option | Action |
| --- | --- |
| 1 | Add new student |
| 2 | Delete student |
| 3 | List all students |
| 4 | Student details by StudentID |
| 5 | Add new marks |
| 6 | Delete marks record |
| 7 | Show student's marks |
| 8 | Student report |
| 0 | Exit |

## Project Layout

```text
.
|- database.pl   % Dynamic facts + grade/GPA point mappings
|- logic.pl      % Business logic and reporting predicates
|- main.pl       % User menu and navigation flow
`- README.md
```

## Core Data Model

```prolog
student(StudentID, FirstName, LastName, Level).
marks(StudentID, SubjectCode, Marks).
```

### Enforced Rules

- Student level must be between 3 and 6
- Marks must be between 0 and 100
- Student ID must be unique
- Combination of StudentID and SubjectCode in marks must be unique

## Grading System

### Letter Grade Mapping

| Marks | Grade |
| --- | --- |
| 75-100 | A |
| 65-74 | B |
| 50-64 | C |
| 40-49 | D |
| 0-39 | F |

### GPA Point Mapping

| Grade | GPA Point |
| --- | --- |
| A | 4.0 |
| B | 3.5 |
| C | 3.0 |
| D | 2.5 |
| F | 0.0 |

GPA is calculated as the arithmetic average of grade points from all subjects recorded for a student.

## Quick Start

### Prerequisite

- Install SWI-Prolog

### Run

```bash
swipl
```

```prolog
?- [main].
?- start.
```

## Important Predicates

### Menu Flow

- `start/0`
- `handle_selection/1`
- `flow_confirmation/0`

### Student and Marks Logic

- `show_students/0`
- `show_student/0`
- `add_student/0`
- `delete_student/0`
- `add_marks/0`
- `delete_marks/0`
- `show_marks/0`
- `report_student/0`

## Notes

- Data is held in dynamic predicates during runtime.
- To persist data between runs, add file-based persistence using Prolog I/O predicates.

## License

Licensed under MIT. See `LICENSE` for details.

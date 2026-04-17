# 🎓 Student Grade Management System

A logic-based student management system built with **Prolog** to automate academic record tracking, grade assignment, and GPA calculation.

![Prolog](https://img.shields.io/badge/Prolog-100%25-red?logo=prolog)
![License](https://img.shields.io/badge/License-MIT-green)
![Version](https://img.shields.io/badge/version-1.0.0-blue)

## 📌 About

This project implements a rule-based system for managing student academic records using the declarative logic programming paradigm of Prolog. It allows users to:

- Add and maintain student records
- Record course grades and credits
- Automatically compute semester and cumulative GPA
- Query student performance and academic history
- Generate simple reports

The system demonstrates how logic programming can elegantly handle complex rule-based calculations like GPA computation, grade mapping, and conditional academic warnings.

## ✨ Features

- **Student Management** – Add, update, and view student details
- **Course & Grade Tracking** – Record grades with associated credit hours
- **GPA Calculation** – Automatically compute GPA based on grade points (A=4.0, B=3.0, etc.)
- **Rule-based Logic** – Implements academic rules (e.g., pass/fail, probation status)
- **Query Interface** – Ask questions like "Which students are on probation?" or "What is Student X's GPA?"

## 🧠 Built With

- **Prolog** – Core logic and rule engine (tested with SWI-Prolog)
- No external dependencies – pure Prolog implementation

## 📂 Project Structure

```
Student-Grade-Management-System/
├── database.pl      # Facts: students, courses, enrollments
├── logic.pl         # Rules: GPA calculation, grading, reports
├── main.pl          # Entry point & user interaction predicates
└── README.md        # This file
```

## 🚀 Getting Started

### Prerequisites

- Install [SWI-Prolog](https://www.swi-prolog.org/download/stable) (version 8.x or later)

### Installation & Running

1. **Clone the repository**
   ```bash
   git clone https://github.com/ShehanSulakshana/Student-Grade-Management-System.git
   cd Student-Grade-Management-System
   ```

2. **Start Prolog and load the main file**
   ```bash
   swipl
   ?- [main].
   ```

3. **Run the system**
   ```prolog
   ?- start.
   ```
   Follow the interactive menu to add students, record grades, or view GPAs.

### Example Queries (Direct in Prolog)

After loading `main.pl`, you can also run queries manually:

```prolog
% Calculate GPA for student with ID 101
?- calculate_gpa(101, GPA).

% List all students on probation (GPA < 2.0)
?- probation_students(Students).

% Check if a student passed a specific course
?- passed(101, cs101).
```

## 📊 Sample Facts (from `database.pl`)

```prolog
student(101, 'Alice Johnson', sophomore).
course(cs101, 'Programming Fundamentals', 4).
enrolled(101, cs101, 'A').
```

## 🧪 Future Enhancements

- Export reports to CSV/JSON
- Transcript generation with course-wise grades
- GUI using XPCE or a web frontend
- Support for weighted courses and +/- grading
- Automatic email alerts for low GPA

## 🤝 Contributing

Contributions are welcome!  
Feel free to open an issue or submit a pull request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License – see the [LICENSE](LICENSE) file for details.

## 👤 Author

**Shehan Sulakshana**  
- GitHub: [@ShehanSulakshana](https://github.com/ShehanSulakshana)

## 🙏 Acknowledgments

- SWI-Prolog community
- Logic programming paradigms for elegant rule-based systems

---

⭐ If you find this project useful, please give it a star on GitHub!  
_Report issues or suggestions via the [Issues tab](https://github.com/ShehanSulakshana/Student-Grade-Management-System/issues)._
```

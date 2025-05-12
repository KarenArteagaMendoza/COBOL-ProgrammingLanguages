# Introduction to COBOL — Course Repository

Welcome to the repository for the “Introduction to COBOL” course. This repository contains all the source code, examples, exercises, notes, and supplemental materials used throughout the course. Whether you’re a student, instructor, or self-learner, this collection is designed to help you understand the fundamentals of COBOL programming and explore its modern-day applications.

---

## 📜 Course Overview

The course provides a practical introduction to COBOL, one of the longest-standing and still-used programming languages in the world. You'll learn how to:

- Understand COBOL's structure and syntax
- Write procedural and object-based programs
- Handle data using structured types
- Perform file I/O and business-style processing
- Explore concepts like loops, conditions, and modular programming
- Apply COBOL in real-world scenarios, including polynomial algebra

---

## 📝 Contents

- `Polynomials/polynomial.cob` — A module implementing various polynomial operations in COBOL
- `Polynomials/polynomials.cob` — A sample main program demonstrating polynomial addition, composition, differentiation, etc.
- `code/` — Folder for practice scripts, examples, and exercises
- `docs/` — Slides, guide and exam
- `README.md` — This documentation file

---

## ⚙️ Requirements

- GnuCOBOL 3.1 or newer
- Terminal or environment capable of compiling COBOL programs

---

## 💻 Installation Instructions

### On macOS (via Homebrew)

```bash
brew install gnu-cobol
```

Then verify:

```bash
cobc -v
```

### On Debian/Ubuntu Linux

```bash
sudo apt update
sudo apt install open-cobol
```

To verify:

```bash
cobc -v
```

> Note: Some distros may have an older version of GnuCOBOL. For the latest release, consider compiling it from source: https://gnucobol.sourceforge.io/

---

## ▶️ Running the Example

To compile the polynomial module and main program:

```bash
cobc -free -m Polynomial/polynomial.cob
cobc -free -x Polynomial/polynomials.cob Polynomial/polynomial.cob
```

Then run:

```bash
./polynomials
```

---

## 🨠 Learning Goals

By the end of this course, you'll be able to:

- Write complete COBOL programs from scratch
- Understand divisions, data definitions, and procedural logic
- Perform common tasks like reading/writing files and arithmetic processing
- Translate real-world problems into structured COBOL code
- Appreciate COBOL's continued relevance in finance, banking, and enterprise systems

---

## 📄 License

This material is provided for educational purposes. Please feel free to use, adapt, or contribute with attribution.

---

Happy coding!

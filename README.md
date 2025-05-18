# Automating Tasks with Bash 🐚

This project contains a collection of **Bash scripts** written to automate common tasks such as file sorting, backup simulation, executable logging, and secure password generation. These scripts were developed as part of **Lab 27: Shell Scripting** at the **NUST Chip Design Centre**.

---

### 🎯 Objective

The aim was to build a set of functional and efficient shell scripts to:

* Automate repetitive system-level tasks
* Strengthen understanding of core Bash scripting concepts (loops, conditionals, file handling)
* Practice real-world scripting use cases in Linux

---

### 📁 Scripts Overview

#### ✅ **1. Bubble Sort Script**

Sorts a hardcoded array using the classic **Bubble Sort** algorithm.

```bash
arr=(64 34 25 12 22 11 90)
```

**Key Concepts:**

* Array manipulation
* Nested loops
* Conditionals and swapping

📂 `bubble_sort.sh`

---

#### 🔄 **2. Backup Simulation (`git`-like `init/status`)**

Simulates basic `git` behavior with two commands:

* `init` – Initializes a backup of the current directory
* `status` – Shows modified, untracked, or deleted files compared to the backup

**Key Concepts:**

* Directory management
* `rsync` and `diff`
* Argument parsing and control structures

📂 `mini_git.sh`

---

#### 🧾 **3. Executable Logger**

Recursively searches subdirectories and logs all executable files into `executables.log`.

**Key Concepts:**

* `find`, recursion, filtering
* Logging output to a file

📂 `log_executables.sh`

---

#### 🔐 **4. Password Generator**

Generates a secure random password of user-defined length using `/dev/urandom`.

**Key Concepts:**

* Input validation
* Random string generation
* Alphanumeric and special character filtering

📂 `password_generator.sh`

---

### 🛠 Tools & Environment

* **Bash** (GNU/Linux shell)
* **CLI utilities**: `rsync`, `diff`, `find`, `tr`, etc.
* **Environment**: Linux-based system (tested in terminal)

---

### 🧠 What I Learned

* Writing modular, reusable shell scripts
* Handling user input, edge cases, and file system traversal
* Using Bash tools to simulate more advanced systems (like Git)

---

**Author:** Ahmad Mukhtar
**Institution:** NUST Chip Design Centre (NCDC), Islamabad


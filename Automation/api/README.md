# 🤖 Robot Framework API Testing Project – JSONPlaceholder

This project showcases beginner-to-intermediate level **API test automation** using **Robot Framework** and **RequestsLibrary**, targeting the public [JSONPlaceholder](https://jsonplaceholder.typicode.com) API.

It covers common HTTP methods like `GET`, `POST`, and `DELETE`, simulates invalid data testing, and demonstrates proper use of reusable variables.

---

## 📁 Project Structure

Automation/api/
├── tests/
│ ├── api_test.robot # Main API test suite
│ ├── disable_urllib3_warnings.py # Script to suppress SSL warnings (if present)
│ ├── variable.py # Python variable file for test data
├── README.md # This documentation
├── .gitignore # Files to ignore in version control


---

## 🔧 Tools Used

| Tool                | Purpose                     |
|---------------------|-----------------------------|
| Robot Framework     | Main test automation tool   |
| RequestsLibrary     | To send HTTP requests       |
| JSONPlaceholder     | Public fake REST API        |
| Python 3.x          | Runtime for Robot Framework |
 
---

## ▶️ How to Run Tests

1. **Install Python**
   [https://www.python.org/downloads/](https://www.python.org/downloads/)

2. **Install Robot Framework + RequestsLibrary**
   ```bash
   pip install robotframework
   pip install robotframework-requests

3. Run a test
Navigate to the /tests folder and run:
robot test_get_user.robot

4. View logs
    After each run, Robot Framework will generate:
        log.html – detailed log
        report.html – test summary
        output.xml – for CI tools

📦 .gitignore Setup
These files are ignored from version control:
    output/
    log.html
    report.html
    output.xml
    __pycache__/
    *.pyc
    .env

## 📝 What Is Tested?

- **DELETE** existing user (cleanup before tests)
- **GET** user details (deep validation of JSON fields)
- **PATCH** to update part of user data (e.g., email)
- **POST** to create a new user with valid and invalid data
- **PUT** to update an existing user fully
- Validation of expected status codes, fields, and error handling

## 💡 Notes

- Tests use the [JSONPlaceholder fake REST API](https://jsonplaceholder.typicode.com/) for learning/demo.
- Variable values can be adjusted in `variable.py`.
- Custom keywords or setup scripts (such as `disable_urllib3_warnings.py`) are included for convenience.

---




💼 Why This Project Matters
T       his project is designed to:
        Demonstrate core API testing techniques
        Prepare you for real-world test automation roles
        Be GitHub portfolio–ready for recruiters and hiring managers

✍️**Author:**  
Vitus Idi  
GitHub: [galapoto](https://github.com/galapoto)
⭐️ Star this repo if you found it helpful!
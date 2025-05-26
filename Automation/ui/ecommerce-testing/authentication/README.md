# Ecommerce Authentication UI Automation – Magento2 Demo

Automated UI tests for user authentication and registration flows on the [Magento2 Demo site](https://magento2demo.firebearstudio.com/), using Robot Framework and SeleniumLibrary.

---

## 📂 Folder Structure

ecommerce-testing/
└── authentication/
   ├── resources/
   │   ├── keywords.robot # Reusable keywords for login, registration, and actions
   │   └── variables.robot # Test data and URLs
   └── authentication_test.robot # Main test suite for authentication
   └── README.md # This documentation


---

## 🚀 How to Run

1. **Install Python** (version 3.8 or higher recommended)  
   [Download Python](https://www.python.org/downloads/)

2. **Install Robot Framework and SeleniumLibrary**  
   In your terminal:

pip install robotframework
pip install robotframework-seleniumlibrary


3. **Install Chrome browser and [ChromeDriver](https://sites.google.com/chromium.org/driver/)**  
Ensure ChromeDriver matches your Chrome version.

4. **Navigate to the test folder:**

cd Automation/ui/ecommerce-testing/authentication/


5. **Run the test suite:**

---

## 📝 What is Tested?

- **Register With Valid Details:** Registers a new user with a unique email.
- **Register With Existing Email:** Tries to register with an already used email, expects a validation error.
- **Login With Valid Credentials:** Logs in using a valid user and password, then logs out.
- **Login With Invalid Password:** Attempts login with an invalid password, expects an error.
- **Logout Functionality:** Logs in and then logs out to verify session end.

All flows use reusable keywords and variables for maintainability and easy data updates.

---

## 💡 Notes

- **Random email generation** ensures the registration test always uses a unique user.
- Actions and waits are robust against modern dynamic web pages.
- All selectors and data can be edited in `resources/keywords.robot` and `resources/variables.robot` for quick changes or scaling to new sites.

---

**Author:**  
Vitus Idi  
GitHub: [galapoto](https://github.com/galapoto)

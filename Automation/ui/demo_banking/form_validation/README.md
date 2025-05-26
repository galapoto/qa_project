# Form Validation Automation – Parabank Registration

This folder contains automated tests for validating the registration form on [Parabank Demo](https://parabank.parasoft.com/parabank/register.htm) using Robot Framework and SeleniumLibrary.

---

## 📂 Folder Structure

form_validation/
└── tests/
  ├── form_validation_test.robot # Main test suite for form validation
  └── resources/
     ├── keywords.robot # Custom keywords for actions
     └── variables.robot # Test data and URLs

---

## 🚀 How to Run

1. **Install Python** (version 3.8 or higher recommended)  
   [Download Python](https://www.python.org/downloads/)

2. **Install Robot Framework and SeleniumLibrary**  
   In your terminal:

pip install robotframework
pip install robotframework-seleniumlibrary


3. **Install Chrome browser and [ChromeDriver](https://sites.google.com/chromium.org/driver/)** (make sure driver version matches your Chrome version).

4. **Navigate to the tests folder:**
cd Automation/ui/demo_banking/form_validation/tests/


5. **Run the test suite:**
robot form_validation_test.robot


---

## 📝 What is Tested?

- Required field validation
- Validation with only required fields
- Submission with only username and password
- Password mismatch
- Invalid zip code and SSN
- Duplicate usernames
- Maximum length for username and password
- Special character validation

All key actions and data are abstracted as reusable keywords and variables.

---

## 💡 Notes

- Tests will open and close a Chrome browser window for each scenario.
- Random and special character usernames are generated for robust negative/positive testing.
- **Edit variables in `resources/variables.robot` as needed** to try other edge cases.

---

**Author:**  
Vitus Idi  
GitHub: [galapoto](https://github.com/galapoto)
=======
# QA Project

This is a QA Engineering portfolio project for job applications.  
It demonstrates manual QA skills on a public eCommerce demo site ([nopCommerce Demo](https://demo.nopcommerce.com/)).

## 📋 Project Structure
qa-project/
├── manual/
│ └── ui/
│ └── test_cases.md # Manual test cases and execution results
├── automation/
│ ├── ui/
│ └── api/
├── docs/
│ └── bug_report.md # Bug reports (community and self-discovered)
├── images/ # Screenshots for evidence
├── README.md
└── .gitignore


## 🛠️ What This Project Includes

- End-to-end manual UI test cases
- Real execution results for each case
- Community-reported bug analysis with reference
- Professional folder and documentation structure

## 🚀 How To Explore

- See `manual/ui/test_cases.md` for manual test case details and results.
- Check `docs/bug_report.md` for documented bugs, with references to real community issues.
- Screenshots and evidence are in the `images/` folder.

---

### Contact

**Vitus Idi**  
GitHub: [galapoto](https://github.com/galapoto)

## 📷 Evidence of Test Execution

Below are screenshots captured during manual execution of the main test cases. Each screenshot provides proof of test completion and results:

- **Test Case 1:** Registration Success  
  ![Registration Success](images/registration_success.png)

- **Test Case 2:** Login Success  
  ![Login Success](images/login_success.png)

- **Test Case 3:** Product Added to Cart  
  ![Product in Cart](images/product_in_cart.png)

- **Test Case 4:** Order Confirmation  
  ![Order Confirmation](images/order_confirmation.png)

- **Test Case 5:** Order History  
  ![Order History](images/order_history.png)

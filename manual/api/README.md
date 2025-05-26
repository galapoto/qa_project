# Manual API Test Cases – Swagger Petstore

This folder contains **manual API test cases** for the [Swagger Petstore Demo API](https://petstore.swagger.io/).

## 📄 What’s in this folder?

- `test_cases.md`: Manual test cases for core API endpoints (GET, POST, DELETE, and negative cases).
- Any future screenshots or bug reports related to API testing.

## 📝 How to Reproduce These Tests

1. Open [Swagger Petstore](https://petstore.swagger.io/) in your browser.
2. Expand the relevant endpoint (see each test case for details).
3. Click **Try it out**, enter the required data, and click **Execute**.
4. Compare the actual result with the expected result as described in `test_cases.md`.

## ✅ Test Case List

| Test Case ID | Endpoint & Operation          | Summary                                |
|--------------|------------------------------|----------------------------------------|
| TC_API_001   | GET /pet/findByStatus        | List pets by status (available)        |
| TC_API_002   | GET /pet/{petId}             | Get existing pet by ID                 |
| TC_API_003   | GET /pet/{petId}             | Negative: Get non-existing pet (404)   |
| TC_API_004   | POST /pet                    | Create a new pet                       |
| TC_API_005   | DELETE /pet/{petId}          | Delete an existing pet                 |
| TC_API_006   | GET /pet/{petId} after DELETE| Confirm deleted pet is gone (404)      |

## 🛠️ Tools Used

- [Swagger Petstore Demo API](https://petstore.swagger.io/)
- Browser (Chrome, Firefox, or Edge)

## 📢 Notes

- All tests are performed manually using the Swagger UI.
- Results and actual outputs are included in `test_cases.md` for full traceability.
- These tests are suitable for demonstration, learning, and portfolio purposes.
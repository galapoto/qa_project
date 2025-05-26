# Bug Report

**Title:** Error message persists after successful login (community-reported issue)

**Environment:**
- Website: https://demo.nopcommerce.com/
- Browser: Chrome Version 136.0.7103.114
- Date found: 2025-05-24

**Note:**  
This bug was reported by the nopCommerce community (see [forum post](https://www.nopcommerce.com/en/boards/topic/101430/login-error)). It was **not reproducible** during this testing session.

**Preconditions:**
- User has a registered account.

**Steps to Reproduce:**
1. Navigate to the login page.
2. Enter a valid email address.
3. Enter an incorrect password and click "Log in".
4. Observe the error message: "Login was unsuccessful. Please correct the errors and try again."
5. Without refreshing the page, enter the correct password and click "Log in".

**Expected Result:**  
After a successful login, the error message should be cleared, and the user should be redirected to the home page.

**Actual Result:**  
No error message was visible after successful login; the bug could not be reproduced in the current version.

**Severity:**  
Low

**Attachment:**  
N/A

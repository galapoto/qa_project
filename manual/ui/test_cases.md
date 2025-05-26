## Test Case 1: Register With Valid, Unique Email

**Test Case ID:** TC_UI_001
**Title:** Register with valid, unique email
**Preconditions:** User is on the home page of https://demo.nopcommerce.com/
**Steps:**
  1. Click "Register" at the top of the page.
  2. Select gender (Male or Female).
  3. Enter First Name.
  4. Enter Last Name.
  5. Select Date of Birth.
  6. Enter a unique, valid email address.
  7. Enter a password.
  8. Confirm the password.
  9. Click the "Register" button.
**Expected Result:** User sees a message: "Your registration completed" and is redirected to a success page.
**Actual Result:** Registration was successful. A green message "Your registration completed" was displayed, and the user was logged in with the Continue button visible.
See screenshot: images/registration_success.png
**Status:** Pass

## Test Case 2: Login with Valid Credentials

**Test Case ID:** TC_UI_002
**Title:** Login with valid credentials
**Preconditions:** User has a registered account on https://demo.nopcommerce.com/
**Steps:**
  1. Click "Log in" at the top of the page.
  2. Enter a valid email address.
  3. Enter the correct password.
  4. Click the "Log in" button.
**Expected Result:** User is logged in successfully and redirected to the home page with their account name visible.
**Actual Result:** User was able to log in successfully and was redirected to the home page. The account name appeared at the top of the page, confirming login. No separate login success message was displayed.
See screenshot: images/login_success.png
**Status:** Pass

## Test Case 3: Add Product to Cart (as Logged-in User)

**Test Case ID:** TC_UI_003
**Title:** Add product to cart as a logged-in user
**Preconditions:** User is logged in on https://demo.nopcommerce.com/
**Steps:**
  1. Browse or search for a product on the website.
  2. Click on the product to view its details.
  3. Click the "Add to cart" button.
  4. Click the shopping cart icon at the top of the page to view the cart.
**Expected Result:** The selected product appears in the shopping cart with the correct details and quantity.
**Actual Result:** The selected product was added to the shopping cart successfully. The cart displayed the correct product name, price, and quantity.
See screenshot: images/product_in_cart.png
**Status:** Pass

## Test Case 4: Checkout (as Logged-in User)

**Test Case ID:** TC_UI_004
**Title:** Checkout as logged-in user
**Preconditions:** User is logged in on https://demo.nopcommerce.com/ and has at least one product in the cart
**Steps:**
  1. Click the shopping cart icon at the top of the page.
  2. Review the cart and click the "Checkout" button.
  3. Enter or confirm shipping address details.
  4. Select shipping method and continue.
  5. Enter or confirm payment details.
  6. Review order summary.
  7. Click the "Confirm" button to place the order.
**Expected Result:** Order is placed successfully, and user sees a confirmation message and order number.
**Actual Result:** Order was placed successfully. A confirmation message and order number were displayed on the order confirmation page.
See screenshot: images/order_confirmation.png
**Status:** Pass

## Test Case 5: View Order History

**Test Case ID:** TC_UI_005
**Title:** View order history
**Preconditions:** User is logged in on https://demo.nopcommerce.com/ and has placed at least one order
**Steps:**
  1. Click on the account name at the top of the page.
  2. Select "Orders" or "Order history" from the account menu.
**Expected Result:** A list of previous orders is displayed, showing order numbers, dates, statuses, and totals.
**Actual Result:** Order history page displayed a list of previous orders, including order number, date, status, and total.
See screenshot: images/order_history.png
**Status:** Pass

## Test Case 6: Search Product

**Test Case ID:** TC_UI_006
**Title:** Search for a product
**Preconditions:** User is on the home page of https://demo.nopcommerce.com/
**Steps:**
  1. Locate the search bar at the top of the page.
  2. Enter the name of a product (e.g., "laptop") into the search bar.
  3. Click the search button or press Enter.
**Expected Result:** Search results page displays products matching the search term.
**Actual Result:** The search results page displayed relevant products matching the search term entered.
**Status:** Pass

## Test Case 7: Logout

**Test Case ID:** TC_UI_007
**Title:** Logout
**Preconditions:** User is logged in on https://demo.nopcommerce.com/
**Steps:**
  1. Click the "Log out" link at the top of the page.
**Expected Result:** User is logged out and redirected to the home page; "Log in" and "Register" links are visible at the top.
**Actual Result:** User was successfully logged out and redirected to the home page. "Log in" and "Register" links appeared at the top of the page.
**Status:** Pass


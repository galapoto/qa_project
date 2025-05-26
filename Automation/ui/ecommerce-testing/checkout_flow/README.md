# Nets Easy Shop E-commerce Automation Suite

## Overview

This project is an **end-to-end test automation suite** for the [Nets Easy Shop demo site](https://shop.easy.nets.eu), implemented in **Robot Framework** using the [Browser library (Playwright)](https://github.com/MarketSquare/robotframework-browser).

The suite covers typical e-commerce user flows, including product selection, cart management, and checkout process.  
It demonstrates real-world limitations of UI automation on modern, secure payment flows.

---

## Test Scenarios

| Test Case                                         | Coverage                                 |
|---------------------------------------------------|------------------------------------------|
| Add Single Product to Cart                        | FULL                                     |
| Add Multiple Products to Cart                     | FULL                                     |
| Remove Product from Cart                          | FULL                                     |
| Update Product Quantity in Cart                   | FULL                                     |
| View Cart Summary                                 | FULL                                     |
| Checkout as Guest Using Override URL              | Up to payment iframe load                |

> **Note:**  
> The suite also defines "Submit Empty Checkout Form" and "Enter Invalid Credit Card Info" as documented test ideas, but due to browser security restrictions, automation is not possible inside the cross-origin payment iframe.

---

## Why These Limitations?

**Modern browsers block script and automation access to iframes with different origins (cross-origin)** to protect payment security and user privacy.  
As a result:
- **All cart and pre-checkout flows are 100% automatable.**
- **Interaction inside the actual payment form (e.g., filling card details, submitting payment) cannot be performed by UI test automation.**
- These steps are represented as checks that the payment form is present and visible, with a note that manual or contract/API testing is needed for full coverage.

---

## Project Structure

ecommerce-testing/
│
├── nets/
│ ├── checkout_flow_browser.robot # Main Robot Framework test suite
│ ├── resources/
│ │ ├── nets/
│ │ │ ├── keywords_browser.robot # Custom reusable keywords
│ │ │ └── variables_browser.robot # Variable definitions (URLs, test data)
│ └── README.md # This file
│
└── ...


---

## Getting Started

### Prerequisites

- Python 3.7+
- [Robot Framework](https://robotframework.org/)
- [robotframework-browser](https://github.com/MarketSquare/robotframework-browser)

### Setup

1. **Install dependencies:**
    ```sh
    pip install robotframework-browser
    rfbrowser init
    ```

2. **Clone this repository and navigate to the test folder.**

3. **Run the test suite:**
    ```sh
    robot checkout_flow_browser.robot
    ```

---

## How Each Test Works

- **Add/Remove/Update Cart:**  
    Tests product selection, removal, and cart summary.  
    Verifies visible changes in cart UI.

- **Checkout as Guest Using Override URL:**  
    Opens a pre-filled checkout page with a payment iframe.  
    Verifies that the payment form is visible (no further automation possible).

- **Payment Tests (documented, not automated):**  
    The suite includes stubs for submitting empty checkout forms and invalid card scenarios, but these are marked as not automatable due to iframe security.

---

## Manual & API Testing

For **full checkout/payment flow coverage**, consider:
- **API-level tests** if the backend exposes payment endpoints or test hooks.
- **Manual exploratory testing** for the final steps inside the payment iframe.

---

## Author & Motivation

Created by a QA Engineer as part of a professional portfolio.  
- **Demonstrates real e-commerce automation skills.**
- **Explicitly documents automation boundaries** (important for interviews and technical discussions).

---

## References

- [Robot Framework Browser Library](https://github.com/MarketSquare/robotframework-browser)
- [Playwright Documentation](https://playwright.dev/)

---

*Happy testing!*


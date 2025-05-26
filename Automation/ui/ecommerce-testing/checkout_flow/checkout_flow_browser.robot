*** Settings ***
Library     Browser
Resource    resources/keywords_browser.robot
Resource    resources/variables_browser.robot

*** Test Cases ***
Add Single Product to Cart
    [Documentation]    Adds a product and verifies it's in the cart.
    Open Demo Shop
    Add First Product To Cart
    Go To Cart
    Wait For Elements State    css=button.MenuBar-checkoutButton    visible    10s
    Save Screenshot            single_product_cart.png

Add Multiple Products to Cart
    [Documentation]    Adds two products and verifies they are in the cart.
    Open Demo Shop
    Add First Product To Cart
    Add Second Product To Cart
    Go To Cart
    Wait For Elements State    css=button.MenuBar-checkoutButton    visible    10s
    Save Screenshot            multiple_products_cart.png

Remove Product from Cart
    [Documentation]    Removes product and verifies cart is empty.
    Open Demo Shop
    Add First Product To Cart
    Go To Cart
    Remove Product From Cart
    Wait For Elements State    css=p[style*="font-style: italic"]:has-text("(No products in cart)")    visible    5s
    Save Screenshot            cart_empty.png

Update Product Quantity in Cart
    [Documentation]    Updates product quantity and verifies the update.
    Open Demo Shop
    Add First Product To Cart
    Go To Cart
    Update Product Quantity    2
    Wait For Elements State    css=h6.MuiTypography-alignRight:has-text("198,00") >> nth=0    visible    5s
    Save Screenshot            quantity_updated.png

View Cart Summary
    [Documentation]    Verifies that cart summary is visible.
    Open Demo Shop
    Add First Product To Cart
    Add Second Product To Cart
    Go To Cart
    Wait For Elements State    css=strong:has-text("Total")    visible    5s
    Save Screenshot            cart_summary.png

Checkout as Guest Using Override URL
    [Documentation]    Loads the override checkout page and verifies payment iframe loads.
    New Browser    chromium    headless=${FALSE}
    New Context
    New Page    ${OVERRIDE_CHECKOUT_URL}
    Wait For Elements State    id=nets-checkout-iframe    visible    30s
    ${src}=    Get Attribute    id=nets-checkout-iframe    src
    Log To Console    Payment iframe src: ${src}
    Save Screenshot            payment_iframe_loaded.png
*** Settings ***
Library    Browser
Resource   variables_browser.robot

*** Keywords ***
Open Demo Shop
    New Browser    chromium    headless=${FALSE}
    New Context
    New Page    ${BASE_URL}
    Wait For Elements State    text="Latest products"    visible    10s

Go To Cart
    Wait For Elements State    css=button.MenuBar-checkoutButton    visible    10s
    Click    css=button.MenuBar-checkoutButton

Add First Product To Cart
    Click    css=.HomeProductCard-button >> nth=0

Add Second Product To Cart
    Click    css=.HomeProductCard-button >> nth=1

Remove Product From Cart
    Wait For Elements State    css=button:has(svg[data-testid="ClearIcon"])    visible    5s
    Click    css=button:has(svg[data-testid="ClearIcon"])
    Wait For Elements State    css=p[style*="font-style: italic"]:has-text("(No products in cart)")    visible    5s

Update Product Quantity
    [Arguments]    ${new_qty}
    Wait For Elements State    css=button.CheckoutOverview-button:has-text("+")    visible    5s
    FOR    ${i}    IN RANGE    1    ${new_qty}
        Click    css=button.CheckoutOverview-button:has-text("+")
    END
    Wait For Elements State    css=h6.MuiTypography-alignRight:has-text("198,00") >> nth=0    visible    5s

Save Screenshot
    [Arguments]    ${filename}
    Take Screenshot    ${filename}
*** Settings ***
Library    SeleniumLibrary
Library    String

*** Keywords ***
Prepare Test
    Open Fresh Browser
    Setup Random Email

Open Fresh Browser
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    ${arg1}=       Set Variable    --disable-infobars
    ${arg2}=       Set Variable    --disable-save-password-bubble
    ${arg3}=       Set Variable    --incognito
    ${arg4}=       Set Variable    --disable-features=PasswordCheck

    Call Method    ${options}    add_argument    ${arg1}
    Call Method    ${options}    add_argument    ${arg2}
    Call Method    ${options}    add_argument    ${arg3}
    Call Method    ${options}    add_argument    ${arg4}

    ${prefs}=    Create Dictionary
    ...    credentials_enable_service=${False}
    ...    profile.password_manager_enabled=${False}
    ...    profile.default_content_setting_values.notifications=2

    Call Method    ${options}    add_experimental_option    prefs    ${prefs}
    Create WebDriver    Chrome    options=${options}
    Set Selenium Timeout    10s
    Go To    ${BASE_URL}
    Maximize Browser Window

Setup Random Email
    ${rand}=    Generate Random String    6    [LETTERS]
    ${RANDOM_EMAIL}=    Set Variable    user${rand}@example.com
    Set Suite Variable    ${RANDOM_EMAIL}

Go To Registration Page
    Go To    ${BASE_URL}
    Wait Until Element Is Visible    xpath=//a[text()='Create an Account']    10s
    Execute JavaScript    document.evaluate("//a[text()='Create an Account']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView();
    Click Element    xpath=//a[text()='Create an Account']
    Wait Until Page Contains    Create an Account

Go To Login Page
    Go To    ${BASE_URL}
    Wait Until Element Is Visible    xpath=//a[contains(@href, 'customer/account/login')]    10s
    Click Element    xpath=//a[contains(@href, 'customer/account/login')]
    Wait Until Page Contains    Customer Login

Wait Until Element Is Clickable
    [Arguments]    ${locator}    ${timeout}=20s
    Wait Until Element Is Visible    ${locator}    ${timeout}
    Wait Until Element Is Enabled    ${locator}    ${timeout}
    Scroll Element Into View         ${locator}
    Wait For Checkout Ajax

Register New User
    [Arguments]    ${firstname}    ${lastname}    ${email}    ${password}
    Input Text    id=firstname    ${firstname}
    Input Text    id=lastname     ${lastname}
    Input Text    id=email_address    ${email}
    Input Text    id=password     ${password}
    Input Text    id=password-confirmation   ${password}
    Click Button    xpath=//button[@title='Create an Account']

Login With Credentials
    [Arguments]    ${email}    ${password}
    Input Text    id=email    ${email}
    Input Text    id=pass     ${password}
    Click Button    id=send2

Logout User
    Wait Until Element Is Visible    xpath=//button[contains(@class, 'action switch')]    15s
    Sleep    1s
    Click Element    xpath=//button[contains(@class, 'action switch')]
    Wait Until Element Is Visible    xpath=//a[text()='Sign Out']    10s
    Click Element    xpath=//a[text()='Sign Out']

Go To Home Page
    Go To    ${BASE_URL}
    Wait Until Element Is Visible    xpath=//input[@id='search']

Search For Product
    [Arguments]    ${product_name}
    Input Text    xpath=//input[@id='search']    ${product_name}
    Press Keys    xpath=//input[@id='search']    RETURN
    Wait Until Page Contains    ${product_name}

Click Product From Results
    [Arguments]    ${product_name}
    Wait Until Element Is Visible    xpath=//a[contains(., '${product_name}')]
    Click Element    xpath=//a[contains(., '${product_name}')]

Select Product Size And Color
    Wait Until Element Is Visible    css=.swatch-option.text
    Click Element    css=.swatch-option.text
    Wait Until Element Is Visible    css=.swatch-option.color
    Click Element    css=.swatch-option.color

Add Product To Cart
    [Arguments]    ${product_name}=None
    Wait Until Element Is Visible    id=product-addtocart-button
    Click Button    id=product-addtocart-button
    ${msg}=    Set Variable    You added
    IF    '${product_name}' != 'None'
        ${msg}=    Set Variable    You added ${product_name} to your shopping cart.
    END
    Wait Until Page Contains    ${msg}

Go To Cart
    Wait Until Element Is Visible    xpath=//*[@id="html-body"]/div[2]/header/div[2]/div[1]/a
    Click Element                    xpath=//*[@id="html-body"]/div[2]/header/div[2]/div[1]/a
    Wait Until Element Is Visible    xpath=/html/body/div[2]/header/div[2]/div[1]/div/div/div/div[2]/div[3]/div/button
    Click Button                     xpath=/html/body/div[2]/header/div[2]/div[1]/div/div/div/div[2]/div[3]/div/button
    Wait Until Page Contains         Shipping Address

Remove Product From Cart
    [Arguments]    ${product_name}
    Wait Until Element Is Visible    xpath=//td[contains(@class,'item')][.//a[contains(.,'${product_name}')]]
    Click Element    xpath=//a[@title='Remove item']
    Wait Until Page Does Not Contain    ${product_name}

Update Product Quantity
    [Arguments]    ${product_name}    ${quantity}
    Wait Until Element Is Visible    xpath=//td[contains(@class,'item')][.//a[contains(.,'${product_name}')]]
    Input Text    xpath=//td[contains(@class,'item')][.//a[contains(.,'${product_name}')]]/../td//input[contains(@name, '[qty]')]    ${quantity}
    Click Element    xpath=//button[@title='Update Shopping Cart']
    Wait Until Page Contains    Shopping Cart

Input Guest Checkout Details
    Wait Until Element Is Visible    name=firstname
    Input Text    name=firstname    Test
    Input Text    name=lastname     User
    Input Text    name=street[0]    Test Address 1
    Input Text    name=city         Helsinki
    Input Text    name=postcode     00100
    Input Text    name=telephone    0400000000
    Input Text    name=username     ${RANDOM_EMAIL}


Wait For Checkout Ajax
    Wait Until Keyword Succeeds    10x    2s    Run Keyword And Ignore Error    Element Should Not Be Visible    xpath=//div[contains(@class,'loading-mask') and contains(@style, 'display: block')]

Select Shipping Method
    Wait For Checkout Ajax
    Scroll Element Into View           xpath=//div[@id="shipping-method-buttons-container"]//input[@type='u']
    Wait Until Element Is Clickable    xpath=//div[@id='checkout-shipping-method-load']//input[@type='radio']
    Click Element                      xpath=//div[@id='checkout-shipping-method-load']//input[@type='radio']
    Sleep    1s

Continue To Shipping
    Wait For Checkout Ajax
    Wait Until Element Is Clickable    xpath=//button[@data-role="opc-continue"]
    Click Button                       xpath=//button[@data-role="opc-continue"]
    Wait For Checkout Ajax
    Wait Until Page Contains           Payment Method

Continue To Payment
    Wait For Checkout Ajax
    Wait Until Page Contains        Payment Method

Input Invalid Payment Info
    Log    SKIPPED: Payment form is unavailable in demo

Place Order
    Place Order
    Wait For Checkout Ajax
    Wait Until Element Is Clickable    xpath=//button[@title="Place Order" or @data-role="review-save"]
    Click Button                       xpath=//button[@title="Place Order" or @data-role="review-save"]
    Wait For Checkout Ajax
    Wait Until Page Contains           Thank you for your purchase!

Scroll Element Into View
    [Arguments]    ${locator}
    Execute JavaScript    arguments[0].scrollIntoView({behavior: "smooth", block: "center"});    ${locator}
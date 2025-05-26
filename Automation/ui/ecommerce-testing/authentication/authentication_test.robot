*** Settings ***
Library    SeleniumLibrary
Resource   ../resources/magento2/keywords.robot
Resource   ../resources/magento2/variables.robot

Test Setup        Prepare Test
Test Teardown     Close Browser

*** Test Cases ***
Register With Valid Details
    Go To Registration Page
    Register New User    ${NEW_USER_FIRSTNAME}    ${NEW_USER_LASTNAME}    ${RANDOM_EMAIL}    ${NEW_USER_PASSWORD}
    Wait Until Page Contains    Thank you for registering
    Logout User
    Wait Until Page Contains    You are signed out

Register With Existing Email
    Go To Registration Page
    Register New User    ${NEW_USER_FIRSTNAME}    ${NEW_USER_LASTNAME}    ${EXISTING_USER_EMAIL}    ${EXISTING_USER_PASSWORD}
    Wait Until Page Contains    There is already an account with this email address

Login With Valid Credentials
    Go To Login Page
    Login With Credentials    ${EXISTING_USER_EMAIL}    ${EXISTING_USER_PASSWORD}
    Wait Until Page Contains Element    xpath=//button[contains(@class, 'action switch')]    15s
    Wait Until Page Contains    My Account
    Logout User
    Wait Until Page Contains    You are signed out

Login With Invalid Password
    Go To Login Page
    Login With Credentials    ${EXISTING_USER_EMAIL}    wrongpassword
    Wait Until Page Contains    The account sign-in was incorrect
    # No logout — user isn't logged in

Logout Functionality
    Go To Login Page
    Login With Credentials    ${EXISTING_USER_EMAIL}    ${EXISTING_USER_PASSWORD}
    Wait Until Page Contains Element    xpath=//button[contains(@class, 'action switch')]    15s
    Logout User
    Wait Until Page Contains    You are signed out
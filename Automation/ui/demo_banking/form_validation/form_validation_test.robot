*** Settings ***
Resource    resources/keywords.robot
Resource    resources/variables.robot

*** Test Cases ***
Submit Empty Registration Form Should Trigger Server Validation
    [Setup]    Open Registration Page
    Click Register
    Wait Until Page Contains    is required    timeout=5s
    [Teardown]    Close Registration Page

Submit Form With Only Required Fields Should Succeed
    [Setup]    Open Registration Page
    ${unique_username}=    Generate Random Username    user    15
    Input Registration Data    ${FIRST_NAME}    ${LAST_NAME}    ${ADDRESS}    ${CITY}    ${STATE}    ${ZIPCODE}    ${SSN}    ${unique_username}    ${PASSWORD}    ${PASSWORD}
    Click Register
    Wait Until Page Contains    Your account was created successfully. You are now logged in.    timeout=10s
    [Teardown]    Close Registration Page

Submit Form With Only Username And Password Should Trigger Validation
    [Setup]    Open Registration Page
    Input Registration Data    ${EMPTY}    ${EMPTY}    ${EMPTY}    ${EMPTY}    ${EMPTY}    ${EMPTY}    ${EMPTY}    ${USERNAME}    ${PASSWORD}    ${PASSWORD}
    Click Register
    Wait Until Page Contains    is required    timeout=5s
    [Teardown]    Close Registration Page

Submit Form With Mismatched Passwords
    [Setup]    Open Registration Page
    Input Registration Data    ${FIRST_NAME}    ${LAST_NAME}    ${ADDRESS}    ${CITY}    ${STATE}    ${ZIPCODE}    ${SSN}    ${USERNAME}    ${PASSWORD}    WrongPass
    Click Register
    Wait Until Page Contains    did not match    timeout=5s
    [Teardown]    Close Registration Page

Submit Form With Invalid Zip Code
    [Setup]    Open Registration Page
    Input Registration Data    ${FIRST_NAME}    ${LAST_NAME}    ${ADDRESS}    ${CITY}    ${STATE}    ${INVALID_ZIP}    ${SSN}    ${USERNAME}    ${PASSWORD}    ${PASSWORD}
    Click Register
    Wait Until Page Contains    Zip Code    timeout=5s
    [Teardown]    Close Registration Page

Submit Form With Invalid SSN
    [Setup]    Open Registration Page
    Input Registration Data    ${FIRST_NAME}    ${LAST_NAME}    ${ADDRESS}    ${CITY}    ${STATE}    ${ZIPCODE}    ${INVALID_SSN}    ${USERNAME}    ${PASSWORD}    ${PASSWORD}
    Click Register
    Wait Until Page Contains    SSN    timeout=5s
    [Teardown]    Close Registration Page

Submit Form With Duplicate Username
    [Setup]    Open Registration Page
    Input Registration Data    ${FIRST_NAME}    ${LAST_NAME}    ${ADDRESS}    ${CITY}    ${STATE}    ${ZIPCODE}    ${SSN}    ${DUPLICATE_USER}    ${PASSWORD}    ${PASSWORD}
    Click Register
    Wait Until Page Contains    This username already exists    timeout=10s
    [Teardown]    Close Registration Page

Submit Form With Max-Length Username And Password
    [Setup]    Open Registration Page
    ${max_length_username}=    Generate Max Length Username
    ${max_length_password}=    Set Variable    Secret
    Input Registration Data    ${FIRST_NAME}    ${LAST_NAME}    ${ADDRESS}    ${CITY}    ${STATE}    ${ZIPCODE}    ${SSN}    ${max_length_username}    ${max_length_password}    ${max_length_password}
    Click Register
    Wait Until Page Contains    Your account was created successfully.    timeout=10s
    [Teardown]    Close Registration Page

Submit Form With Special Characters In Fields
    [Setup]    Open Registration Page
    ${unique_special_username}=    Generate Special Char Username    15
    Input Registration Data    ${SPECIAL_CHARS}    ${SPECIAL_CHARS}    ${SPECIAL_CHARS}    ${SPECIAL_CHARS}    ${SPECIAL_CHARS}    ${ZIPCODE}    ${SSN}    ${unique_special_username}    ${PASSWORD}    ${PASSWORD}
    Click Register
    Wait Until Page Contains    Your account was created successfully.    timeout=10s
    [Teardown]    Close Registration Page
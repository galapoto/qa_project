*** Settings ***
Library    SeleniumLibrary
Resource   variables.robot

*** Keywords ***
Open Registration Page
    &{prefs}=    Create Dictionary
    ...    credentials_enable_service=${False}
    ...    profile.password_manager_enabled=${False}
    ...    profile.default_content_setting_values.notifications=2
    ...    profile.autofill_profile_enabled=${False}
    Open Browser    ${REGISTER_URL}    Chrome    options=add_experimental_option("prefs", ${prefs})
    Maximize Browser Window

Input Registration Data
    [Arguments]    ${first_name}    ${last_name}    ${address}    ${city}    ${state}    ${zipcode}    ${ssn}    ${username}    ${password}    ${repeat_password}
    Input Text    id=customer.firstName    ${first_name}
    Input Text    id=customer.lastName     ${last_name}
    Input Text    id=customer.address.street    ${address}
    Input Text    id=customer.address.city      ${city}
    Input Text    id=customer.address.state     ${state}
    Input Text    id=customer.address.zipCode   ${zipcode}
    Input Text    id=customer.ssn               ${ssn}
    Input Text    id=customer.username          ${username}
    Input Password    id=customer.password      ${password}
    Input Password    id=repeatedPassword       ${repeat_password}

Click Register
    Click Button    xpath=//input[@value='Register']

Close Registration Page
    Close Browser

Generate Random Username
    [Arguments]    ${prefix}    ${length}
    # Calculate available length for random part
    ${timestamp}=    Evaluate    str(int(time.time()*1000))    modules=time
    ${random_length}=    Evaluate    ${length} - len('${prefix}') - len('${timestamp}')
    ${random_part}=    Evaluate    ''.join(__import__('random').choices('ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789', k=${random_length}))
    ${random_username}=    Evaluate    '${prefix}' + '${random_part}' + '${timestamp}'
    RETURN    ${random_username}

Generate Special Char Username
    [Arguments]    ${length}
    ${specials}=    Set Variable    !@#$%^&*
    ${timestamp}=   Evaluate    str(int(time.time()*1000))    modules=time
    ${random_length}=    Evaluate    ${length} - len('${timestamp}')
    ${random_part}=  Evaluate    ''.join(__import__('random').choices('${specials}', k=${random_length}))
    ${special_username}=    Evaluate    '${random_part}' + '${timestamp}'
    RETURN    ${special_username}

Generate Max Length Username
    ${username}=    Evaluate    ''.join(__import__('random').choices('abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ', k=20))
    RETURN    ${username}

Generate Max Length Password
    [Arguments]    ${char}=B    ${length}=20
    ${password}=    Evaluate    '${char}' * ${length}
    RETURN    ${password}

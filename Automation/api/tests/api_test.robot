*** Settings ***
Library           RequestsLibrary
Library           disable_urllib3_warnings.py
Variables         variable.py

Suite Setup       disable_insecure_request_warning

*** Test Cases ***
Check Base URL Works
    Log    The base URL is: ${BASE_URL}

Delete Existing User
    ${session}=    Create Session    jsonplaceholder    ${BASE_URL}
    ${resp}=    DELETE On Session    jsonplaceholder    /users/${USER_ID}
    Log    Status Code: ${resp.status_code}
    Should Be Equal As Numbers    ${resp.status_code}    200

Get JSONPlaceholder User - Deep JSON Validation
    ${session}=    Create Session    jsonplaceholder    ${BASE_URL}
    ${resp}=    Get On Session    jsonplaceholder    /users/${USER_ID}
    Should Be Equal As Numbers    ${resp.status_code}    200
    ${json}=    Set Variable    ${resp.json()}
    Should Be Equal As Numbers    ${json['id']}       ${USER_ID}
    Should Be Equal As Strings    ${json['email']}    Sincere@april.biz
    Should Be Equal As Strings    ${json['address']['street']}       Kulas Light
    Should Be Equal As Strings    ${json['address']['geo']['lat']}   -37.3159
    Should Be Equal As Strings    ${json['company']['name']}         Romaguera-Crona
    Should Be Equal As Strings    ${json['company']['catchPhrase']}  Multi-layered client-server neural-net

Get JSONPlaceholder User
    ${session}=    Create Session    jsonplaceholder    ${BASE_URL}
    ${resp}=    Get On Session    jsonplaceholder    /users/${USER_ID}
    Should Be Equal As Numbers    ${resp.status_code}    200
    ${json}=    Set Variable    ${resp.json()}
    Log    User Data: ${json}
    Should Be Equal As Numbers    ${json['id']}    ${USER_ID}
    Should Be Equal As Strings    ${json['email']}    Sincere@april.biz

Update User Email With PATCH
    ${session}=    Create Session    jsonplaceholder    ${BASE_URL}
    ${payload}=    Create Dictionary    email=patched@example.com
    ${resp}=    Patch On Session    jsonplaceholder    /users/${USER_ID}    json=${payload}
    Should Be Equal As Numbers    ${resp.status_code}    200
    ${json}=    Set Variable    ${resp.json()}
    Log    PATCH Response: ${json}
    Should Be Equal As Strings    ${json['email']}    patched@example.com

Create New User
    ${session}=    Create Session    jsonplaceholder    ${BASE_URL}
    ${payload}=    Create Dictionary    name=John Doe    email=johndoe@example.com    phone=123-456-7890
    ${resp}=    Post On Session    jsonplaceholder    /users    json=${payload}
    Should Be Equal As Numbers    ${resp.status_code}    201
    ${json}=    Set Variable    ${resp.json()}
    Log    Response: ${json}
    Should Be Equal As Strings    ${json['name']}     John Doe
    Should Be Equal As Strings    ${json['email']}    johndoe@example.com
    Should Be Equal As Strings    ${json['phone']}    123-456-7890

Create User With Invalid Data
    ${session}=    Create Session    jsonplaceholder    ${BASE_URL}
    ${payload}=    Create Dictionary    email=    phone=123456
    ${resp}=    Post On Session    jsonplaceholder    /users    json=${payload}
    Should Be Equal As Numbers    ${resp.status_code}    201
    ${json}=    Set Variable    ${resp.json()}
    Log    Response: ${json}
    Should Be Equal As Strings    ${json['email']}    ${EMPTY}
    Should Not Contain    ${json['phone']}    -

Update Existing User With PUT
    ${session}=    Create Session    jsonplaceholder    ${BASE_URL}
    ${payload}=    Create Dictionary
    ...    name=${UPDATED_USER_NAME}
    ...    email=${UPDATED_USER_EMAIL}
    ...    phone=${UPDATED_USER_PHONE}
    ${resp}=    Put On Session    jsonplaceholder    /users/${USER_ID}    json=${payload}
    Should Be Equal As Numbers    ${resp.status_code}    200
    ${json}=    Set Variable    ${resp.json()}
    Log    Response: ${json}
    Should Be Equal As Strings    ${json['name']}     ${UPDATED_USER_NAME}
    Should Be Equal As Strings    ${json['email']}    ${UPDATED_USER_EMAIL}
    Should Be Equal As Strings    ${json['phone']}    ${UPDATED_USER_PHONE}
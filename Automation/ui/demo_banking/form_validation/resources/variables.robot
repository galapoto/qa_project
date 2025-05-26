*** Variables ***
${REGISTER_URL}     https://parabank.parasoft.com/parabank/register.htm
${CHROME_OPTS}      --incognito --disable-password-manager-reauthentication --disable-save-password-bubble --disable-autofill-keyboard-accessory-view --disable-credentials-enable-service

*** Variables ***
${REGISTER_URL}     https://parabank.parasoft.com/parabank/register.htm

${FIRST_NAME}       John
${LAST_NAME}        Doe
${ADDRESS}          123 Main St
${CITY}             Helsinki
${STATE}            Uusimaa
${ZIPCODE}          12345
${PHONE}            0401234567
${SSN}              123-45-6789
${USERNAME}         johndoe123
${PASSWORD}         Secret123
${DUPLICATE_USER}   johndoe123
${INVALID_ZIP}      abcdef
${INVALID_SSN}      1
${SPECIAL_CHARS}    !@#$%^&*
${LONG_USERNAME}    AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
${LONG_PASSWORD}    BBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBBB

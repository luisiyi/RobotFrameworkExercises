*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BASIC_AUTH_VALID_URL} =           https://${VALID_LOGIN_EMAIL}:${VALID_LOGIN_PASSWORD}@the-internet.herokuapp.com/basic_auth
${VALID_LOGIN_EMAIL} =              admin
${VALID_LOGIN_PASSWORD} =           admin
${AUTH_SUCCESSFUL_LABEL} =           Congratulations! You must have the proper credentials.

${BASIC_AUTH_INVALID_URL} =         https://${INVALID_LOGIN_EMAIL}:${INVALID_LOGIN_PASSWORD}@the-internet.herokuapp.com/basic_auth
${INVALID_LOGIN_EMAIL} =            admin1
${INVALID_LOGIN_PASSWORD} =         admin1


*** Keywords ***
Login With Valid Credentials
    SeleniumLibrary.Go To           ${BASIC_AUTH_VALID_URL}

Validate Authentication Was Successful
    Wait Until Page Contains        ${AUTH_SUCCESSFUL_LABEL}

Login With Invalid Credentials
    SeleniumLibrary.Go To           ${BASIC_AUTH_INVALID_URL}

Validate Authentication Was Unsuccessful
    Page Should Not Contain         ${AUTH_SUCCESSFUL_LABEL}



# Keyword that do all the steps
Do Exercise
    Login With Valid Credentials
    Validate Authentication Was Successful
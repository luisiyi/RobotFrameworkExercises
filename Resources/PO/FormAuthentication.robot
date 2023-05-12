*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${FORM_AUTH_INPUT_USERNAME} =                   //*[@id="username"]
${FORM_AUTH_INPUT_PASSWORD} =                   //*[@id="password"]

${FORM_AUTH_LOGIN_BUTTON} =                     //*[@id="login"]/button/i
${FORM_AUTH_LOGIN_CORRECT_LABEL} =              You logged into a secure area!
${FORM_AUTH_LOGOUT_CORRECT_LABEL} =             You logged out of the secure area!
${FORM_AUTH_INVALID_USERNAME_LABEL} =           Your username is invalid!
${FORM_AUTH_INVALID_PASSWORD_LABEL} =           Your password is invalid!
${FORM_AUTH_LOGOUT_BUTTON} =                    //*[@id="content"]/div/a/i
*** Keywords ***
Type Right Credentials In The Fields
    [Arguments]                 ${Username}     ${Password}
    Fill "Username" Field       ${Username}
    Fill "Password" Field       ${Password}

Type Bad Credentials In Username Field
    [Arguments]                 ${Username}     ${Password}
    Fill "Username" Field       ${Username}
    Fill "Password" Field       ${Password}

Type Bad Credentials In Password Field
    [Arguments]                 ${Username}     ${Password}
    Fill "Username" Field       ${Username}
    Fill "Password" Field       ${Password}


Fill "Username" Field
    [Arguments]     ${Username}
    input text                          ${FORM_AUTH_INPUT_USERNAME}         ${Username}

Fill "Password" Field
    [Arguments]     ${Password}
    Input Password                      ${FORM_AUTH_INPUT_PASSWORD}         ${Password}


Click "Login" Button
    Click Element                        ${FORM_AUTH_LOGIN_BUTTON}

Validate The Login Was Successful
    Wait Until Page Contains            ${FORM_AUTH_LOGIN_CORRECT_LABEL}

Click "Logout" Button
    Click Element                        ${FORM_AUTH_LOGOUT_BUTTON}

Validate The Logout Was Successful
    Wait Until Page Contains            ${FORM_AUTH_LOGOUT_CORRECT_LABEL}

Validate The Username Was Invalid
    Wait Until Page Contains            ${FORM_AUTH_INVALID_USERNAME_LABEL}

Validate The Password Was Invalid
    Wait Until Page Contains            ${FORM_AUTH_INVALID_PASSWORD_LABEL}



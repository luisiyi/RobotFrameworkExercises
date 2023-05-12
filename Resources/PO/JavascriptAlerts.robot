*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${JS_ALERT} =               //*[@id="content"]/div/ul/li[1]/button
${JS_PROMPT} =              //*[@id="content"]/div/ul/li[3]/button
${JS_ALERT_LABEL} =         You successfully clicked an alert
${JS_TEXT_TEST} =           testing
${JS_RESULT_TEXT} =         You entered: ${JS_TEXT_TEST}

*** Keywords ***
Click On “Click For JS Alert” Button
    Click Button                    ${JS_ALERT}

Click On Accept Button
    Handle Alert       action=ACCEPT

Validate The Result “You successfuly clicked an alert”
    Wait Until Page Contains        ${JS_ALERT_LABEL}

Click On “Click for JS Prompt” Button
    Click Button                    ${JS_PROMPT}

Fill The Text “testing”
    Input Text Into Alert           ${JS_TEXT_TEST}

Validate The Result “You entered: testing”
    Wait Until Page Contains        ${JS_RESULT_TEXT}
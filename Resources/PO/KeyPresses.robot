*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${KEY_PRESSES_INPUT} =          //*[@id="target"]
${KEY_PRESSES_SCAPE} =         You entered: ESCAPE
${KEY_PRESSES_BACK_SPACE} =         You entered: BACK_SPACE

*** Keywords ***
Click On Field And Press The Key “ESC”
    SeleniumLibrary.Press Keys           ${KEY_PRESSES_INPUT}        ESC

Validate That The “You entered: ESCAPE”
    Wait Until Page Contains        ${KEY_PRESSES_SCAPE}

Click On Field And Press The Key “Back_Space”
    SeleniumLibrary.Press Keys           ${KEY_PRESSES_INPUT}        BACK_SPACE

Validate That The “You entered: BACK_SPACE”
    Wait Until Page Contains        ${KEY_PRESSES_BACK_SPACE}

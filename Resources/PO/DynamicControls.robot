*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${DYNAMIC_CONTROLS_REMOVE_BUTTON} =             Remove
${DYNAMIC_CONTROLS_ENABLE_BUTTON} =             //*[@id="input-example"]/button
${DYNAMIC_CONTROLS_INPUT_TEXT} =                //*[@id="input-example"]/input
#${DYNAMIC_CONTROLS_CHECKBOX} =               //*[@id="checkbox"]/input


*** Keywords ***
Click On Remove Button To Checkbox Disable
    Click Button            ${DYNAMIC_CONTROLS_REMOVE_BUTTON}

Validate Checkbox Was Removed
    Wait Until Page Does Not Contain Element      ${DYNAMIC_CONTROLS_REMOVE_BUTTON}

Click On Enable Button
    Click Button            ${DYNAMIC_CONTROLS_ENABLE_BUTTON}

Validate Input Is Enable
    Wait Until Element Is Enabled       ${DYNAMIC_CONTROLS_INPUT_TEXT}

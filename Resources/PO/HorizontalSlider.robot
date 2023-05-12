*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${SLIDER} =     //*[@id="content"]/div/div/input

*** Keywords ***
Slide To Number 3.5
    Click Element At Coordinates            ${SLIDER}       20     0

Validate That Value 3.5 Is Selected
    Wait Until Page Contains    3.5

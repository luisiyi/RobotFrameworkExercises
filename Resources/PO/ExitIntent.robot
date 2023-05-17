*** Settings ***
Library    SeleniumLibrary
Library    ImageHorizonLibrary

*** Variables ***
${EXIT_INTENT} =                    //*[@id="page-footer"]/div/div/a
${MODAL_WINDOW} =                   //*[@id="ouibounce-modal"]/div[2]

*** Keywords ***
Mouse Out Of Viewport
    ${pos_x} =   Get Horizontal Position         ${EXIT_INTENT}
    ${pos_y} =   Get Vertical Position           ${EXIT_INTENT}
    Move To         ${pos_x}        ${pos_y}
    Sleep    2s
    Move To         ${pos_x}               800
    Sleep    1s


Validate That Modal Window Is Displayed
    Wait Until Element Is Visible            ${MODAL_WINDOW}

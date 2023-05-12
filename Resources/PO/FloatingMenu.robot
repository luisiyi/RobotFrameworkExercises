*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${FLOATING_MENU_FOOTER_ELEMENT} =           //*[@id="page-footer"]
${FLOATING_MENU_OPTION} =                   //*[@id="menu"]
*** Keywords ***

Scroll End To Page
    Scroll Element Into View        ${FLOATING_MENU_FOOTER_ELEMENT}

Validate Menu Option Are Visible
    Element Should Be Visible    ${FLOATING_MENU_OPTION}
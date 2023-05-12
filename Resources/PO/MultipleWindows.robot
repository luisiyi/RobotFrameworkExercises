*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${CLICK_HERE_LINK} =            //*[@id="content"]/div/a
${EVALAUTE_LABEL} =             New Window

*** Keywords ***
Click On "Click Here" Link
    Click Link                          ${CLICK_HERE_LINK}

Validate Text Displayed On New Page
    Change To The New Page
    Wait Until Page Contains            ${EVALAUTE_LABEL}
    Title Should Be                     ${EVALAUTE_LABEL}




# ${EVALAUTE_LABEL} variable is the window´s name (eyelashes)
Change To The New Page
    Switch Window                       ${EVALAUTE_LABEL}

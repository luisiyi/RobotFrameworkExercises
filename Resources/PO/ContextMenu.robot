*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${CONTEXT_MENU} =   //*[@id="hot-spot"]
${TEXT_ALERT} =     You selected a context menu

*** Keywords ***
Right Click On Box
    Open Context Menu       ${CONTEXT_MENU}
#    Execute Javascript      alert(arguments[0]);

Validate Text On Alert Is Equal To
    ${message} =   Handle Alert        action=LEAVE       timeout=None
    Log     ${message}
    Should Be Equal    ${message}   ${TEXT_ALERT}


Click On Accept Button
    Handle Alert     action=ACCEPT   timeout=None

Validate That Alert Was Closed
    Alert Should Not Be Present


# This Keyword do all the steps
Do Exercise
    Right Click On Box
    Validate Text On Alert Is Equal To
    Click On Accept Button
    Validate That Alert Was Closed

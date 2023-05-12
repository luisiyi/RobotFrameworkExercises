*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${GALLERY_BUTTON} =         //div[@id="content"]/div/ul/li[5]/a

*** Keywords ***
Refresh Until The Button Is Visible
    Wait Until Keyword Succeeds     10 x      1 sec       Reload The page Until Gallery button Appear

Refresh Until The Button Is Not Visible
    Wait Until Keyword Succeeds     10 x      1 sec       Reload The page Until Gallery button No Appear



Reload The page Until Gallery button Appear
    Reload Page
    Verify If Gallery Button Is Visible

Reload The page Until Gallery button No Appear
    Reload Page
    Verify If Gallery Button Is Not Visible



Verify If Gallery Button Is Visible
    Page Should Contain Element         ${GALLERY_BUTTON}
    Log    The button is visible!

Verify If Gallery Button Is Not Visible
    Page Should Not Contain Element     ${GALLERY_BUTTON}
    Log    The button is NOT visible!
*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${ADDREMOVE_ADD_BUTTON_ELEMENT} =           Add Element
${ADDREMOVE_DELETE_BUTTON_ELEMENT} =        //div[@id="elements"]/button[1]

*** Keywords ***
Add Element
    Repeat Keyword    20    Click Button                    ${ADDREMOVE_ADD_BUTTON_ELEMENT}

Delete Element
    Repeat Keyword    20    Click Button                    ${ADDREMOVE_DELETE_BUTTON_ELEMENT}

Verify Elements Added
    [Arguments]    ${ExpectedProductCount}
    Page Should Contain Element      //div[@id="elements"]/button[20]        ${ExpectedProductCount}


Verify Elements Deleted
    [Arguments]    ${ExpectedProductDeleted}
    Page Should Not Contain Element      ${ADDREMOVE_DELETE_BUTTON_ELEMENT}        ${ExpectedProductDeleted}

Do Exercise
    [Arguments]                 ${ExpectedProductCount}      ${ExpectedProductDeleted}
    Add Element
    Verify Elements Added       ${ExpectedProductCount}
    Delete Element
    Verify Elements Deleted     ${ExpectedProductDeleted}
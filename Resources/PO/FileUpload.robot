*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${CHOOSE_FILE_BUTTON} =         //*[@id="file-upload"]
${FILE_UPLOAD_NAME} =           test.txt
${FILE_UPLOAD_BUTTON} =         //*[@id="file-submit"]
${FILE_UPLOAD_SUCCESSFUL} =     File Uploaded!

*** Keywords ***
Upload The File "test.txt"
    ${full} =   Set Variable            ${EXECDIR}${/}Upload${/}${FILE_UPLOAD_NAME}
    ${path}     Normalize Path          ${full}
    Choose File                         ${CHOOSE_FILE_BUTTON}       ${path}
    Click On "Upload" Button


Validate That File Was Uploaded
    Wait Until Page Contains            ${FILE_UPLOAD_SUCCESSFUL}


Click On "Upload" Button
    Click Element                       ${FILE_UPLOAD_BUTTON}

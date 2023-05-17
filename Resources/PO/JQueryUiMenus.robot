*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem

*** Variables ***
${JQUERY_ENABLED_BUTTON} =              //*[@id="ui-id-3"]/a
${JQUERY_DOWNLOADS_BUTTON} =            //*[@id="ui-id-4"]/a
${JQUERY_EXCEL_OPTION_BUTTON} =         //*[@id="ui-id-7"]/a
${JQUERY_FILE_NAME} =                   menu.xls
${JQUERY_EXCEL_PATH} =                  ${EXECDIR}${/}Download${/}${JQUERY_FILE_NAME}
*** Keywords ***
Click On The "Enabled" Option
    Mouse Over          ${JQUERY_ENABLED_BUTTON}
    Click Link          ${JQUERY_ENABLED_BUTTON}

Click On The "Downloads" Option
    Mouse Over          ${JQUERY_DOWNLOADS_BUTTON}
    Click Link          ${JQUERY_DOWNLOADS_BUTTON}

Click On The "Excel" Option
    Mouse Over          ${JQUERY_EXCEL_OPTION_BUTTON}
    Click Link          ${JQUERY_EXCEL_OPTION_BUTTON}


Validate That Excel File Was Downloaded
    Wait Until Created      ${JQUERY_EXCEL_PATH}
    File Should Exist       ${JQUERY_EXCEL_PATH}

*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Library    Collections
*** Variables ***

*** Keywords ***
Download Each File
    ${List} =   Create List
    FOR  ${i}  IN RANGE  1  6
        ${text} =       SeleniumLibrary.Get Text        //*[@id="content"]/div/a[${i}]
        Insert Into List        ${List}         ${i}        ${text}
    END
    FOR  ${i}  IN RANGE  5
        Click Link      ${List}[${i}]
        Wait Until Created          ${EXECDIR}${/}Download${/}${List}[${i}]
    END
    RETURN      ${List}

Validate Each File Was Downloaded
    ${Files_List} =  List Directory      ${EXECDIR}${/}Download${/}
    FOR  ${i}  IN RANGE  5
        File Should Exist       ${EXECDIR}${/}Download${/}${Files_List}[${i}]
    END


#Download Each File
#    FOR  ${i}  IN RANGE  1  6
##        Click Link      //*[@id="content"]/div/a[${i}]
#        ${text} =       SeleniumLibrary.Get Text        //*[@id="content"]/div/a[${i}]
#        Log    ${text}  error
#        Sleep    1s
#    END
#
#Validate Each File Was Downloaded
#    [Arguments]     ${ALL_FILES_DOWNLOAD_EXPECTED}
#    FOR     ${i}  IN    @{ALL_FILES_DOWNLOAD_EXPECTED.keys()}
#        File Should Exist        ${ALL_FILES_DOWNLOAD_EXPECTED['${i}']}
#    END

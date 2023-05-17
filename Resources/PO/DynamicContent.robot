*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Variables ***

${DYNAMIC_CONTENT_IMG1} =       //*[@id="content"]/div[1]/div[1]/img
${DYNAMIC_CONTENT_IMG2} =       //*[@id="content"]/div[2]/div[1]/img
${DYNAMIC_CONTENT_IMG3} =       //*[@id="content"]/div[3]/div[1]/img


*** Keywords ***
Refresh Page Until All The Images Appears At Least One Time
    Reload Page


Entering The First Five Images Into A List
    ${First_5_Images} =     Create List

    ${length} =     Get Length    ${First_5_Images}
    WHILE       'TRUE'
        IF    ${length} == 0
            ${src} =    Get Element Attribute       ${DYNAMIC_CONTENT_IMG1}     src
            Append In List      ${First_5_Images}       ${src}
        END
        Refresh Page Until All The Images Appears At Least One Time
        FOR  ${i}  IN RANGE   1     4
            ${src} =    Get Element Attribute       ${DYNAMIC_CONTENT_IMG${i}}     src
            FOR    ${j}  IN  @{First_5_Images}
                IF    '${src}' != '${j}'
                    ${status} =  Run Keyword And Return Status    List Should Not Contain Value        ${First_5_Images}    ${src}
                    IF    '${status}' != '${FALSE}'
                        Append In List      ${First_5_Images}       ${src}
#                    ELSE
#                        Remove In List    ${First_5_Images}     ${src}
#                        Log    Inside remove  warn
                    END
                END
                ${length} =     Get Length    ${First_5_Images}
                Exit For Loop If        ${length}==5
            END
            ${length} =     Get Length    ${First_5_Images}
            Exit For Loop If        ${length}==5
        END
        ${length} =     Get Length    ${First_5_Images}
        Exit For Loop If        ${length}==5

    END
    Validate All The Values Into List
#    Log List     ${First_5_Images}   error


Append In List
    [Arguments]    ${First_5_Images}        ${src}
    Append To List         ${First_5_Images}         ${src}

Validate All The Values Into List
    Log    In page already appear 5 differents images     error


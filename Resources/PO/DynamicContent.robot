*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Variables ***
#${IMG_1} =      src="/img/avatars/Original-Facebook-Geek-Profile-Avatar-1.jpg"
#${IMG_2} =      src="/img/avatars/Original-Facebook-Geek-Profile-Avatar-2.jpg"
#${IMG_3} =      src="/img/avatars/Original-Facebook-Geek-Profile-Avatar-3.jpg"
#${IMG_5} =      src="/img/avatars/Original-Facebook-Geek-Profile-Avatar-5.jpg"
#${IMG_6} =      src="/img/avatars/Original-Facebook-Geek-Profile-Avatar-6.jpg"
#${IMG_7} =      src="/img/avatars/Original-Facebook-Geek-Profile-Avatar-7.jpg"

${DYNAMIC_CONTENT_IMG1} =       //*[@id="content"]/div[1]/div[1]/img
${DYNAMIC_CONTENT_IMG2} =       //*[@id="content"]/div[2]/div[1]/img
${DYNAMIC_CONTENT_IMG3} =       //*[@id="content"]/div[3]/div[1]/img


*** Keywords ***
Refresh Page Until All The Images Appears At Least One Time
    Reload Page

Count All The Images
#    ${CNT_IMG_1} =      Image Count    ${IMG_1}
    ${item_1} =     Get From List       1       ${test}
    Log         ${item_1}

# This Keywork is useful to Enter the first different five images into a list and after evaluate the lenght of the list that need to be equal to 5
Entering The First Five Images Into A List
    ${First_5_Images} =     Create List

    ${length} =     Get Length    ${First_5_Images}
    WHILE       'TRUE'
        Refresh Page Until All The Images Appears At Least One Time
        FOR  ${i}  IN RANGE   1     4
            ${src} =    Get Element Attribute       ${DYNAMIC_CONTENT_IMG${i}}     src
            ${length} =     Get Length    ${First_5_Images}
            IF    ${length} ==  0
                Append In List      ${First_5_Images}       ${src}
            ELSE IF
                Validate Current Value      ${First_5_Images}       ${src}
            # Bring me the current values in the list and evaluate the current src with
#            Append In List      ${First_5_Images}       ${src}
            Log List     ${First_5_Images}   error
            ${length} =     Get Length    ${First_5_Images}
            Exit For Loop If        ${length}==5
        END
        ${length} =     Get Length    ${First_5_Images}
        Exit For Loop If        ${length}==5
    END
    Log     While Outside   error
#    Run Keyword If    ${length}

Append In List
    [Arguments]    ${First_5_Images}        ${src}
    Append To List         ${First_5_Images}         ${src}

Validate Current Value
    [Arguments]    ${First_5_Images}        ${src}
    Should Not Contain    

#    WHILE       ${First_5_Images}
#    Refresh Page Until All The Images Appears At Least One Time
#
#    ${src1} =    Get Element Attribute       ${DYNAMIC_CONTENT_IMG1}     src
#    ${src2} =    Get Element Attribute       ${DYNAMIC_CONTENT_IMG2}     src
#    ${src3} =    Get Element Attribute       ${DYNAMIC_CONTENT_IMG3}     src
#    Log    ${src1}   error
#    Log    ${src2}   error
#    Log    ${src3}   error
#Append To List         ${First_5_Images}         ${src}

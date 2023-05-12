*** Settings ***
Library    SeleniumLibrary
Library    Browser

*** Variables ***
${HOME_HEADER_LABEL} =              Welcome to the-internet
${LINK_ADD_DELETE} =                //*[@id="content"]/ul/li[2]/a
${LINK_BROKEN_IMAGES} =             //*[@id="content"]/ul/li[4]/a
${LINK_BASIC_AUTH} =                //*[@id="content"]/ul/li[3]/a
${LINK_CHECKBOXES} =                //*[@id="content"]/ul/li[6]/a
${LINK_CONTEXT_MENU} =              //*[@id="content"]/ul/li[7]/a
${LINK_DISAPPEARING_ELEMENTS} =     //*[@id="content"]/ul/li[9]/a
${LINK_DRAG_AND_DROP} =             //*[@id="content"]/ul/li[10]/a
${LINK_DYNAMIC_CONTENT} =           //*[@id="content"]/ul/li[12]/a
${LINK_DYNAMIC_CONTROLS} =          //*[@id="content"]/ul/li[13]/a
${LINK_EXIT_INTENT} =               //*[@id="content"]/ul/li[16]/a
${LINK_FILE_DOWNLOAD} =             //*[@id="content"]/ul/li[17]/a
${LINK_FILE_UPLOAD} =               //*[@id="content"]/ul/li[18]/a
${LINK_FLOATING_MENU} =             //*[@id="content"]/ul/li[19]/a
${LINK_FORM_AUTHENTICATION} =       //*[@id="content"]/ul/li[21]/a
${LINK_HORIZONTAL_SLIDER} =         //*[@id="content"]/ul/li[24]/a
${LINK_JQUERY_UI_MENUS} =           //*[@id="content"]/ul/li[28]/a
${LINK_JAVASCRIPT_ALERTS} =         //*[@id="content"]/ul/li[29]/a
${LINK_KEY_PRESSES} =               //*[@id="content"]/ul/li[31]/a
${LINK_MULTIPLE_WINDOWS} =          //*[@id="content"]/ul/li[33]/a


*** Keywords ***
Navigate To
    SeleniumLibrary.Go To                       ${BASE_URL}

Verify Page Loaded
    wait until page contains    ${HOME_HEADER_LABEL}

Go To Add/Elements Link
    Navigate To
    Verify Page Loaded
    Click Link                      ${LINK_ADD_DELETE}

Go To Broken Images Link
    Navigate To
    Verify Page Loaded
    Click Link                      ${LINK_BROKEN_IMAGES}

Go To Basic Auth Link
    Navigate To
    Verify Page Loaded
    Click Link                      ${LINK_BASIC_AUTH}

Go To Checkboxes Link
    Navigate To
    Verify Page Loaded
    Click Link                      ${LINK_CHECKBOXES}

Go To Context Menu Link
    Navigate To
    Verify Page Loaded
    Click Link                      ${LINK_CONTEXT_MENU}

Go To Disappearing Elements Link
    Navigate To
    Verify Page Loaded
    Click Link                      ${LINK_DISAPPEARING_ELEMENTS}

Go To Drag And Drop Link
    Navigate To
    Verify Page Loaded
    Click Link                      ${LINK_DRAG_AND_DROP}

Go To Dynamic Content Link
    Navigate To
    Verify Page Loaded
    Click Link                      ${LINK_DYNAMIC_CONTENT}

Go To Dynamic Controls Link
    Navigate To
    Verify Page Loaded
    Click Link                      ${LINK_DYNAMIC_CONTROLS}

Go To Exit Intent Link
    Navigate To
    Verify Page Loaded
    Click Link                      ${LINK_EXIT_INTENT}

Go To File Download Link
    Navigate To
    Verify Page Loaded
    Click Link                      ${LINK_FILE_DOWNLOAD}

Go To File Upload Link
    Navigate To
    Verify Page Loaded
    Click Link                      ${LINK_FILE_UPLOAD}


Go To Floating Menu Link
    Navigate To
    Verify Page Loaded
    Click Link                      ${LINK_FLOATING_MENU}

Go To Form Authentication Link
    Navigate To
    Verify Page Loaded
    Click Link                      ${LINK_FORM_AUTHENTICATION}

Go To Horizontal Slider Link
    Navigate To
    Verify Page Loaded
    Click Link                      ${LINK_HORIZONTAL_SLIDER}

Go To JQuery UI Menu Link
    Navigate To
    Verify Page Loaded
    Click Link                      ${LINK_JQUERY_UI_MENUS}

Go To Javascript Alerts Link
    Navigate To
    Verify Page Loaded
    Click Link                      ${LINK_JAVASCRIPT_ALERTS}

Go To Key Presses Link
    Navigate To
    Verify Page Loaded
    Click Link                      ${LINK_KEY_PRESSES}

Go To Multiple Windows Link
    Navigate To
    Verify Page Loaded
    Click Link                      ${LINK_MULTIPLE_WINDOWS}

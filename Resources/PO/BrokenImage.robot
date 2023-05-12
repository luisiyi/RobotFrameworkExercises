*** Settings ***
Library    SeleniumLibrary
Library    RequestsLibrary

*** Variables ***
${BROKEN_IMAGE_1} =         //div[@id="content"]/div/img[1]
${BROKEN_IMAGE_2} =         //div[@id="content"]/div/img[2]
${NOT_BROKEN_IMAGE_3} =     //div[@id="content"]/div/img[3]
${STATUS_404} =             404
${STATUS_200} =             200

*** Keywords ***
Validate Number Images Broken Are 2
    ${img1} =       Get Element Attribute       ${BROKEN_IMAGE_1}   src
    ${img2} =       Get Element Attribute       ${BROKEN_IMAGE_2}   src

    ${response_img1} =      GET    ${img1}  expected_status=${STATUS_404}
    ${response_img2} =      GET    ${img2}  expected_status=${STATUS_404}

Validate Number Images With A Link Available Is 1
    ${img3} =               Get Element Attribute       ${NOT_BROKEN_IMAGE_3}   src

    ${response_img3} =      GET    ${img3}  expected_status=${STATUS_200}


*** Settings ***
Library    SeleniumLibrary
Library    ImageHorizonLibrary

*** Variables ***
${DRAG_AND_DROP_ELEMENT_A} =        //*[@id="column-a"]/header
${DRAG_AND_DROP_ELEMENT_B} =        //*[@id="column-b"]/header

*** Keywords ***
Drag And Drop BoxA To BoxB
    ImageHorizonLibrary.Move To                            550     250
    ImageHorizonLibrary.Mouse Down                         button=left
    ImageHorizonLibrary.Move To                            700      250
    ImageHorizonLibrary.Mouse Down                         button=left
    ImageHorizonLibrary.Mouse Up                           button=left
    Sleep    2s

Validate Boxes Were Changed A To B
    Element Text Should Be          ${DRAG_AND_DROP_ELEMENT_B}      expected=A
    Sleep   3s

Drag And Drop BoxB To BoxA
    ImageHorizonLibrary.Move To                            700      250
    ImageHorizonLibrary.Mouse Down                         button=left
    ImageHorizonLibrary.Move To                            550     250
    ImageHorizonLibrary.Mouse Down                         button=left
    ImageHorizonLibrary.Mouse Up                           button=left
    Sleep    2s

Validate Boxes Were Changed B To A
    Element Text Should Be          ${DRAG_AND_DROP_ELEMENT_A}      expected=A
    Sleep   3s
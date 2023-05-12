*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${CHECKBOX_1} =     //*[@id="checkboxes"]/input[1]
${CHECKBOX_2} =     //*[@id="checkboxes"]/input[2]

*** Keywords ***
Select Checkbox1
    Select Checkbox       ${CHECKBOX_1}

Unselect Checkbox1
    Unselect Checkbox     ${CHECKBOX_1}

Select Checkbox2
    Select Checkbox       ${CHECKBOX_2}

Unselect Checkbox2
    Unselect Checkbox     ${CHECKBOX_2}

Verify If Checkbox1 Was Checked
    ${value} =  Get Element Attribute          ${CHECKBOX_1}        checked
    Run Keyword If      "${value}" == "true"            Checkbox1 Selected
    ...     ELSE                                        Checkbox1 Unselected

Verify If Checkbox2 Was Checked
    ${value} =  Get Element Attribute          ${CHECKBOX_2}        checked
    Run Keyword If      "${value}" == "true"            Checkbox2 Selected
    ...     ELSE                                        Checkbox2 Unselected

Validate that the checkboxes were checked
    Verify If Checkbox1 Was Checked
    Verify If Checkbox2 Was Checked


Checkbox1 Selected
    Log    Checkbox1 was selected Successfully

Checkbox1 Unselected
    Log    Checkbox1 was not selected

Checkbox2 Selected
    Log    Checkbox2 was selected Successfully

Checkbox2 Unselected
    Log    Checkbox2 was not selected
*** Settings ***
Documentation       This project is about Exercisie Automated Testing in http://moodle/mod/assign/view.php?id=1825
Resource            ../Resources/PO/AddRemoveElements.robot
Resource            ../Resources/PO/BasicAuth.robot
Resource            ../Resources/PO/BrokenImage.robot
Resource            ../Resources/PO/CheckBoxes.robot
Resource            ../Resources/PO/ContextMenu.robot
Resource            ../Resources/PO/DisappearingElements.robot
Resource            ../Resources/PO/DragAndDrop.robot
Resource            ../Resources/PO/DynamicContent.robot
Resource            ../Resources/PO/DynamicControls.robot
Resource            ../Resources/PO/ExitIntent.robot
Resource            ../Resources/PO/FileDownload.robot
Resource            ../Resources/PO/FileUpload.robot
Resource            ../Resources/PO/FloatingMenu.robot
Resource            ../Resources/PO/FormAuthentication.robot
Resource            ../Resources/PO/HorizontalSlider.robot
Resource            ../Resources/PO/JavascriptAlerts.robot
Resource            ../Resources/PO/JQueryUiMenus.robot
Resource            ../Resources/PO/KeyPresses.robot
Resource            ../Resources/PO/LandingPage.robot
Resource            ../Resources/PO/MultipleWindows.robot
Resource            ../Resources/Common.robot
Test Setup          Begin Web Test
Test Teardown       End Web Test

*** Variables ***
${BROWSER} =                         gc
${BASE_URL} =                        https://the-internet.herokuapp.com/


${FORM_AUTH_VALID_USERNAME} =                   tomsmith
${FORM_AUTH_VALID_PASSWORD} =                   SuperSecretPassword!
${FORM_AUTH_INVALID_USERNAME} =                 tomsmith1
${FORM_AUTH_INVALID_PASSWORD} =                 SuperS1ecretPassword!


# These lines are already no necessary
${NAME_FILE_TEXT9} =                    Text9.txt
${NAME_FILE_MINDMAP} =                  mind map.gif
${NAME_FILE_TEXT6} =                    Text6.txt
${NAME_FILE_UPLOADTEXTFILE} =           UploadTextFile.txt
${NAME_FILE_SERENE} =                   serene.jpg
&{ALL_FILES_DOWNLOAD_EXPECTED} =        File_1=${EXECDIR}${/}Download${/}${NAME_FILE_TEXT9}     File_2=${EXECDIR}${/}Download${/}${NAME_FILE_MINDMAP}      File_3=${EXECDIR}${/}Download${/}${NAME_FILE_TEXT6}     File_4=${EXECDIR}${/}Download${/}${NAME_FILE_UPLOADTEXTFILE}        File_5=${EXECDIR}${/}Download${/}${NAME_FILE_SERENE}



*** Test Cases ***
Add Remove Elements
    [Documentation]    Test to add and remove elements
    [Tags]              Add/RemoveElements
    LandingPage.Go To Add/Elements Link
    AddRemoveElements.Add Element
    AddRemoveElements.Verify Elements Added     20
    AddRemoveElements.Delete Element
    AddRemoveElements.Verify Elements Deleted   0

Broken Images
    [Documentation]    Test to verify broken images
    [Tags]              BrokenImages
    LandingPage.Go To Broken Images Link
    BrokenImage.Validate Number Images Broken Are 2
    BrokenImage.Validate Number Images With A Link Available Is 1


Basic Auth
    [Documentation]    Test to Login in the page
    [Tags]              BasicAuth
#    [Arguments]         ${VALID_LOGIN_EMAIL}    ${VALID_LOGIN_PASSWORD}
    LandingPAge.Go To Basic Auth Link
    BasicAuth.Login With Valid Credentials
    BasicAuth.Validate Authentication Was Successful
    BasicAuth.Login With Invalid Credentials
    BasicAuth.Validate Authentication Was Unsuccessful


Checkboxes
    [Documentation]    Test to validate the checkbox was selected
    [Tags]              Checkboxes
    LandingPAge.Go To Checkboxes Link
    CheckBoxes.Select Checkbox1
    CheckBoxes.Verify If Checkbox1 Was Checked
    CheckBoxes.Unselect Checkbox2
    CheckBoxes.Verify If Checkbox2 Was Checked
#    CheckBoxes.Validate that the checkboxes were checked

Context Menu
    [Documentation]    Test to validate if appear an alert after right click on a square
    [Tags]              ContextMenu
    LandingPage.Go To Context Menu Link
    ContextMenu.Right Click On Box
    ContextMenu.Validate Text On Alert Is Equal To
    ContextMenu.Click On Accept Button
    ContextMenu.Validate That Alert Was Closed

Disappearing Elements
    [Documentation]    Test to validate when the Gallery Button is Visible
    [Tags]              DisappearingElements    GalleryButton
    LandingPage.Go To Disappearing Elements Link
    DisappearingElements.Refresh Until The Button Is Visible
    DisappearingElements.Refresh Until The Button Is Not Visible

Drag And Drop
    [Documentation]    Test to validate when drag and drop the A and B boxes
    [Tags]              DragAndDrop
    LandingPage.Go To Drag And Drop Link
    DragAndDrop.Drag And Drop BoxA To BoxB
    DragAndDrop.Validate Boxes Were Changed A To B
    DragAndDrop.Drag And Drop BoxB To BoxA
    DragAndDrop.Validate Boxes Were Changed B To A

Dynamic Content
    [Documentation]    Test to validate all the images appear at least once
    [Tags]              DynamicContent
    LandingPage.Go To Dynamic Content Link
    DynamicContent.Entering The First Five Images Into A List

Dynamic Controls
    [Documentation]    Test to validate if the elements is unnabled with the buttons
    [Tags]              DynamicControls
    LandingPage.Go To Dynamic Controls Link
    DynamicControls.Click On Remove Button To Checkbox Disable
    DynamicControls.Validate Checkbox Was Removed
    DynamicControls.Click On Enable Button
    DynamicControls.Validate Input is enable

Exit Intent
    [Documentation]    Test to validate a modal window appear when the mouse is out of the viewport
    [Tags]              ExitIntent
    LandingPage.Go To Exit Intent Link
    ExitIntent.Mouse Out Of Viewport
    ExitIntent.Validate That Modal Window Is Displayed

File Download
    [Documentation]    Test to validate each file download
    [Tags]              FileDownload
    LandingPage.Go To File Download Link
    FileDownload.Download Each File
    FileDownload.Validate Each File Was Downloaded
#    FileDownload.Validate Each File Was Downloaded      ${ALL_FILES_DOWNLOAD_EXPECTED}
#    FileDownload.Make The List
#    FileDownload.Obtain All The Files

File Upload
    [Documentation]     Test to validate when it upload a file
    [Tags]              FileUpload
    LandingPage.Go To File Upload Link
    FileUpload.Upload The File "test.txt"
    FileUpload.Validate That File Was Uploaded

Floating Menu
    [Documentation]    Test to validate if the menu still appearing when scroll to page end
    [Tags]              FloatingMenu        ScrollDown
    LandingPage.Go To Floating Menu Link
    FloatingMenu.Scroll End To Page
    FloatingMenu.Validate Menu Option Are Visible

Form Authentication
    [Documentation]    Test to login with differents credentials
    [Tags]              FormAuthentication
    LandingPage.Go To Form Authentication Link
    FormAuthentication.Type Right Credentials In The Fields         ${FORM_AUTH_VALID_USERNAME}         ${FORM_AUTH_VALID_PASSWORD}
    FormAuthentication.Click "Login" Button
    FormAuthentication.Validate The Login Was Successful
    FormAuthentication.Click "Logout" Button
    FormAuthentication.Validate The Logout Was Successful
    FormAuthentication.Type Bad Credentials In Username Field       ${FORM_AUTH_INVALID_USERNAME}       ${FORM_AUTH_VALID_PASSWORD}
    FormAuthentication.Click "Login" Button
    FormAuthentication.Validate The Username Was Invalid
    FormAuthentication.Type Bad Credentials In Password Field       ${FORM_AUTH_VALID_USERNAME}       ${FORM_AUTH_INVALID_PASSWORD}
    FormAuthentication.Click "Login" Button
    FormAuthentication.Validate The Password Was Invalid

Horizontal Slider
    [Documentation]    Test to validate when move the slider 3.5 to right
    [Tags]              HorizontalSlider    Slider
    LandingPage.Go To Horizontal Slider Link
    HorizontalSlider.Slide To Number 3.5
    HorizontalSlider.Validate That Value 3.5 Is Selected

JQuery UI Menus
    [Documentation]    Test to validate a file when it is downloaded.
    [Tags]              JQueryMenu      DownloadFile
    LandingPage.Go To JQuery UI Menu Link
    JQueryUiMenus.Click On The "Enabled" Option
    JQueryUiMenus.Click On The "Downloads" Option
    JQueryUiMenus.Click On The "Excel" Option
    JQueryUiMenus.Validate That Excel File Was Downloaded

JavaScript Alerts
    [Documentation]    Test to validate the Javascripts alerts
    [Tags]              JavascriptAlerts    Alerts
    LandingPage.Go To Javascript Alerts Link
    JavascriptAlerts.Click On “Click For JS Alert” Button
    JavascriptAlerts.Click On Accept Button
    JavascriptAlerts.Validate The Result “You successfuly clicked an alert”
    JavascriptAlerts.Click On “Click for JS Prompt” Button
    JavascriptAlerts.Fill The Text “testing”
    JavascriptAlerts.Validate The Result “You entered: testing”

Key Presses
    [Documentation]    Test to validate the keys pressed
    [Tags]              KeyPresses
    LandingPage.Go To Key Presses Link
    KeyPresses.Click On Field And Press The Key “ESC”
    KeyPresses.Validate That The “You entered: ESCAPE”
    KeyPresses.Click On Field And Press The Key “Back_Space”
    KeyPresses.Validate That The “You entered: BACK_SPACE”

Multiple Windows
    [Documentation]    Test to validate the text on the new page
    [Tags]              MultipleWindows
    LandingPage.Go To Multiple Windows Link
    MultipleWindows.Click On "Click Here" Link
    MultipleWindows.Validate Text Displayed On New Page


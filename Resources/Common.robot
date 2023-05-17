*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem



*** Variables ***

*** Keywords ***
Begin Web Test

    ${full} =  Set Variable     ${EXECDIR}${/}Download${/}
    ${path}  Normalize Path     ${full}

    ${prefs} =  Create Dictionary   download.default_directory=${path}  download.prompt_for_download=${FALSE}   download.directory_upgrade=${TRUE}    safebrowsing.enabled=${TRUE}      profile.default_content_settings.popups=1       profile.default_content_setting_values.automatic_downloads=1

#    set selenium speed           0.5s
    set selenium speed           0.01s
    #set selenium timeout        10s

    SeleniumLibrary.open browser                about:blanck    ${BROWSER}      options=add_experimental_option("prefs",${prefs})

    # resize browser window for recording
    Set window position         x=-5     y=0
    set window size             width=1920    height=1080
    #Sleep                      5 s



End Web Test
    close all browsers

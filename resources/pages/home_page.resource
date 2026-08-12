*** Settings ***
Library    Browser

*** Variables ***
${HOME_WELCOME_TEXT}        css=h1
${HOME_LOGOUT_BUTTON}       text=Sign Out
${HOME_USER_MENU}           css=.user-menu
${HOME_USERS_LINK}          text=Users

*** Keywords ***
Should See Home Page
    [Documentation]    Validates that the home page is visible
    Wait For Elements State    ${HOME_WELCOME_TEXT}    visible

Logout
    [Documentation]    Performs logout from the application
    Click    ${HOME_USER_MENU}
    Click    ${HOME_LOGOUT_BUTTON}

Navigate To Users Page
    [Documentation]    Navigates to the users page
    Click    ${HOME_USERS_LINK}

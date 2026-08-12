*** Settings ***
Library    Browser

*** Variables ***
${LOGIN_EMAIL_INPUT}        css=input[type="email"]
${LOGIN_PASSWORD_INPUT}     css=input[type="password"]
${LOGIN_BUTTON}             css=button:has-text("Entrar")
${LOGIN_ERROR_MESSAGE}      css=.error-message
${LOGIN_REGISTER_LINK}      text=Cadastre-se

*** Keywords ***
Enter Login Credentials
    [Arguments]    ${email}    ${password}
    [Documentation]    Fills email and password fields and clicks login button
    Fill Text    ${LOGIN_EMAIL_INPUT}    ${email}
    Fill Text    ${LOGIN_PASSWORD_INPUT}    ${password}
    Click    ${LOGIN_BUTTON}

Should See Login Error Message
    [Documentation]    Validates that error message is displayed
    Wait For Elements State    ${LOGIN_ERROR_MESSAGE}    visible
    Get Text    ${LOGIN_ERROR_MESSAGE}

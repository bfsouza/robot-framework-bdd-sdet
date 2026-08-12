*** Settings ***
Documentation    Login tests for the ServeRest application
Resource         ../resources/base.resource
Resource         ../resources/pages/login_page.resource
Resource         ../resources/pages/home_page.resource
Resource         ../resources/fixtures/test_data.resource

Suite Setup      Open Browser To Application
Suite Teardown   Close Application

*** Test Cases ***
Login With Valid Credentials
    [Documentation]    Validates successful login with correct credentials
    Enter Login Credentials    ${VALID_USER_EMAIL}    ${VALID_USER_PASSWORD}
    Should See Home Page

Login With Invalid Email
    [Documentation]    Validates that login fails with invalid email
    Enter Login Credentials    ${INVALID_EMAIL}    ${VALID_USER_PASSWORD}
    Should See Login Error Message

Login With Empty Password
    [Documentation]    Validates that login fails with empty password
    Enter Login Credentials    ${VALID_USER_EMAIL}    ${INVALID_PASSWORD}
    Should See Login Error Message

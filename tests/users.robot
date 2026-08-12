*** Settings ***
Documentation    User management tests for the ServeRest application
Resource         ../resources/base.resource
Resource         ../resources/pages/login_page.resource
Resource         ../resources/pages/home_page.resource
Resource         ../resources/fixtures/test_data.resource

Suite Setup      Run Keywords
...              Open Browser To Application
...              AND
...              Enter Login Credentials    ${VALID_USER_EMAIL}    ${VALID_USER_PASSWORD}
Suite Teardown   Close Application

*** Test Cases ***
List Users
    [Documentation]    Navigates to users page and validates listing
    Navigate To Users Page
    Wait For Elements State    css=table    visible

Logout From Application
    [Documentation]    Validates successful logout
    Logout
    # After logout, should return to login page
    Wait For Elements State    css=input[type="email"]    visible

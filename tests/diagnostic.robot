*** Settings ***
Documentation    Diagnostic test to inspect ServeRest UI structure and find correct locators
Library    Browser

*** Test Cases ***
Inspect Login Page Structure
    [Documentation]    Opens the login page and prints the HTML structure to find correct locators
    New Browser    chromium    headless=True
    New Page    https://front.serverest.dev
    Set Viewport Size    1920    1080
    
    # Print page title
    ${title}=    Get Title
    Log    Page Title: ${title}
    
    # Print all text content
    ${text}=    Get Text    body
    Log    Page Text (first 1000 chars): ${text[:1000]}
    
    # Try to find error message elements with different selectors
    Log    ===== Searching for error message selectors =====
    
    # Common error selectors
    @{selectors}=    Create List
    ...    .error-message
    ...    .error
    ...    [class*="error"]
    ...    div.alert
    ...    div.alert-error
    ...    .alert-danger
    ...    .text-danger
    ...    [role="alert"]
    ...    span.text-danger
    ...    p.text-danger
    
    FOR    ${selector}    IN    @{selectors}
        ${status}=    Run Keyword And Ignore Error    Get Element Count    ${selector}
        Log    Selector "${selector}" status: ${status}
    END
    
    # Try to find "Users" link with different selectors
    Log    ===== Searching for Users link selectors =====
    
    @{user_selectors}=    Create List
    ...    text=Users
    ...    text=Usuários
    ...    a:has-text("Users")
    ...    a:has-text("Usuários")
    ...    [href*="users"]
    ...    [href*="user"]
    ...    button:has-text("Users")
    ...    button:has-text("Usuários")
    
    FOR    ${selector}    IN    @{user_selectors}
        ${status}=    Run Keyword And Ignore Error    Get Element Count    ${selector}
        Log    Selector "${selector}" status: ${status}
    END
    
    # Try to find logout/menu elements
    Log    ===== Searching for User Menu/Logout selectors =====
    
    @{menu_selectors}=    Create List
    ...    .user-menu
    ...    [class*="menu"]
    ...    [class*="user"]
    ...    button:has-text("Sair")
    ...    button:has-text("Sign Out")
    ...    button:has-text("Logout")
    ...    a:has-text("Sair")
    ...    a:has-text("Sign Out")
    
    FOR    ${selector}    IN    @{menu_selectors}
        ${status}=    Run Keyword And Ignore Error    Get Element Count    ${selector}
        Log    Selector "${selector}" status: ${status}
    END
    
    Close Browser
    
    Log    ===== Diagnostic Complete =====
    Log    Check the log.html for elements found on the page

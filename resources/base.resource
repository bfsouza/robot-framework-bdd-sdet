*** Settings ***
Library    Browser
Library    Collections

*** Variables ***
${HEADLESS}    True

*** Keywords ***
Open Browser To Application
    [Documentation]    Opens the browser in the ServeRest application
    New Browser    chromium    headless=${HEADLESS}
    New Page    https://front.serverest.dev
    Set Viewport Size    1920    1080

Close Application
    [Documentation]    Closes the browser
    Close Browser

*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${DEODORANTS_SELECTOR}    xpath=//label[@for="Deodorants"]
${CONFIRM_BUTTON}         css:.css-dq901w-MuiButtonBase-root-MuiButton-root
${FIRST_CHECKBOX}    xpath=(//fieldset//input[@type="checkbox"])[1]
${MOVE_ON_ICON}    css:div[class*="px-2"]

*** Keywords ***

Select Deodorant Category
    Wait Until Element Is Visible    ${DEODORANTS_SELECTOR}    60s
    Scroll Element Into View         ${DEODORANTS_SELECTOR}
    Click Element                    ${DEODORANTS_SELECTOR}
   
Confirm Product Selection
    Wait Until Element Is Visible    ${CONFIRM_BUTTON}    30s
    Scroll Element Into View         ${CONFIRM_BUTTON}
    Click Element                    ${CONFIRM_BUTTON}

Select First Checkbox
    Wait Until Element Is Visible    xpath=//fieldset    60s
    Sleep    5s
    Click Element    ${FIRST_CHECKBOX}
    Checkbox Should Be Selected    ${FIRST_CHECKBOX}

Click Move On icon 
    Sleep    5s    # Give page time to render
    Wait Until Page Contains Element    css:[class*="px-2"]    30s
    Execute JavaScript    document.querySelector('[class*="px-2 py-1"]').click();
    Sleep    5s
    
Zoom Out Page
    [Arguments]    ${level}=67%
    Execute JavaScript    document.body.style.zoom='${level}'    
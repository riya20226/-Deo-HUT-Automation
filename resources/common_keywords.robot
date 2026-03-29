*** Settings ***
Library    SeleniumLibrary    screenshot_root_directory=results/screenshots
Library    String

*** Keywords ***
Wait For Loader To Disappear
    Wait Until Element Is Not Visible    xpath=//div[contains(@class,'loader-container')]    30s
    Sleep    1s
    
# Select Checkbox By Value
#     [Arguments]    ${checkbox_value}

#     # ${input_locator}=    Set Variable    xpath=//input[@value='${checkbox_value}']
#     # ${click_locator}=    Set Variable    xpath=//input[@value='${checkbox_value}']/parent::span

#     # 1. Wait for it to exist in the DOM (Ignores opacity/visibility CSS)
#     Wait Until Keyword Succeeds    5x    2s
#     ...    Wait Until Page Contains Element    ${input_locator}    10s

#     # 2. Scroll the element into view
#     Scroll Element Into View    ${input_locator}
#     Sleep    1s    # Small buffer to ensure scrolling stops and UI catches up

#     # 3. Try clicking the parent span (the visible part of the MUI checkbox)
#     ${status}=    Run Keyword And Return Status
#     ...    Click Element    ${click_locator}

#     # 4. JS fallback (clicks the hidden input directly if normal click is intercepted)
#     Run Keyword If    not ${status}
#     ...    Execute JavaScript
#     ...    document.querySelector("input[value='${checkbox_value}']").click()

Select Checkbox By Value
    [Arguments]    ${checkbox_value}

    ${input_locator}=    Replace String    ${CHECKBOX_INPUT}    {}    ${checkbox_value}
    ${click_locator}=    Replace String    ${CHECKBOX_CLICK}    {}    ${checkbox_value}

    Wait Until Keyword Succeeds    5x    2s
    ...    Wait Until Page Contains Element    ${input_locator}    10s

    Scroll Element Into View    ${input_locator}
    Sleep    1s

    ${status}=    Run Keyword And Return Status
    ...    Click Element    ${click_locator}

    Run Keyword If    not ${status}
    ...    Execute JavaScript
    ...    document.querySelector("input[value='${checkbox_value}']").click()    

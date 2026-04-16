*** Settings ***
Resource    ../resources/common_keywords.robot
Resource    ../resources/variables.robot

*** Keywords ***

Open Overall Analysis Page
    Wait Until Element Is Visible    ${TABLE_CHECKBOX}    10s
    Click Element    ${TABLE_CHECKBOX}

    Wait Until Element Is Visible    ${GRAPH_ICON}    10s
    Scroll Element Into View         ${GRAPH_ICON}
    Click Element    xpath=//*[@data-testid='AutoGraphRoundedIcon']/ancestor::button

    Wait Until Element Is Visible     ${GRAPH_ICON}    10s
    Wait Until Element Is Enabled     xpath=//*[@data-testid='AutoGraphRoundedIcon']/ancestor::button    10s
    Click Element                     xpath=//*[@data-testid='AutoGraphRoundedIcon']/ancestor::button

    Mouse Over    css:[data-testid="AutoGraphRoundedIcon"]

    Wait Until Element Is Visible    css:[data-testid="TimelineRoundedIcon"]    10s
    Click Element                    css:[data-testid="TimelineRoundedIcon"]

    # Wait for loader to disappear
    Wait Until Element Is Not Visible    xpath=//div[contains(@class,'loader-container')]    20s
       
# Remove variables
#     # Ensure button is ready
#     Wait Until Element Is Visible        xpath=//button[contains(.,'Remove Variables')]    20s
#     Wait Until Element Is Enabled        xpath=//button[contains(.,'Remove Variables')]    20s

#     # Scroll and click
#     Scroll Element Into View             xpath=//button[contains(.,'Remove Variables')]
#     Click Element                        xpath=//button[contains(.,'Remove Variables')]

# Remove variables for single variable
#     # Wait for loader
#     Wait Until Element Is Not Visible    xpath=//div[contains(@class,'loader-container')]    20s

#     # Scroll to checkbox
#     Scroll Element Into View    xpath=//input[@value='R_OO,ITM_OO_1']

#     # Click via label (important)
#     Click Element    xpath=(//input[@value='R_OO,ITM_OO_1'])[1]/parent::span

Click Remove Variables Button
    Wait For Loader To Disappear

    ${btn}=    Set Variable    xpath=//button[contains(.,'Remove Variables')]

    # Wait until button is present & enabled (important after checkbox selection)
    Wait Until Page Contains Element    ${btn}    15s
    Wait Until Element Is Enabled       ${btn}    10s

    Scroll Element Into View    ${btn}
    Sleep    1s

    ${status}=    Run Keyword And Return Status
    ...    Click Element    ${btn}

    IF    not ${status}
        Execute JavaScript
        ...    document.evaluate("//button[contains(.,'Remove Variables')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click();
    END

    Wait For Loader To Disappear

Select Analysis Variables
    Select Checkbox By Value    ${CHECKBOX_1_VALUE} 
    Select Checkbox By Value    ${CHECKBOX_2_VALUE} 
    Sleep    1s

    Click Remove Variables Button

Click T-Test Button
    Wait For Loader To Disappear

    ${btn}=    Set Variable    xpath=//*[@data-testid='ScienceIcon']/ancestor::button

    Wait Until Page Contains Element    ${btn}    15s
    Wait Until Element Is Visible       ${btn}    10s
    Wait Until Element Is Enabled       ${btn}    10s

    Scroll Element Into View    ${btn}
    Sleep    1s

    ${status}=    Run Keyword And Return Status
    ...    Click Element    ${btn}

    IF    not ${status}
        Execute JavaScript
        ...    document.querySelector("[data-testid='ScienceIcon']").closest('button').click()
    END

Select T-Test Comparison
    ${option}=    Set Variable    xpath=//span[normalize-space()="Student's T Test Comparisons"]

    Wait Until Page Contains Element    ${option}    15s
    Scroll Element Into View            ${option}

    Click Element    ${option}

Select Confidence Level
    ${radio}=    Set Variable    xpath=//input[@type='radio' and @value='0.95']

    Wait Until Page Contains Element    ${radio}    15s

    ${status}=    Run Keyword And Return Status
    ...    Click Element    ${radio}

    IF    not ${status}
        Execute JavaScript
        ...    document.querySelector("input[type='radio'][value='0.95']").click()
    END

Select All Variables
    Wait For Loader To Disappear

    ${btn}=    Set Variable
    ...    xpath=//*[contains(@class,'MuiFormControlLabel-label') and contains(.,'Select')]

    Wait Until Page Contains Element    ${btn}    20s
    Scroll Element Into View            ${btn}
    Sleep    1s

    ${status}=    Run Keyword And Return Status
    ...    Click Element    ${btn}

    IF    not ${status}
        Execute JavaScript
        ...    document.evaluate("//*[contains(@class,'MuiFormControlLabel-label') and contains(.,'Select')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click();
    END

Click Get Results Button
    Wait For Loader To Disappear
    Click Element    xpath=//button[normalize-space()='Get Results']    


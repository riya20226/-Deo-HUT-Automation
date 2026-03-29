*** Settings ***
Resource    ../resources/common_keywords.robot
Resource    ../resources/variables.robot
# Library    SeleniumLibrary

# *** Variables ***
# ${TABLE_CHECKBOX}     xpath=//div[contains(@class,'ag-selection-checkbox')]
# ${GRAPH_ICON}         xpath=//*[@data-testid='AutoGraphRoundedIcon']
# ${TIMELINE_ICON}      css:[data-testid="TimelineRoundedIcon"]

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

Remove Variables
    Wait For Loader To Disappear
    
    # Robust locator for the button text
    ${btn}=    Set Variable    xpath=//button[contains(.,'Remove Variables')]
    
    Wait Until Page Contains Element    ${btn}    15s
    Scroll Element Into View    ${btn}
    Sleep    1s
    
    # Try standard click first
    ${status}=    Run Keyword And Return Status    Click Element    ${btn}
    
    # If standard click fails, use JavaScript (Guaranteed to trigger)
    IF    not ${status}
        Execute JavaScript    document.evaluate("//button[contains(.,'Remove Variables')]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.click();
    END
    
    Wait For Loader To Disappear

Select Analysis Variables
    Select Checkbox By Value    ${CHECKBOX_1_VALUE} 
    Select Checkbox By Value    ${CHECKBOX_2_VALUE} 
    Sleep    1s

   
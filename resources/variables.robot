*** Variables ***
#Login Page
${USERNAME_FIELD}    xpath://*[@id="i0116"]
${PASSWORD_FIELD}    xpath://*[@id="i0118"]
${NEXT_BUTTON}       xpath://*[@id="idSIButton9"]

# Loader
${LOADER_XPATH}    xpath=//div[contains(@class,'loader-container')]

# Analysis Page
${TABLE_CHECKBOX}      xpath=//div[contains(@class,'ag-selection-checkbox')]
${GRAPH_ICON}          xpath=//*[@data-testid='AutoGraphRoundedIcon']
${TIMELINE_ICON}       css:[data-testid="TimelineRoundedIcon"]
${REMOVE_VARIABLE_BTN}    xpath=//button[contains(.,'Remove Variables')]

# Checkbox Values
${CHECKBOX_1_VALUE}    R_OO,ITM_OO_1
${CHECKBOX_2_VALUE}    ITM_Frag_T,R_OO_Frag

${CHECKBOX_INPUT}      xpath=//input[@value='{}']
${CHECKBOX_CLICK}      xpath=//input[@value='{}']/parent::span

${T_TEST_BUTTON}          xpath=//*[@data-testid='ScienceIcon']/ancestor::button
${T_TEST_COMPARISON}      xpath=//*[contains(text(),"Student's T Test Comparisons")]
${CONFIDENCE_095}         xpath=//input[@type='radio' and @value='0.95']
${SELECT_ALL}             xpath=//*[contains(@class,'MuiFormControlLabel-label') and contains(.,'Select')]
${GET_RESULTS_BTN}        xpath=//button[normalize-space()='Get Results']
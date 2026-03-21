*** Variables ***

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
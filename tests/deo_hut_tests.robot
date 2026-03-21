*** Settings ***
Resource    ../pages/login_page.robot
Resource    ../pages/product_page.robot
Resource    ../pages/overall_analysis_page.robot
Resource    ../resources/common_keywords.robot

*** Test Cases ***
Verify DEO HUT
    Open Deo Hut Website
    Login With Email

    Select Deodorant Category
    Confirm Product Selection
    Select First Checkbox
    Click Move On Icon
    Zoom Out Page

    Open Overall Analysis Page

    Remove Variables
    # Select the first one
    Select Checkbox By Value    ITM_Frag_T,R_OO_Frag
    
    # Select the second one
    Select Checkbox By Value    R_OO,ITM_OO_1   

    


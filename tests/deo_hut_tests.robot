*** Settings ***
Library    SeleniumLibrary    screenshot_root_directory=results/screenshots
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
    Click Remove Variables Button
    #Remove Variables
    Select Analysis Variables
    Click T-Test Button

Perform T-Test Configuration
    Select T-Test Comparison
    Select Confidence Level
    Select All Variables
    Click Get Results Button

    


*** Settings ***
Library    SeleniumLibrary
Resource   ../variables/testdata.robot

*** Variables ***
${USERNAME_FIELD}    xpath://*[@id="i0116"]
${PASSWORD_FIELD}    xpath://*[@id="i0118"]
${NEXT_BUTTON}       xpath://*[@id="idSIButton9"]

*** Keywords ***

Open Deo Hut Website
    Open Browser    ${URL}    ${BROWSER}    service_log_path=logs/gecko.log
    Maximize Browser Window

Login With Email
    Wait Until Element Is Visible    ${USERNAME_FIELD}    20s
    Input Text    ${USERNAME_FIELD}    ${USERNAME}
    Click Element    ${NEXT_BUTTON}

    Wait Until Element Is Visible    ${PASSWORD_FIELD}    20s
    Input Text    ${PASSWORD_FIELD}    ${PASSWORD}
    Click Element    ${NEXT_BUTTON}

    # Handle "Stay signed in?" only if it appears
    Run Keyword And Ignore Error
    ...    Wait Until Element Is Visible    xpath=//*[@id="idSIButton9"]    10s

    Run Keyword And Ignore Error
    ...    Click Element    xpath=//*[@id="idSIButton9"]

    # Wait for Deo HUT page to load
    Wait Until Page Contains    Studies    60s
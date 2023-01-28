*** Settings ***
Library    SeleniumLibrary
Test Setup   OPEN WIKIPEDIA
Test Teardown    Close Browser

*** Variables ***
${wikipedia_login}    RobotTests
${wikipedia_password}    RobotFramework
${Wikipedia}    https://pl.wikipedia.org
${error_message}
*** Keywords ***
*** *** Test Cases ***
OPEN WIKIPEDIA
    Open Browser    https://pl.wikipedia.org  Edge

Login_In_Wikipedia
    [Arguments]  ${login}    ${password}
    Click Element      id:pt-login
    Input Text      id:wpName1    ${login}
    Input Password      id:wpPassword1    ${password}
    Checkbox Should Not Be Selected    id:wpRemember
    Select Checkbox    id:wpRemember
    Click Button    id:wpLoginAttempt


*** *** Test Cases ***
Search_In_Wikipedia
    Login In Wikipedia   ${wikipedia_login}   ${wikipedia_password}
    Input Text    id:searchInput    Lewandowska Anna
    click Button    id:searchButton
    Sleep    2
    Capture Page Screenshot   #screen.png

*** *** Test Cases ***
Unsuccessful_Login_To_Wikipedia
    Login In Wikipedia  ${wikipedia_login}   12345
    Wait Until Element Is Visible    css: .mw-message-box-error timeout=5
    ${my_error_message}    Get Text  css: .mw-message-box-error
    Log    ${my_error_message}
    Log To Console ${my_error_message}
    Should Be Equal As Strings  ${error_message}    ${my_error_message}

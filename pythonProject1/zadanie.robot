*** Settings ***
Library  SeleniumLibrary

*** Variables ***
@{emails}  email1  email2  email3  email4  email5
@{passwords}  pass1  pass2  pass3  pass4  pass5

*** Test Cases ***
Registration In Forum
        open browser    https://gotujmy.pl/forum/
        Run Keyword And Ignore Error  click button    //*[@id="tcf277-permissions-modal"]/div[3]/div/button
        Click Element   //*[@id="navTop"]/nav/ul[1]/li[2]/a
        Run Keyword And Ignore Error click button    //*[@id="tcf277-permissions-modal"]/div[3]/div/button


        Capture Page Screenshot
*** Settings ***
Library           SeleniumLibrary
Library           String
Library    Collections


*** Test Cases ***
Make sure there is an “Egyptian” option and it is clickable ( will navigate to “Egyptian dishes” )
    Open Browser    file:///Users/mariaehab/Documents/4th-Level-S2/Software Testing/Smart-food/home.html  chrome
    Maximize Browser Window
    Wait Until Element Is Visible    class=box
    Click Element    id=Egyptian
    ${current_url}=    Get Location
    Should Contain    ${current_url}    /egyptian
    Close Browser

Make sure that the description button works fine (after clicking it the dish description appears)
    Open Browser    file:///Users/mariaehab/Documents/4th-Level-S2/Software Testing/Smart-food/home.html  chrome
    Maximize Browser Window
    Wait Until Element Is Visible    class=box
    Click Element    id=Egyptian
    Wait Until Element Is Visible    xpath=/html/body/div/ul/li[1]/div
    Click Element    class=brief-btn
    Wait Until Element Is Visible    xpath=/html/body/div/ul/li[1]/h2
    ${description}=    Get Text    xpath=/html/body/div/ul/li[1]/h2
    Should Not Be Empty    ${description}
    Close Browser

Make sure that the “Egyptian dishes” page has Fattah dish with price 45.5EGP
    Open Browser    file:///Users/mariaehab/Documents/4th-Level-S2/Software Testing/Smart-food/home.html  chrome
    Maximize Browser Window
    Wait Until Element Is Visible    class=box
    Click Element    id=Egyptian
    Wait Until Element Is Visible    xpath=/html/body/div
    Scroll Element Into View    xpath=/html/body/div/ul/li[3]/p
    ${fattah}=    Get WebElement    name=Fattah
    ${fattah}=    Get Text    ${fattah}
    Should Contain    ${fattah.lower()}    fattah
    ${price}=    Get WebElement    xpath=/html/body/div/ul/li[3]/div/p
    ${price}=    Get Text    ${price}
    Should Contain    ${price}    45.50EGP
    Close Browser

Make sure that the “Home” button works as expected
    Open Browser    file:///Users/mariaehab/Documents/4th-Level-S2/Software Testing/Smart-food/home.html   chrome
    Maximize Browser Window
    Wait Until Element Is Visible    class=box
    Click Element    id=Egyptian
    Wait Until Element Is Visible    class=navbar
    Click Element    class=hamburger
    Click Element    xpath=/html/body/header/nav/div/ul/li[1]/a
    Wait Until Element Is Visible    class=box
    ${current_url}=    Get Location
    Should Contain    ${current_url}    /home
    Close Browser
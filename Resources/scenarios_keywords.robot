*** Settings ***
Library     SeleniumLibrary
Test Setup    Je suis sur la page d'accueil d'Ebay
Test Teardown    Close Browser

*** Variables ***
${URL}    https://www.ebay.com/
${BROWSER}    chrome
@{List_Categories}    Antiques    Art    Baby    Books&Magazines    Business&Industrial    Cameras&Photos     

*** Keywords ***
Je suis sur la page d'accueil d'Ebay
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    
Je clique sur lien Avancé
    Wait Until Element Is Visible    xpath://a[@title='Advanced Search' and @id='gh-as-a']
    Click Element    xpath://a[@title='Advanced Search' and @id='gh-as-a']

Je navigue vers la page Recherche avancée
    #Set Selenium Timeout    5
    Wait Until Page Contains    Advanced search
    Page Should Contain    Advanced search
   
Je recherche'iPhone11'
    Wait Until Element Is Visible    xpath://div[@id='gh-ac-box']
    Input Text    xpath://input[@id='gh-ac']    iPhone 11
    Click Button    //input[@type='submit' and @id='gh-btn']
    Wait Until Page Contains    results for iPhone 11

Je valide au moins 1000 éléments de recherche présents
    ${Number}=    Get Text    css:div[class='srp-controls__control srp-controls__count'] span:nth-child(1)
    IF    ${Number} > 1000
        Log To Console    Plus 1000 elements de recherche presents
    ELSE
        ${Number} < 1000
        Log To Console    C'est moins de 1000 elements de recherche presents
    END

Je recherche 'Toy Cars'
    Wait Until Element Is Visible    xpath://div[@id='gh-ac-box']
    Input Text    xpath://input[@id='gh-ac']    Toy Cars
    Click Button    //input[@type='submit' and @id='gh-btn']
    Wait Until Page Contains    results for Toy Cars

Je valide au moins 100 éléments de recherche présents
    ${Number}=    Get Text    xpath:/html[1]/body[1]/div[8]/div[4]/div[1]/div[1]/div[2]/div[1]/div[1]/h1[1]/span[1]
    IF    ${Number} > 100
        Log To Console    Plus 100 elements de recherche presents
    ELSE
        ${Number} < 100
        Log To Console    C'est moins de 100 elements de recherche presents
    END
Je recherche 'soap' dans la catégorie 'Baby'
    Wait Until Element Is Visible    xpath://div[@id='gh-ac-box']
    Input Text    xpath://input[@id='gh-ac']    soap
    Select From List By Label    xpath://select[@id='gh-cat']    Baby
    Sleep    3
    ${Categorie_Baby}=    Get Selected List Label    xpath://select[@id='gh-cat']
    Click Button    //input[@type='submit' and @id='gh-btn']
    Wait Until Page Contains    results for soap

Je valide au moins 50 éléments de recherche présents
    ${Number}=    Get Text        css:div[class='srp-controls__control srp-controls__count'] span:nth-child(1)
    IF    ${Number} > 50
        Log To Console    Plus 50 elements de recherche presents
    ELSE
        ${Number} < 50
        Log To Console    C'est moins de 50 elements de recherche presents
    END

Je clique sur '<link>'


Je valide que la page navigue vers '<url>' et que le titre contient '<title>'
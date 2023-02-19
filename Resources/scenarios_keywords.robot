*** Settings ***
Library     SeleniumLibrary
Library    XML
Variables    ./locators.py

*** Variables ***
${URL}    https://www.ebay.com/
${BROWSER}    chrome
${url_obtenue}

*** Keywords ***
Je suis sur la page d'accueil d'Ebay
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Timeout    5
    
Je clique sur lien Avancé
    Wait Until Element Is Visible    ${lnk_Advanced}
    Click Element    ${lnk_Advanced}

Je navigue vers la page Recherche avancée
    [Arguments]    ${Labeled_text}
    Wait Until Page Contains    ${Labeled_text}
    Page Should Contain    ${Labeled_text}
   
Je recherche'iPhone11'
    [Arguments]    ${var_iPhone11}    ${result_B}
    Wait Until Element Is Visible    ${txt_Search}
    Input Text    ${txt_Search}    ${var_iPhone11}
    Click Button    ${btn_Search}
    Wait Until Page Contains    ${result_B}

Je valide au moins 1000 éléments de recherche présents
    [Arguments]    ${Quantity_B}
    ${Number_1}=    Get Text    ${lbl_Resultat_Quantite}
    IF    ${Number_1} > ${Quantity_B}
        Log To Console    Plus ${Quantity_B} elements de recherche presents
    ELSE
        ${Number_1} < ${Quantity_B}
        Log To Console    C'est moins de ${Quantity_B} elements de recherche presents
    END

Je recherche 'Toy Cars'
    [Arguments]    ${var_ToyCars}    ${result_C}
    Wait Until Element Is Visible    ${txt_Search}
    Input Text    ${txt_Search}    ${var_ToyCars}
    Click Button    ${btn_Search}
    Wait Until Page Contains    ${result_C}

Je valide au moins 100 éléments de recherche présents
    [Arguments]    ${Quantity_C}
    ${Number_2}=    Get Text    ${lbl_Resultat_Quantite}
    IF    ${Number_2} > ${Quantity_C}
        Log To Console    Plus ${Quantity_C} elements de recherche presents
    ELSE
        ${Number_2} < ${Quantity_C}
        Log To Console    C'est moins de ${Quantity_C} elements de recherche presents
    END
Je recherche 'soap' dans la catégorie 'Baby'
    [Arguments]    ${var_soap}    ${var_Baby}    ${result_D}
    Wait Until Element Is Visible    ${txt_Search}
    Input Text    ${txt_Search}    ${var_soap}
    Select From List By Label    ${lst_Category}    ${var_Baby}
    Click Button    ${btn_Search}
    Wait Until Page Contains    ${result_D}

Je valide au moins 50 éléments de recherche présents
    [Arguments]    ${Quantity_D}
    ${Number_3}=    Get Text    ${lbl_Resultat_Scenario_D}
    IF    ${Number_3} > ${Quantity_D}
        Log To Console    Plus ${Quantity_D} elements de recherche presents
    ELSE
        ${Number_3} < ${Quantity_D}
        Log To Console    C'est moins de ${Quantity_D} elements de recherche presents
    END

Je clique sur '<link>'
    [Arguments]    ${name_Category}
    Click Element    ${lnk_Category_partie_1}${name_Category}${lnk_Category_partie_2}
    Wait Until Page Contains    ${name_Category}
    
Je valide que la page navigue vers '<url>' et que le titre contient '<title>'
    [Arguments]        ${var}    ${name_Category}
    ${url_obtenue}=    Get Location  
    Location Should Contain    https://www.ebay.com/b/${var}
    Should Match Regexp    ${url_obtenue}      https://www.ebay.com/b/${var}
    Log To Console    ${var} 
    Log To Console    ${url_obtenue}   
      
    ${titre_obtenue}=    Get Title
    Should Match Regexp    ${titre_obtenue}    ${name_Category}
    Log To Console    ${titre_obtenue}
        
    
   
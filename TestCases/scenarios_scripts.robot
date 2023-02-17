*** Settings ***
Resource    ../Resources/scenarios_keywords.robot



*** Test Cases ***
Scenario A
    # lien de recherche avancée
    Given Je suis sur la page d'accueil d'Ebay
    When Je clique sur lien Avancé
    Then Je navigue vers la page Recherche avancée

Scenario B
    # nombre d'éléments de recherche
    Given Je suis sur la page d'accueil d'Ebay
    When Je recherche'iPhone11'
    Then Je valide au moins 1000 éléments de recherche présents

Scenario C
    #nombre d'éléments recherchés 2
    Given Je suis sur la page d'accueil d'Ebay
    When Je recherche 'Toy Cars'
    Then Je valide au moins 100 éléments de recherche présents

Scenario D
    #Rechercher un article dans la catégorie
    Given Je suis sur la page d'accueil d'Ebay
    When Je recherche 'soap' dans la catégorie 'Baby'
    Then Je valide au moins 50 éléments de recherche présents

Scenario E
    # liens vers la page d'accueil
    Given Je suis sur la page d'accueil d'Ebay
    #When Je clique sur '<link>'
    #Then Je valide que la page navigue vers '<url>' et que le titre contient '<title>'


*** Keywords ***


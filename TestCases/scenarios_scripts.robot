*** Settings ***
Resource    ../Resources/scenarios_keywords.robot
Variables    ../Resources/locators.py
Test Teardown    Close Browser

*** Test Cases ***
Scenario A
    # lien de recherche avancée
    Given Je suis sur la page d'accueil d'Ebay
    When Je clique sur lien Avancé
    Then Je navigue vers la page Recherche avancée    Advanced search

Scenario B
    # nombre d'éléments de recherche
    Given Je suis sur la page d'accueil d'Ebay
    When Je recherche'iPhone11'    iPhone 11    results for iPhone 11
    Then Je valide au moins 1000 éléments de recherche présents    1000

Scenario C
    #nombre d'éléments recherchés 2
    Given Je suis sur la page d'accueil d'Ebay
    When Je recherche 'Toy Cars'    Toy Cars    results for Toy Cars
    Then Je valide au moins 100 éléments de recherche présents    100

Scenario D
    #Rechercher un article dans la catégorie
    Given Je suis sur la page d'accueil d'Ebay
    When Je recherche 'soap' dans la catégorie 'Baby'    soap    Baby    results for soap
    Then Je valide au moins 50 éléments de recherche présents    50

Scenario E
    # liens vers la page d'accueil
    Given Je suis sur la page d'accueil d'Ebay
    When Je clique sur '<link>'    Motors
    Then Je valide que la page navigue vers '<url>' et que le titre contient '<title>'    Auto-Parts-and-Vehicles   Motors 

*** Keywords ***


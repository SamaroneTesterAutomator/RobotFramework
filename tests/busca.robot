*** Settings ***

Resource        ../resources/base.robot

Test Setup       Start Session
Test Teardown    Take Screenshot

*** Test Cases ***
Deve buscar um unico restaurante
    Go To restaurants 
    Search By                       Debuger 
    Restaurant Should Be Visible    DEBUGER KING
    Restaurant Count Should Be    1

   


Deve buscar uma categoria
    Go To restaurants 
    Search By    Cafe
    Restaurant Should Be Visible    STARBUGS
    Restaurant Count Should Be    1

    

Deve buscar todos os restaurantes 
    Go To restaurants 
    Search By                     a
   #Restaurant Count Should Be    5

    
    


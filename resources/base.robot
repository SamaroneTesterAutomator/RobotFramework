*** Settings ***
Documentation    Arquivo base do projeto (tudo começa aqui)

Library          Browser
Library          OperatingSystem

Resource         actions/search.robot
Resource         actions/cart.robot
Resource         actions/order.robot



*** Keywords ***
Start Session
    New Browser    chromium    False
    New Page       https://parodifood.herokuapp.com/
    

### helpers ### 
GET JSON
    [Arguments]    ${file_name}

    ${file}       Get File             ../resources/fixtures/${file_name}
    ${super_var}  Evaluate             json.loads($file)  json  

    [Return]      ${super_var}
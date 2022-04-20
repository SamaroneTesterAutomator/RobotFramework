*** Settings ***
Documentation    Ações da funcionalidade do carrinho de compras
Library    Browser


*** Keywords ***
Choose Restaurant
    [Arguments]        ${super_var}

    Click             text=${super_var["restaurant"]}

    Wait For Elements State    css=#detail    visible    10
    Get Text    css=#detail    contains    ${super_var["desc"]}


Add to cart 
    [Arguments]    ${name}
    Click    xpath=//span[text()="${name}"]/../a[@class="add-to-cart"]

Should Add To Cart
    [Arguments]        ${name}

    Wait For Elements State    css=#cart tr >> text=${name}    visible    5

Total Card Should Be
    [Arguments]    ${total}

    Get Text    xpath=//th[contains(text(),"Total")]/..//td


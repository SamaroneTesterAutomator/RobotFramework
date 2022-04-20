*** Settings ***

Resource    ../resources/base.robot


Test Setup        Start Session
Test Teardown     Take Screenshot


*** Test Cases ***
Deve realizar um novo pedido em Dinheiro
    
    ${order_json}    GET JSON    order.json

    Go To restaurants
    Choose Restaurant          ${order_json}

    FOR     ${product}    IN       @{order_json["products"]}
        Add to cart                ${product["name"]}
        Should Add To Cart         ${product["name"]}
    END
    
    Go Checkout
    Fill Data Customer         ${order_json["customer"]}
    Select payment Option      ${order_json["payment"]}
    Pay order
    Order Should Be Completed



*** Settings ***

Resource        ../resources/base.robot

Test Setup       Start Session
Test Teardown    Take Screenshot

*** Test Cases ***
Deve adicionar um item ao carrinho    

    &{restaurant}    Create Dictionary    restaurant=STARBUGS COFFEE    desc=Nada melhor que um café pra te ajudar a resolver um bug.

    Go To restaurants
    Choose Restaurant       ${restaurant}
    Add to cart             Starbugs 500 error
    Should Add To Cart      Starbugs 500 error
    Total Card Should Be    15,60
    
Deve adicionar três itens no carrinho
    [Tags]    temp

    ${cart_json}    GET JSON    cart.json
    
    Go To restaurants
    Choose Restaurant       ${cart_json}

    FOR     ${product}    IN   @{cart_json["products"]}
        Add to cart            ${product["name"]}
        Should Add To Cart     ${product["name"]}
    END
    
     
    Total Card Should Be       ${cart_json["total"]}  


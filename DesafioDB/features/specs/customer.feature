#language:pt

@all
Funcionalidade: Realizar uma compra em e-commerce.

  @comprar
  Cenário: Realizar uma compra com sucesso.
    Dado que eu esteja no site de compras.
    Quando escolher um produto qualquer na loja.
      | produto_name                | filtro   | menu     |
      | Faded Short Sleeve T-shirts | In stock | T-shirts |
    E prossiga para o checkout.
    #Então valide os dados do produto no carrinho.
    Quando realizar o cadastro desse cliente.
    Então valide se o endereço está correto e prossiga.
    Quando aceitar os termos de serviço e prosseguir.
    Então valide o valor total da compra.
    Quando selecionar um método de pagamento e prosseguir.
      | tipo_de_pagamento |
      | Pay by bank wire  |
    Então confirme a compra e valide se foi finalizada com sucesso.
      | mensagens                           |
      | Order confirmation                  |
      | Your order on My Store is complete. |
      | Amount XXX                          |
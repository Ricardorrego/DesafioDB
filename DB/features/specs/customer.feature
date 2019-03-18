# language: pt

Funcionalidade: Realizar um novo cadastro de cliente

  -Eu como admin.
  -Eu quero criar um novo cliente.

  Contexto:
    Dado que eu esteja no site de vendas.

  @realizar compra
  Cenario: Finalizar compra com sucesso
    Dado que eu esteja na pagina inicial
    Quando eu realizar o cadastro desse cliente
    Entao validar que o cadastro do cliente foi realizado com sucesso

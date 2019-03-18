page_login = HomePage.new
page_contas = Contas.new

Dado("que eu esteja no site de vendas.") do
  page_login.load
  end

Dado("que eu esteja na pagina inicial") do
  #wait_for_ajax  
  page_contas.carrinho
  sleep 3
  
end

Quando("eu realizar o cadastro desse cliente") do
  #wait_for_ajax    
  page_contas.combobox
  page_contas.preencher_dados
     
  sleep 3
end

Entao("validar que o cadastro do cliente foi realizado com sucesso") do
  valores = page_contas.validar_array
  @table_values = page_contas.table_values
  valores.each_with_index{ |value, index|
    expect(@table_values).to include(value)
  }
  p "Validado com Sucesso!"
end


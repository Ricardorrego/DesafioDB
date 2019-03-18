class Contas < SitePrism::Page

  element :submit_bt_elem, 'button[type="submit"] span'
  element :btn_add_carrinho, 'a[href="http://automationpractice.com/index.php?controller=cart&add=1&id_product=1&token=e817bb0705dd58da8db074c69f729fd8"]'
  element :btn_prosseguir, 'a[title="Proceed to checkout"]'
  element :btn_checkout, 'a[href="http://automationpractice.com/index.php?controller=order&step=1"]'
  element :email_elem,       'input[name="email_create"]'
  element :botao_logar_elem, 'button[id="SubmitCreate"]'
  element :botao_registro, 'button[name="submitAccount"]'
  element :nome_elem,        'input[id="customer_firstname"]'
  element :last_nome_elem,   'input[id="customer_lastname"]'  
  element :senha_elem,       'input[name="passwd"]'
  element :dia_nasc,          'select[id="days"]'
  element :pais_elem,            'input[id="id_country"]'
  element :endereco_primeiro_elem,     'input[id="firstname"]'
  element :endereco_segundo_elem,   'input[id="lastname"]'
  element :endereco_empresa_elem,   'input[name="address1"]'
  element :company,   'input[id="company"]'
  element :endereco_primeiro_emp,     'input[id="firstname"]'
  element :cidade,     'input[name="city"]'
  element :cep_ele,     'input[id="postcode"]'
  element :numero_celular_elem,     'input[id="phone_mobile"]'
  element :select_bt_elem, 'span[class="select2-arrow"] b'
  element :btn_enviar_elem, 'button[class="btn btn-primary"]'
  
  # elementos invisible, variavel de classe.
  
  @@input_select_dia = 'select[id="days"]'
  @@input_select_mes = 'select[id="months"]'
  @@input_select_ano = 'select[id="years"]' 
  @@gender = 'input#id_gender1'
  @@select_state = 'select#id_state'

  def initialize
    @primeiro_nome = Faker::Name.first_name
    @segundo_nome = Faker::Name.last_name
    @email = Faker::Internet.email
    @senha = Faker::Internet.password
    @mobile = Faker::PhoneNumber.phone_number
    @endereco_primeiro = Faker::Address.full_address
    @endereco_segundo = Faker::Address.full_address
    @cidade_end = Faker::Address.city
    @cep = Faker::Address.postcode
    
  end
  
  def preencher_dados
    
    nome_elem.set @primeiro_nome
    last_nome_elem.set @segundo_nome
    senha_elem.set @senha
    endereco_primeiro_elem.set @endereco_primeiro
    endereco_segundo_elem.set @endereco_segundo
    company.set @primeiro_nome
    endereco_primeiro_emp.set @endereco_primeiro
    endereco_empresa_elem.set @endereco_segundo
    cidade.set @cidade_end
    numero_celular_elem.set @mobile
    cep_ele.set @cep    
    botao_registro.click
  end

  def combobox(dia="22", mes="Março", ano="1981")    
    find(@@gender, visible: false).click
    find(@@input_select_dia, visible: false).send_keys [dia], :return
    find(@@input_select_mes, visible: false).send_keys [mes], :return
    find(@@input_select_ano, visible: false).send_keys [ano], :return
    find(@@pais_elem, visible: false).send_keys ["Estados Unidos"]
    find(@@select_state, visible: false).send_keys ["Alaska"]    
    
  rescue => ex
    p ex
  end

  def conf_email
    email_elem.set @email
    botao_logar_elem.click
  end

end
class HomePage < SitePrism::Page
    
    set_url ''
    element :campo_email, 'input[name="email"]'
    element :campo_senha, 'input[name="password"]'
    element :botao_logar, 'button[type="submit"]'
        
    def logar_customer(email, senha)
        campo_email.set email
        campo_senha.set senha
        botao_logar.click
    end
    
end
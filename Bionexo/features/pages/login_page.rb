class Login
    def initialize(browser)
        @browser = browser
        @email_field = @browser.input(id: 'user_email') 
        @password_field = @browser.input(id: 'user_password')
        @entrar_button = @browser.input(id: 'sign_in')
    end

    def login(email,senha)
        @email_field.send_keys email
        @password_field.send_keys senha
        @entrar_button.click
    end
end

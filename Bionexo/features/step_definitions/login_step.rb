Given("acesso a tela de Login") do
    @browser.goto 'http://qainterview.qa.cloud.bionexo.com.br/users/sign_in'
end

Given("preencho os campos de email {string} e senha {string}") do |email, senha|
    @page.(Login).login(email, senha)
end

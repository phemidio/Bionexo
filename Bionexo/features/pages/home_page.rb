class Home
    def initialize(browser)
        @browser = browser
        @autenticacao_message = @browser.div(id: 'flash_notice')
        @produtos_menu = @browser.span(text: 'Produtos')
        @novo_produto_menu = @browser.a(text: 'Novo Produto')
        @listar_produto_menu = @browser.a(text: 'Listar Produtos')
    end

    def validar_pagina
        @autenticacao_message.enabled?
    end

    def abrir_pagina_produto
        @produtos_menu.click 
        @novo_produto_menu.click
    end

    def abrir_pagina_consulta
        @produtos_menu.click 
        @listar_produto_menu.click
    end    
end

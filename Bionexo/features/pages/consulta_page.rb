class Consulta
    def initialize(browser)
        @browser = browser
        @criacao_produto_message = @browser.div(id: 'flash_notice')
        @quantidade_produtos = @browser.elements(class: 'hover-cursor')
        @colunas_produto = @browser.table(class: ["table", "table-hover"])
        @novo_produto_button = @browser.a(class: ["btn", "btn-primary"])
        @primeiro_produto = @browser.td
    end

    def validar_criacao_produto
        @criacao_produto_message.text
    end

    def validar_quantidade_produtos
        @quantidade_produtos.count
    end

    def validar_colunas
        colunas = @colunas_produto.tr
        colunas.text
    end

    def validar_pagina_consulta
        @novo_produto_button.enabled?
    end

    def acessar_pagina_edicao
        @primeiro_produto.click
    end
end

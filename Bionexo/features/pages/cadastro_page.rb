class Cadastro
    def initialize(browser)
        @browser = browser
        @nome_field = @browser.input(id: 'product_name')
        @codigo_field = @browser.input(id: 'product_code')
        @fabricante_field = @browser.input(id: 'product_manufacturer')
        @descricao_field = @browser.element(id: 'product_description')
        @preco_field = @browser.input(id: 'product_price')
        @tipo_field = @browser.select_list(id: 'product_kind')
        @status_field = @browser.select_list(id: 'product_status')
        @create_product_button = @browser.input(name: 'commit')
        @alert_message = @browser.ul(class: 'rails-bootstrap-forms-error-summary')
        @editar_produto = @browser.element(text: 'Editar Produto')
        @voltar_pagina = @browser.element(text: 'Voltar')

    end

    def preencher_nome nome
        @nome_field.to_subtype.set nome
    end

    def preencher_codigo codigo
        @codigo_field.to_subtype.set codigo
    end    
    def preencher_fabricante fabricante
        @fabricante_field.to_subtype.set fabricante
    end    

    def preencher_descricao descricao
        @descricao_field.to_subtype.set descricao
    end 
    
    def preencher_preco preco
        @preco_field.to_subtype.set preco
    end 
    
    def preencher_tipo tipo
        @tipo_field.select tipo
    end

    def preencher_status status
        @status_field.select status
    end

    def clicar_product_button 
        @create_product_button.click
    end
    
    def verificar_alert_message
        @alert_message.text
    end

    def verificar_campo_tipo
        byebug
        @tipo_field.text
    end

    def verificar_pagina_edicao
        @editar_produto.enabled?
    end

    def voltar_pagina
        @voltar_pagina.click
    end
end

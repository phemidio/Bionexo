  Given("que estou na tela principal do sistema") do
    validador = @page.(Home).validar_pagina
    expect(validador).to be true
  end

  Given("seleciono o menu Produto > Novo Produto") do
    @page.(Home).abrir_pagina_produto
  end
  
  When("preencho o produto com o campo {string} e {string} e {string} e {string} e {string} e {string} e {string}") do |nome, codigo, fabricante, descricao, preco, tipo, status|
    @page.(Cadastro).preencher_nome nome
    @page.(Cadastro).preencher_codigo codigo
    @page.(Cadastro).preencher_fabricante fabricante
    @page.(Cadastro).preencher_descricao descricao
    @page.(Cadastro).preencher_preco preco
    @page.(Cadastro).preencher_tipo tipo
    @page.(Cadastro).preencher_status status
  end
  
  When("clico em Create Product") do
    @page.(Cadastro).clicar_product_button
  end
  
  Then("deve ser apresentado a mensagem {string}") do |mensagem|
    validador = @page.(Consulta).validar_criacao_produto
    expect(validador).to eq(mensagem)
  end
  
  When("não preencho nenhum campo da tela") do
    
  end
  
  Then("serão informados os campos obrigatórios não preenchidos") do
    mensagem_alert = @page.(Cadastro).verificar_alert_message
    expect(mensagem_alert).to include('Nome é um campo obrigatório')
    expect(mensagem_alert).to include('Código é um campo obrigatório')
    expect(mensagem_alert).to include('Fabricante é um campo obrigatório')
    expect(mensagem_alert).to include('Descrição é um campo obrigatório')
    expect(mensagem_alert).to include('Preço é um campo obrigatório')
  end
  
  Then("as opções {string} e {string} são apresentadas com sucesso") do |opcao1, opcao2|
    opcao_tipo = @page.(Cadastro).verificar_campo_tipo
    expect(opcao_tipo).to include(opcao1)
    expect(opcao_tipo).to include(opcao2)
  end
  
  When("seleciono o menu Produto > Listar Produto") do
    @page.(Home).abrir_pagina_consulta
  end
  
  Then("a tela de consulta é apresentada com a quantidade máxima de {int} produtos por pagina") do |int|
    validador = @page.(Consulta).validar_quantidade_produtos
    expect(validador).to eq 10
  end
  
  Then("a tela de consulta é apresentada com os campos Nome, Tipo, Fabricante e Status") do
    validador = @page.(Consulta).validar_colunas
    expect(validador).to include('Nome Tipo Fabricante Status')
  end
  
  When("que estou na tela de edição de produtos") do
    @page.(Consulta).acessar_pagina_edicao
    validador = @page.(Cadastro).verificar_pagina_edicao
    expect(validador).to eq true
  end
  
  When("preencho todos os campos da tela") do
    @page.(Cadastro).preencher_nome 'teste'
    @page.(Cadastro).preencher_codigo '4894241654'
    @page.(Cadastro).preencher_fabricante 'fabricante'
    @page.(Cadastro).preencher_descricao 'teste teste teste'
    @page.(Cadastro).preencher_preco '10'
  end
  
  When("clico em Update Product") do
    @page.(Cadastro).clicar_product_button
  end
  
  When("clico no link “Voltar”") do
    @page.(Cadastro).voltar_pagina
  end
  
  Then("a tela de listagem de produto é apresentada") do
    validador = @page.(Consulta).validar_pagina_consulta
    expect(validador).to eq true
  end
  
  When("altero o campo “Preço” com um valor inválido") do
    @page.(Cadastro).preencher_preco 'abc'
    @page.(Cadastro).clicar_product_button
  end
  
  Then("uma mensagem informativa é apresentada") do
    mensagem_alert = @page.(Cadastro).verificar_alert_message
    expect(mensagem_alert).to include('Valor Inválido no campo Preço')
  end
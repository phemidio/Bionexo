Feature: Testar o cadastro de produto

  Background:
    Given acesso a tela de Login
      And preencho os campos de email 'ph.emidio@gmail.com' e senha 'Bionexo2019'
      And que estou na tela principal do sistema

    Scenario Outline: Cadastrar produtos
        And seleciono o menu Produto > Novo Produto
      When preencho o produto com o campo "<nome>" e "<codigo>" e "<fabricante>" e "<descricao>" e "<preco>" e "<tipo>" e "<status>"
        And clico em Create Product
      Then deve ser apresentado a mensagem "Produto criado com sucesso."

      Examples:
      | nome      | codigo    | fabricante    | descricao     | preco     | tipo              | status    |
      | Cortinazol| 456       | eu            | medicamento   | 1         | Medicamento       | Ativo     |
      | Tesoura   | 900       | tu            | material      | 2         | Materias Médicos  | Ativo     |

    Scenario: Validar campo obrigatório
        And seleciono o menu Produto > Novo Produto
      When não preencho nenhum campo da tela
        And clico em Create Product
      Then serão informados os campos obrigatórios não preenchidos

    Scenario: Validar quantidade de produtos por página
      When seleciono o menu Produto > Listar Produto
      Then a tela de consulta é apresentada com a quantidade máxima de 10 produtos por pagina 

    Scenario: Validar os campos da tela de consulta
      When seleciono o menu Produto > Listar Produto
      Then a tela de consulta é apresentada com os campos Nome, Tipo, Fabricante e Status

    Scenario: Editar produtos cadastrados
      When seleciono o menu Produto > Listar Produto
        And que estou na tela de edição de produtos
        And preencho todos os campos da tela
        And clico em Update Product
      Then deve ser apresentado a mensagem "Produto atualizado com sucesso."

    Scenario: Validar link Voltar
      When seleciono o menu Produto > Listar Produto
        And que estou na tela de edição de produtos
        And clico no link “Voltar”
      Then a tela de listagem de produto é apresentada

    Scenario: Editar campo Preço com valor incorreto
      When seleciono o menu Produto > Listar Produto
        And que estou na tela de edição de produtos
        And altero o campo “Preço” com um valor inválido
      Then uma mensagem informativa é apresentada    
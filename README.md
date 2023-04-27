Gustavo Valente Nunes
Trabalho2 de Web

NOTA1:
    Quando for necessário o uso de espaços, deve ser utilizado o _

NOTA2:
    Existe um script chamado popula.rb na raiz do projeto que cria 15 registros de cada
    tabela com associações de forma aleatória.

NOTA3:
    No relacionamento Muitos para Muitos (Cidades e Pessoas), embora tenha sido feita a tabela no banco de dados,
    no arquivo de configuração em ./database/DatabaseConfig.rb, para ver essa associação, deve-se listar pessoas
    ou cidades.

versão do ruby utilizada:
    ruby 3.1.2p20

dependências:
    gem install sqlite3
    gem install activerecord

Estrutura do projeto:
    main.rb: Main do projeto.
    popula.rb: Cria os dados iniciais no projeto.
    entities/*: Entidades utilizadas no projeto (Cidade, Estado, Pessoa, Sigla)
    services/*: Classe de ações possíveis para cada entidade (insere, altera, exclui, lista)
    database/*: Arquivo de configuração do banco de dados (sqlite3).
    Tabelas.sqlite3: Banco de dados gerado após a execução do popula.rb

Comandos disponíveis:
    Para listar:
        lista pessoas
        lista cidades
        lista estados
        lista siglas

    Para incluir:
        insere estados name="nome_estado"
        insere pessoas name="nome_pessoa"
        insere siglas  name="nome_sigla"
        insere cidades name="nome_cidade"

    Para excluir:
        exclui estados name="nome_estado"
        exclui pessoas name="nome_pessoa"
        exclui siglas  name="nome_sigla"
        exclui cidades name="nome_cidade"

    Para alterar:
        altera estados name="nome_estado" name="novo_estado"
        altera pessoas name="nome_pessoa" name="nova_pessoa"
        altera siglas  name="nome_sigla"  name="nova_sigla"
        altera cidades name="nome_cidade" name="nova_cidade"

Explicando as relações:
    1 Estado para N Cidades
    1 Estado para 1 Sigla
    N Cidades para N Pessoas

Fluxo de execução:
    Executar:
        -> ruby popula.rb
        -> ruby main.rb
        1 - Deve utilizar algum dos comandos listados acima.
        2 - Verificar com [y/n] se deseja atribuir a tabela a alguma outra.
        3 - Digitar o id da associação ou um array de id's se for muitos para muitos
        4 - Confirmação de operação bem sucedida. Volta ao passo 1.

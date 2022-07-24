class DatabaseConfig
  def initialize
    ActiveRecord::Base.establish_connection(
      adapter: 'sqlite3',
      database: 'Tabelas.sqlite3'
    )
  end

  def cidade_tabela
    cidades_existe = ActiveRecord::Base.connection.data_source_exists? 'cidades'

    unless cidades_existe
      ActiveRecord::Base.connection.create_table :cidades do |t|
        t.string :name
        t.belongs_to :estado, foreign_key: true
      end
    end
  end

  def sigla_tabela
    sigla_existe = ActiveRecord::Base.connection.data_source_exists? 'siglas'

    unless sigla_existe
      ActiveRecord::Base.connection.create_table :siglas do |t|
        t.string :name
        t.references :estado, foreign_key: true
      end
    end
  end

  def estado_tabela
    estado_existe = ActiveRecord::Base.connection.data_source_exists? 'estados'

    unless estado_existe
      ActiveRecord::Base.connection.create_table :estados do |t|
        t.string  :name
      end
    end
  end

  def pessoa_tabela
    pessoa_existe = ActiveRecord::Base.connection.data_source_exists? 'pessoas'

    unless pessoa_existe
      ActiveRecord::Base.connection.create_table :pessoas do |t|
        t.string  :name
      end
    end
  end

  def cidades_pessoas_tabela
    cidade_pessoa_existe = ActiveRecord::Base.connection.data_source_exists? 'cidades_pessoas'

    unless cidade_pessoa_existe
      ActiveRecord::Base.connection.create_table :cidades_pessoas do |t|
        t.references :cidade
        t.references :pessoa
      end
    end
  end
end

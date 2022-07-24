require './database/DatabaseConfig'
require './entities/Pessoa'

class PessoaService
  def initialize
    db = DatabaseConfig.new
    db.pessoa_tabela
    db.cidades_pessoas_tabela
  end

  def insere(name, cidades_ids)
    puts "ESTOU INSERINDO ALGO AQUI CARAIO"
    if name
      pessoa = Pessoa.new
      pessoa.name = name

      cidades_ids.each do |cidade_id|
        cidade = Cidade.find_by_id(cidade_id)
        pessoa.cidades << cidade
      end
      pessoa.save

    end
  end

  def lista
    puts "ID || PESSOA || CIDADE_ID || CIDADE_NAME"
    Pessoa.find_each do |a|
      print "#{a.id} || #{a.name} || "
      cidades = a.cidades
      cidades.each do |cidade|
        print "#{cidade.id} - #{cidade.name}, "
      end
      puts
    end
  end

  def exclui(condition, value)
    puts "SELECT * from estados WHERE #{condition} = '#{value}'"
    case condition
    when 'id'
      Estado.where(id: value).destroy_all
    when 'name'
      Estado.where(name: value).destroy_all
    end
  end

  def altera(condicao, velho, novo)
    puts condicao, velho, novo
    pessoa = Pessoa.find_by_name(velho)
    case condicao
    when 'name'
      pessoa.name = novo
      pessoa.save
    end
  end
end

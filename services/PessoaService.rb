require './database/DatabaseConfig'
require './entities/Pessoa'

class PessoaService
  def initialize
    db = DatabaseConfig.new
    db.pessoa_tabela
    db.cidades_pessoas_tabela
  end

  def insere(name, cidades_ids)
    if name
      pessoa = Pessoa.new
      pessoa.name = name

      if cidades_ids != -1
        cidades_ids.each do |cidade_id|
          cidade = Cidade.find_by_id(cidade_id)
          pessoa.cidades << cidade
        end
      end
      pessoa.save
    else
      puts "Name não fornecido"
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
    case condition
    when 'id'
      Pessoa.where(id: value).destroy_all
    when 'name'
      Pessoa.where(name: value).destroy_all
    end
  end

  def altera(condicao, velho, novo)
    pessoa = Pessoa.find_by_name(velho)
    case condicao
    when 'name'
      pessoa.name = novo
      pessoa.save

      puts "Alteração com sucesso!"
    end
  end
end

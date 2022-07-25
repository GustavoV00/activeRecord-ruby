require './database/DatabaseConfig'
require './entities/Estado'
require './entities/Pessoa'

class CidadeService
  def initialize
    db = DatabaseConfig.new
    db.cidade_tabela
    db.cidades_pessoas_tabela
  end

  def insere(name, estado_id)
    if name
      estado = Estado.find_by_id(estado_id)

      cidade = Cidade.new
      cidade.name = name
      cidade.estado = estado
      cidade.save
    end
  end

  def lista
    puts "ID || CIDADE_NAME || ESTADO_ID || ESTADO_NAME || PESSOAS_NAMES"
    Cidade.find_each do |a|
      if a.estado_id
        print "#{a.id} || #{a.name} || #{a.estado_id} || #{a.estado.name} || "
      else
        print "#{a.id} || #{a.name} || || "
      end
      pessoas = a.pessoas
      pessoas.each do |pessoa|
        print "#{pessoa.name} - "
      end

      puts
    end
  end

  def exclui(condition, value)
    case condition
    when 'id'
      Cidade.where(id: value).destroy_all
    when 'name'
      Cidade.where(name: value).destroy_all
    end
  end

  def altera(condicao, velho, novo)
    puts condicao, velho, novo
    cidade = Cidade.find_by_name(velho)
    case condicao
    when 'name'
      cidade.name = novo
      cidade.save
    end
  end
end

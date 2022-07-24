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
    puts "ESTOU INSERINDO ALGO AQUI CARAIO "
    # TODO: Arrumar o inserir livro_id que é um array agoira
    if name
      estado = Estado.find_by_id(estado_id)

      cidade = Cidade.new
      cidade.name = name
      cidade.estado = estado
      cidade.save
    end
  end

  def lista
    puts "ID || AUTOR_NAME || ESTADO_ID || ESTADO_NAME || PESSOAS"
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
end

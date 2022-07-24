require './database/DatabaseConfig'
require './entities/Sigla'

class SiglaService
  def initialize
    db = DatabaseConfig.new
    db.sigla_tabela
  end

  def insere(name, estado_id)
    puts "ESTOU INSERINDO ALGO AQUI CARAIO"
    if name
      if estado_id != -1
        estado = Estado.find_by_id(estado_id)
      end


      sigla = Sigla.new
      sigla.name = name
      if estado_id != -1
        sigla.estado = estado
      end
      sigla.save
    end
  end

  def lista
    puts "ID || SIGLA || ESTADO_ID || ESTADO_NAME"
    Sigla.find_each do |a|
      if a.estado_id
        puts "#{a.id} || #{a.name} || #{a.estado_id} || #{a.estado.name}"
      else
        puts "#{a.id} || #{a.name}"
      end
    end
  end
end

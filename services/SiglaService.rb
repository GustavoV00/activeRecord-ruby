require './database/DatabaseConfig'
require './entities/Sigla'

class SiglaService
  def initialize
    db = DatabaseConfig.new
    db.sigla_tabela
  end

  def insere(name, estado_id)
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
        puts "#{a.id} || #{a.name} || ||"
      end
    end
  end

  def exclui(condition, value)
    case condition
    when 'id'
      Sigla.where(id: value).destroy_all
    when 'name'
      Sigla.where(name: value).destroy_all
    end
  end

  def altera(condicao, velho, novo)
    puts condicao, velho, novo
    sigla = Sigla.find_by_name(velho)
    case condicao
    when 'name'
      sigla.name = novo
      sigla.save
    end
  end
end

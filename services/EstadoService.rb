require './database/DatabaseConfig'
require './entities/Estado'

class EstadoService
  def initialize
    db = DatabaseConfig.new
    db.estado_tabela
  end

  def insere(name)
    if name
      estado = Estado.new
      estado.name = name
      estado.save
    else
      puts "Name não fornecido!"
    end

  end

  def lista(flag)
    puts "ID || NOME_ESTADO || SIGLA || CIDADES"
    estados = Estado.all
    estados.each do |estado|
      print "#{estado.id} || #{estado.name} || "
      if estado.sigla
        print "#{estado.sigla.name} || "
      else
        print " || "
      end
      if flag == 1 && estado.cidades
        cidades = estado.cidades
        cidades.each do |c|
          print "#{c.name} - "
        end
      end
      puts
    end

  end

  def exclui(condition, value)
    case condition
    when 'id'
      Estado.where(id: value).destroy_all
    when 'name'
      Estado.where(name: value).destroy_all
    end
  end

  def altera(condicao, velho, novo)
    puts condicao, velho, novo
    estado = Estado.find_by_name(velho)
    case condicao
    when 'name'
      estado.name = novo
      estado.save
    end
  end
end

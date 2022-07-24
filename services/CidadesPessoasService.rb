require './database/DatabaseConfig'
require './entities/Estado'

class EstadoService
  def initialize
    db = DatabaseConfig.new
    db.cidades_pessoas_tabela
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
end

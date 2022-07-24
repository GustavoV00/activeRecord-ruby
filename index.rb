require './entities/Cidade'
require './entities/Estado'
require './entities/Sigla'
require './entities/Pessoa'

require './services/CidadeService'
require './services/SiglaService'
require './services/EstadoService'
require './services/PessoaService'

def parse_inserir(arg1, arg2, arg3)
  # puts arg1, arg2, arg3

  aux1 = arg1.split('"') if arg1
  aux2 = arg2.split('"') if arg2
  aux3 = arg3.split('"') if arg3

  if arg1 && arg2 && arg3
    [aux1[1], aux2[1], aux3[1]]
  elsif arg1 && arg2 && arg3 == false
    [aux1[1], aux2[1]]
  else
    [aux1[1]]
  end
end

def parse_excluir(arg)
  if arg
    _arg = arg[2].split('"')
    _arg[0].delete! '='
    [_arg[0], _arg[1]]
  end
end

def insere(table, service, args, id)
  # puts 'ESTOU INSERINDO ALGUM CARAIO AQUI: ', table

  case table
  when 'cidades'
    args = parse_inserir(args[2], false, false)
    service.insere(args[0], id)

  when 'siglas'
    args = parse_inserir(args[2], false, false)
    service.insere(args[0], id)

  when 'pessoas'
    args = parse_inserir(args[2], false, false)
    service.insere(args[0], id)

  when 'estados'
    args = parse_inserir(args[2], false, false)
    service.insere(args[0])
  end
end

def exclui(table, args, service)
  arg = parse_excluir(args)
  service.exclui(arg[0], arg[1])
end

def altera(table, args, service)
  puts args
  velho = args[2].split('"')
  novo = args[3].split('"')
  print "VELHO: ", velho[1], " NOVO: ", novo[1], "\n"
  if velho[0] == novo[0]
    condition = velho[0]
    condition.delete! '='
    service.altera(condition, velho[1], novo[1])

  else
    puts "Condições diferentes!"
  end
end

def service(table)
  case table
  when 'cidades'
    CidadeService.new
  when 'estados'
    EstadoService.new
  when 'siglas'
    SiglaService.new
  when 'pessoas'
    PessoaService.new
  else 
    false
  end
end

def main
  while Kernel # loop
    command_input = gets.chomp.split(' ')
    # puts command_input.length

    command = command_input[0]
    table = command_input[1]
    service = service(command_input[1])

    if command == 'lista' && table == "estados" && service
      service.lista(1)
    elsif command == "lista" && service
      service.lista
    end

    if command == 'insere' && service
      case table
      when 'estados'
        insere(table, service, command_input, 0)
        puts "#{table} inserido com sucesso!"

      when 'pessoas'
        puts "Deseja atribuir esta pessoa a alguma cidade? [y/n]"
        y_n = gets.chomp.split(' ')
        if y_n[0] == "y"
          puts "Deseja atribuir a pessoa a quais cidades? Ex: 1 2 3 4 5"
          cidade = CidadeService.new
          cidade.lista
          
          id = gets.chomp.split(' ')
          insere(table, service, command_input, id)
          puts "#{table} inserido com sucesso!"

        else
          insere(table, service, command_input, -1)
          puts "#{table} inserido com sucesso!"
        end


      when 'siglas'
        puts "Deseja atribuir esta sigla a algum estado? [y/n]"
        y_n = gets.chomp.split(' ')
        if y_n[0] == "y"
          puts "Deseja atribuir a sigla qual estado? Digite o id:"
          estado = EstadoService.new
          estado.lista(0)
          
          id = gets.chomp.split(' ')
          insere(table, service, command_input, id[0])
          puts "#{table} inserido com sucesso!"

        else
          insere(table, service, command_input, -1)
          puts "#{table} inserido com sucesso!"
        end

      when 'cidades'
        puts "Deseja atribuir este cidade a algum estado? [y/n]"
        y_n = gets.chomp.split(' ')
        if y_n[0] == "y"
          puts "Deseja atribuir a cidade qual estado? Digite o id:"
          estado = EstadoService.new
          estado.lista(0)
          
          id = gets.chomp.split(' ')
          insere(table, service, command_input, id[0])
          puts "#{table} inserido com sucesso!"

        else
          puts "#{table} inserido com sucesso!"
        end
      end
    end

    if command == "exclui" && service
      exclui(table, command_input, service)
    end

    if command == "altera" && service
      altera(table, command_input, service)
    end
  end
end

main
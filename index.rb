require './entities/User'
require './entities/Movie'
require './entities/Tag'
require './entities/Rating'

require './services/UserService'
require './services/MovieService'
require './services/TagService'
require './services/RatingService'

def lista(_table)
  service.lista
end

def parse_inserir(arg1, arg2, arg3)
  # puts arg1, arg2, arg3

  aux1 = arg1.split('"') if arg1
  aux2 = arg2.split('"') if arg2
  aux3 = arg3.split('"') if arg3

  [aux1[1], aux2[1], aux3[1]]
end

def parse_excluir(arg)
  if arg
    _arg = arg.split('"')
    _arg[0].delete! '='

    [_arg[0], _arg[1]]
  end
end

def insere(table, service, args)
  puts 'ESTOU INSERINDO ALGUM CARAIO AQUI'

  case table
  when 'users'
    args = parse_inserir(args[2], arg[3], arg[4])
    service.insere(args[0], args[1], args[2])
  when 'tags'
    args = parse_inserir(args[2], false, false)
    service.insere(args[0])
  when 'movies'
    args = parse_inserir(args[2], args[3], false)
    service.insere(args[0], args[1])

  when 'rating'
    args = parse_inserir(args[2], false, false)
    service.insere(args[0])
  end
end

def exclui(table, args)
  case table
  when 'users'
    service = UserService.new

  when 'tags'
    service = TagService.new

  when 'movies'
    service = MovieService.new

  when 'rating'
    service = RatingService.new
  end

  args = parse_excluir(args)
  service.exclui(args[0], args[1])
end

def atribuicao(table)
  puts "Deseja atribuir o(a) #{table} quem ? "
  id = gets.chomp.split(' ')

  case table
  when 'movie'
    users.id = id
    user.save
  end
end

def service(table)
  case table
  when 'users'
    UserService.new

  when 'tags'
    TagService.new

  when 'movies'
    MovieService.new

  when 'rating'
    RatingService.new

  end
end

def main
  while Kernel # loop
    command_input = gets.chomp.split(' ')
    puts command_input.length

    command = command_input[0]
    table = command_input[1]
    service = service(command_input[1])

    service.lista if command == 'lista'

    insere(table, command_input) if command == 'insere'
    # infos = parse_inserir(command_input[2], command_input[3], false) if table == 'movies'
    # infos = parse_inserir(command_input[2], command_input[3], command_input[4]) if table == 'tags'
    # infos = parse_inserir(command_input[2], command_input[3], command_input[4]) if table == 'rating'

    # inserir(infos[0], infos[1], infos[2])
    #   atribuicao(command_input[1])

  end
end

main

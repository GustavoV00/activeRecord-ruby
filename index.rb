require './entities/User'
require './entities/Movie'
require './entities/Tag'
require './entities/Rating'

require './services/UserService'
require './services/MovieService'
require './services/TagService'
require './services/RatingService'

def lista(table)
  if table == 'users'
    user_service = UserService.new
    user_service.lista
  end

  if table == 'tags'
    tag_service = TagService.new
    tag_service.lista
  end

  if table == 'movies'
    movie_service = MovieService.new
    movie_service.lista
  end

  if table == 'rating'
    rating_service = RatingService.new
    rating_service.lista
  end
end

def parse_inserir(arg1, arg2, arg3)
  # puts arg1, arg2, arg3

  _arg1 = arg1.split('"') if arg1

  _arg2 = arg2.split('"') if arg2

  _arg3 = arg3.split('"') if arg3


  [_arg1[1], _arg2[1], _arg3[1]]
end

def parse_excluir(arg)

  if arg
    _arg = arg.split('"')

    _arg[0].delete! "="

    [_arg[0], _arg[1]]
  end

end

def insere(table, arg1, arg2, arg3)
  puts 'ESTOU INSERINDO ALGUM CARAIO AQUI'

  if table == 'users'
    args = parse_inserir(arg1, arg2, arg3)
    user_service = UserService.new
    user_service.insere(args[0], args[1], args[2])
  end

  if table == 'tags'
    args = parse_inserir(arg1, false, false)
    tag_service = TagService.new
    tag_service.insere(args[0])
  end

  if table == 'movies'
    args = parse_inserir(arg1, arg2, false)
    movie_service = MovieService.new
    movie_service.insere(args[0], args[1])
  end

  if table == 'rating'
    args = parse_inserir(arg1, false, false)
    rating_service = RatingService.new
    rating_service.insere(args[0])
  end
end

def exclui(table, args)

  case table
  when "users"
    service = UserService.new
  when "tags"
    service = TagService.new
  when "movies"
    service = MovieService.new
  when "rating"
    service = RatingService.new
  end

  args = parse_excluir(args)
  service.exclui(args[0], args[1])
end

# def test(_op1, _table, _arg1, _arg2, _arg3)
while true
  command_input = gets.chomp.split(' ') # gsub(/\s+/m, ' ').strip.split(' ')
  puts command_input.length

  lista(command_input[1]) if command_input.length == 2 && command_input[0] == 'lista'

  if command_input.length == 5 && (command_input[0] == 'insere')
    insere(command_input[1], command_input[2], command_input[3], command_input[4])
  end

  if command_input.length == 3 && (command_input[0] == 'exclui')
    exclui(command_input[1], command_input[2])
  end
end

require './repositories/MovieRepository'

class MovieService
  def initialize
    @movie_repository = MovieRepository.new
  end

  def insere(name, description)
    @movie_repository.insere(name, description)
  end

  def lista
    @movie_repository.lista
  end

  def exclui(condition, value)
    @movie_repository.exclui(condition, value)
  end
end

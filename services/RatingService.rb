require './repositories/RatingRepository'

class RatingService
  def initialize
    @rating_repository = RatingRepository.new
  end

  def insere(rating)
    @rating_repository.insere(rating)
  end

  def lista
    @rating_repository.lista
  end

  def exclui(condition, value)
    @rating_repository.exclui(condition, value)
  end
end

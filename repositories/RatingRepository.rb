require './database/DatabaseConfig'
require './entities/Rating'

class RatingRepository
  def initialize
    db = DatabaseConfig.new
    db.ratings_table
  end

  def insere(rating)
    rat = Rating.new({
                       rating: rating
                     })

    rat.save
  end

  def lista
    rating = Rating.all
    rating.each do |r|
      puts r.rating
    end
  end

  def exclui(condition, value)
    # puts "SELECT * from ratings WHERE #{condition} = '#{value}'"
    rating = Rating.find_by_sql("SELECT * from ratings WHERE #{condition} = '#{value}'")
    Rating.delete(rating)
  end
end

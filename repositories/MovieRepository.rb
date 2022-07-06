require './database/DatabaseConfig'
require './entities/Movie'

class MovieRepository
  def initialize
    db = DatabaseConfig.new
    db.movies_table
  end

  def insere(name, description)
    movie = Movie.new({
                        name: name,
                        description: description
                      })

    movie.save
  end

  def lista
    movie = Movie.all
    movie.each do |m|
      puts "#{m.name} || #{m.description}"
    end
  end

  def exclui(condition, value)
    # puts "SELECT * from movies WHERE #{condition} = '#{value}'"
    movie = Movie.find_by_sql("SELECT * from movies WHERE #{condition} = '#{value}'")
    Movie.delete(movie)
  end
end

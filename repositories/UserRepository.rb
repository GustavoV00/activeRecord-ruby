require './database/DatabaseConfig'
require './entities/User'
require './entities/Movie'

class UserRepository
  def initialize
    db = DatabaseConfig.new
    db.users_table
  end

  def insere(first_name, last_name, email, id)
    user = User.new({
                      first_name: first_name,
                      last_name: last_name,
                      email: email,
                    })

    movie.id = id
    user.save
  end

  def lista
    user = User.all
    user.each do |p|
      puts "#{p.first_name} || #{p.last_name} || #{p.email}"
    end
  end

  def exclui(condition, value)
    puts "SELECT * from users WHERE #{condition} = '#{value}'"
    user = User.find_by_sql("SELECT * from users WHERE #{condition} = '#{value}'")
    User.delete(user)
  end
end

require 'active_record'

class DatabaseConfig
  def initialize
    ActiveRecord::Base.establish_connection(
      adapter: 'sqlite3',
      database: 'Tabelas.sqlite3'
    )
  end

  def users_table
    usersExists = ActiveRecord::Base.connection.data_source_exists? 'users'
    unless usersExists
      ActiveRecord::Base.connection.create_table :users do |u|
        u.string      :first_name,    limit: 30
        u.string      :last_name,     limit: 30
        u.string      :email,         limit: 30
      end
    end
  end

  def movies_table
    moviesExists = ActiveRecord::Base.connection.data_source_exists? 'movies'
    unless moviesExists
      ActiveRecord::Base.connection.create_table :movies do |m|
        m.string      :name, limit: 50
        m.string      :description, limit: 500
        m.references  :users, foreign_key: true
      end
    end
  end

  def tags_table
    tagsExists = ActiveRecord::Base.connection.data_source_exists? 'tags'
    unless tagsExists
      ActiveRecord::Base.connection.create_table :tags do |t|
        t.string      :tag, limit: 50
      end
    end
  end

  def ratings_table
    ratingsExists = ActiveRecord::Base.connection.data_source_exists? 'ratings'
    unless ratingsExists
      ActiveRecord::Base.connection.create_table :ratings do |r|
        r.string      :rating, limit: 50
      end
    end
  end
end

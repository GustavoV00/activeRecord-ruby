require 'active_record'

class DatabaseConfig
  def initialize
    ActiveRecord::Base.establish_connection(
      adapter: 'sqlite3',
      database: 'Tabelas.sqlite3'
    )
  end
end

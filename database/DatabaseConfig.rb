require 'active_record'

class DatabaseConfig
  def initialize
    ActiveRecord::Base.establish_connection(
      adapter: 'sqlite3',
      database: 'Tabelas.sqlite3'
    )
  end

  def pessoas_table
    pessoasExists = ActiveRecord::Base.connection.data_source_exists? 'pessoas'
    unless pessoasExists
      ActiveRecord::Base.connection.create_table :pessoas do |p|
        p.string :first_name, limit: 30
        p.string      :last_name,     limit: 30
        p.string      :address,       limit: 30
        p.string      :city,          limit: 30
      end
    end
  end
end

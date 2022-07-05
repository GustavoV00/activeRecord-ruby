require './database/DatabaseConfig'
require './entities/Pessoa'

class PessoaRepository
  def initialize
    db = DatabaseConfig.new
    db.pessoas_table
  end

  def insere(first_name, last_name, address, city)
    pes = Pessoa.new({
                       first_name: first_name,
                       last_name: last_name,
                       address: address,
                       city: city
                     })

    pes.save
  end

  def lista
    pes = Pessoa.all
    pes.each do |p|
      puts "#{p.first_name} || #{p.last_name} || #{p.address} || #{p.city}"
    end
  end

  def exclui(condition, value)
    puts "SELECT * from pessoas WHERE #{condition} = '#{value}'"
    pes = Pessoa.find_by_sql("SELECT * from pessoas WHERE #{condition} = '#{value}'")
    Pessoa.delete(pes)
  end
end

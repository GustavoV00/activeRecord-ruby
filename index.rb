require './entities/Pessoa'
require './services/PessoaService'
require './database/DatabaseConfig'

puts 'Hello World!'
DatabaseConfig.new
Pessoa.new('firstname', 'last_name', 'CURITIBA', 'PR')
pes = PessoaService.new

pes.lista

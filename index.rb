require './services/PessoaService'
require './entities/Pessoa'

pes_service = PessoaService.new

pes_service.insere('firs_name', 'last_name', 'address', 'city')
pes_service.lista

puts "\n\n\n\n"

# pes_service.insere('TESTESTES', 'last_name', 'address', 'city')
pes_service.lista
pes_service.exclui('first_name', 'firs_name')

puts "\n\n\n\n\n\n\n\n\n\n\n\n"
pes_service.lista

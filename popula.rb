require './entities/Cidade'
require './entities/Estado'
require './entities/Sigla'
require './entities/Pessoa'

require './services/CidadeService'
require './services/SiglaService'
require './services/EstadoService'
require './services/PessoaService'

if !File.exists?("Tabelas.sqlite3")
    estadoService = EstadoService.new
    (1..15).each do |i|
        est = Estado.new
        est.name = "Estado#{i}"
        est.save
    end

    cidadeService = CidadeService.new
    (1..15).each do |i|
        cid = Cidade.new
        cid.name = "Cidade#{i}"
        estado = Estado.find_by_id(rand(1..15))
        cid.estado = estado
        cid.save
    end

    pessoaService = PessoaService.new
    (1..15).each do |i|
        pes = Pessoa.new
        pes.name = "Pessoa#{i}"
        pes.save
    end

    [1,2,3].each do |cidade_id|
        cidade = Cidade.find_by_id(cidade_id)
        pessoa = Pessoa.find_by_id(rand(1..15))
        pessoa.cidades << cidade
        pessoa.save
    end

    siglaService = SiglaService.new
    (1..15).each do |i|
        sig = Sigla.new
        sig.name = "sigla#{i}"
        if i % 2 == 0
            estado = Estado.find_by_id(i-1)
            sig.estado = estado
        end
        sig.save
    end
else
    puts "Arquivo de banco de dados já existe!"
end
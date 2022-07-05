require './repositories/PessoaRepository'

class PessoaService
  def initialize
    @pessoa_repository = PessoaRepository.new
  end

  def insere(first_name, last_name, address, city)
    @pessoa_repository.insere(first_name, last_name, address, city)
  end

  def lista
    @pessoa_repository.lista
  end

  def exclui(condition, value)
    @pessoa_repository.exclui(condition, value)
  end
end

require './repositories/PessoaRepository'

class PessoaService
  def initialize
    @pessoa_repository = PessoaRepository.new
    # puts 'TA QUE PARIU'
  end

  #   def insere(pessoa)
  #     pessoaRepository.insere(pessoa)
  #   end

  def lista
    @pessoa_repository.lista
  end

  #   def exclui
  #     pessoaRepository.exclui
  #   end
end

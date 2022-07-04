class PessoaRepository
  def insert(pes)
    puts pes.first_name
    puts pes.last_name
  end

  def lista
    puts 'Listando todos os usuários'
  end

  def exclui
    puts 'Excluindo uma pessoa'
  end
end

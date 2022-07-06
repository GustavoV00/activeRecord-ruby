require './repositories/UserRepository'

class UserService
  def initialize
    @user_repository = UserRepository.new
  end

  def insere(first_name, last_name, email)
    @user_repository.insere(first_name, last_name, email)
  end

  def lista
    @user_repository.lista
  end

  def exclui(condition, value)
    @user_repository.exclui(condition, value)
  end
end

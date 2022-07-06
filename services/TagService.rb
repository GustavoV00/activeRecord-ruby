require './repositories/TagRepository'

class TagService
  def initialize
    @tag_repository = TagRepository.new
  end

  def insere(tag)
    @tag_repository.insere(tag)
  end

  def lista
    @tag_repository.lista
  end

  def exclui(condition, value)
    @tag_repository.exclui(condition, value)
  end
end

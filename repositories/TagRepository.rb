require './database/DatabaseConfig'
require './entities/Tag'

class TagRepository
  def initialize
    db = DatabaseConfig.new
    db.tags_table
  end

  def insere(tag)
    tag = Tag.new({
                    tag: tag
                  })

    tag.save
  end

  def lista
    tag = Tag.all
    tag.each do |t|
      puts t.tag
    end
  end

  def exclui(condition, value)
    # puts "SELECT * from tags WHERE #{condition} = '#{value}'"
    tag = Tag.find_by_sql("SELECT * from tags WHERE #{condition} = '#{value}'")
    Tag.delete(tag)
  end
end

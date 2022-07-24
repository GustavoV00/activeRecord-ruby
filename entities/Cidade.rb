require 'active_record'

class Cidade < ActiveRecord::Base
  belongs_to :estado
  has_and_belongs_to_many :pessoas
end

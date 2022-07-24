
require 'active_record'

class Pessoa < ActiveRecord::Base
  has_and_belongs_to_many :cidades
end
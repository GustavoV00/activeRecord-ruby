require 'active_record'

class Estado < ActiveRecord::Base
  has_many :cidades, dependent: :destroy
  has_one  :sigla, dependent: :destroy
end

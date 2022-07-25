require 'active_record'

class Sigla < ActiveRecord::Base
    belongs_to :estado
end

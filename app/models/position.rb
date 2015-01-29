class Position < ActiveRecord::Base
  DIRECTOR_ID = 2.freeze
  
  has_many :employees
end

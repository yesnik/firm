class Position < ActiveRecord::Base
  SPECIALIST_ID = 1.freeze
  DIRECTOR_ID = 2.freeze
  
  has_many :employees
end

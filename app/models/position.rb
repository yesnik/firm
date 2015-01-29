class Position < ActiveRecord::Base
  DIRECTOR_ID = 2.freeze
  SPECIALIST_ID = 1.freeze
  
  has_many :employees
end

class Employee < ActiveRecord::Base
  #belongs_to :company
  #has_and_belongs_to_many :companies,:dependent => :restrict_with_error
  validates :first_name, :middle_name, :last_name,
    presence: true 
  has_many :companies_employees
  has_many :companies, through: :companies_employees, :dependent => :restrict_with_error
end

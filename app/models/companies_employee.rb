class CompaniesEmployee < ActiveRecord::Base
  belongs_to :company
  belongs_to :employee
end

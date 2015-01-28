class Company < ActiveRecord::Base
  POSITION_DIRECTOR_ID = 2.freeze

	validates :title, presence: true
	# Если вам не нужно ничего делать с моделью отношений, проще настроить 
	# связь has_and_belongs_to_many (хотя нужно не забыть создать соединяющую таблицу 
	# в базе данных).
	# Вы должны использовать has_many :through, если нужны валидации, 
	# колбэки или дополнительные атрибуты для соединительной модели
	
	## has_and_belongs_to_many :employees, :dependent => :restrict_with_error
	has_many :companies_employees
  has_many :employees, through: :companies_employees, :dependent => :restrict_with_error

  def director
  	self.employees.where(position_id: POSITION_DIRECTOR_ID).first || nil
  end

  def workers
  	self.employees.where.not(position_id: POSITION_DIRECTOR_ID)
  end
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Создадим должности для пользователей
Position.create([
  {title: 'специалист'},
  {title: 'директор'},
  {title: 'бухгалтер'},
  {title: 'электрик'}
])

specialist_id = Position::SPECIALIST_ID
director_id = Position::DIRECTOR_ID
Employee.create([
  {first_name: 'Иван', middle_name: 'Владимирович', 
      last_name: 'Дорин', position_id: specialist_id},
  {first_name: 'Ксения', middle_name: 'Ивановна', 
      last_name: 'Рубцова', position_id: specialist_id},
  {first_name: 'Даниил', middle_name: 'Александрович', 
      last_name: 'Рыбаков', position_id: director_id},
  {first_name: 'Петр', middle_name: 'Алексеевич', 
      last_name: 'Донцов', position_id: specialist_id},
  {first_name: 'Мария', middle_name: 'Алексеевна', 
      last_name: 'Петрова', position_id: specialist_id},
])

Company.create([
  {title: 'ОАО Газпром'},
  {title: 'ЗАО Тандер'},
  {title: 'ОАО СКБ-банк'},
  {title: 'ОАО СКБ-Контур'},
  {title: 'ОАО Яндекс'},
  {title: 'ООО Пикник'},
])

c = Company.first
c.employees << Employee.find(1)
c.employees << Employee.find(2)
c.employees << Employee.find(3)
c.save

c2 = Company.second
c2.employees << Employee.find(3)
c2.employees << Employee.find(4)
c2.employees << Employee.find(5)
c2.save

c3 = Company.second
c3.employees << Employee.find(2)
c3.employees << Employee.find(3)
c3.employees << Employee.find(5)
c3.save

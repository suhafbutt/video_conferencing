# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Mentor.create([{first_name: 'Max', last_name: 'Mustermann', email: 'max@xyz.com', time_zone: 'Pacific Time (US & Canada)'}])
Student.create([{first_name: 'Joe', last_name: 'Hart', email: 'joe@xyz.com', time_zone: 'Berlin'}])
Mentor.create([{first_name: 'Sergio', last_name: 'Ramos', email: 'sergio@xyz.com', time_zone: 'Budapest'}])
Student.create([{first_name: 'Ryan', last_name: 'Harris', email: 'ryan@abc.com', time_zone: 'Dublin'}])
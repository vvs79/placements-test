# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create!(name: 'Admin', login: 'admin', email: 'admin@admin.com', password: '87654321', admin: true)
User.create!(name: 'User', login: 'user', email: 'u@u.com', password: '12345678', admin: false)

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Event.destroy_all
User.destroy_all

User.create(
  email: 'jacob@zmail.com',
  password: '1',
  password_confirmation: '1'
)
User.create(
  email: 'michael@zmail.com',
  password: '1',
  password_confirmation: '1'
)
User.create(
  email: 'bob@zmail.com',
  password: '1',
  password_confirmation: '1'
)
User.create(
  email: 'meg@zmail.com',
  password: '1',
  password_confirmation: '1'
)

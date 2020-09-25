# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Website.create(url: 'http://www.google.com', title: 'Google', description: 'This is a google mockup', image: 'https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png')

User.create(email: 'brandon@brandon.com', password: 'hello')

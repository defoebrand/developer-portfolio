# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Website.find_or_create_by(url: 'http://www.google.com',
                          title: 'Google',
                          description: 'This is a google mockup',
                          image: 'https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png',
                          code: 'nothing')

Game.find_or_create_by(url: 'https://simple.game/shooting-online/infinity-neon-blocks/',
                       title: 'Infinity Neon Blocks',
                       description: 'A simple shooter game',
                       image: 'https://simple.game/assets/games/u264w2x2/icon-96x96.png',
                       code: 'nothing')

App.find_or_create_by(url: 'https://www.charactercountonline.com/',
                      title: 'Online Character Counter',
                      description: 'Online tool to count characters',
                      image: 'https://www.charactercountonline.com/images/icon-32.png',
                      code: 'nothing')

Stack.find_or_create_by(name: 'HTML', color: 'primary')
Stack.find_or_create_by(name: 'CSS', color: 'success')
Stack.find_or_create_by(name: 'Javascript', color: 'warning')
Stack.find_or_create_by(name: 'Ruby', color: 'danger')

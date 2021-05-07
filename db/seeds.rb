# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Publisher.create(name:"Publicadora1")
Publisher.create(name:"Publicadora2")
  #User.image.attached(io: File.open('./public/nome_imagem.formato'), filename:'nome_imagem.formato')

User.create(name:"Administrador",email:"admin@admin",password:"adm123",password_confirmation:"adm123",is_Admin:true)
10.times do
Category.create(name: Faker::Game.genre)
end

10.times do
  Game.create(name: Faker::Game.title)
end

Gamecategory.create(game_id:1, category_id:1)
Gamecategory.create(game_id:1, category_id:2)
Gamecategory.create(game_id:2, category_id:1)
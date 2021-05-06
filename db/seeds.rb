# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Publisher.create(name:"Publicadora1")
Publisher.create(name:"Publicadora2")
  #User.image.attached(io: File.open('./public/nome_imagem.formato'), filename:'nome_imagem.formato')

User.create(name:"Administrador",email:"admin@admin",password:"adm123",password_confirmation:"adm123",is_Admin:true)
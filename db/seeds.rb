# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Movie.destroy_all
Restaurant.destroy_all
Combo.destroy_all


Movie.create!(name:"Kung Fu Panda", genre:"Animation", description:"The Dragon Warrior has to clash against the savage Tai Lung as China's fate hangs in the balance. However, the Dragon Warrior mantle is supposedly mistaken to be bestowed upon an obese panda who is a novice in martial arts.
",photo_url:"https://m.media-amazon.com/images/M/MV5BODJkZTZhMWItMDI3Yy00ZWZlLTk4NjQtOTI1ZjU5NjBjZTVjXkEyXkFqcGdeQXVyODE5NzE3OTE@._V1_SY1000_CR0,0,689,1000_AL_.jpg",link_url:"https://www.imdb.com/title/tt0441773/?ref_=nv_sr_1?ref_=nv_sr_1")
Movie.create!(name:"Blackfish", genre:"Documentary", description:"A documentary following the controversial captivity of killer whales, and its dangers for both humans and whales.
",photo_url:"https://m.media-amazon.com/images/M/MV5BNTkyNTkwMzkxMl5BMl5BanBnXkFtZTcwMzAwOTE2OQ@@._V1_SY1000_CR0,0,674,1000_AL_.jpg",link_url:"https://www.imdb.com/title/tt2545118/?ref_=nv_sr_1?ref_=nv_sr_1")
Movie.create!(name:"", genre:"", description:"",photo_url:"",link_url:"")
Movie.create!(name:"", genre:"", description:"",photo_url:"",link_url:"")
Movie.create!(name:"", genre:"", description:"",photo_url:"",link_url:"")


Restaurant.create!(name:"", food_type:"Chinese", photo_url:"", link_url:"")
Restaurant.create!(name:"", food_type:"Sushi", photo_url:"", link_url:"")
Restaurant.create!(name:"", food_type:"", photo_url:"", link_url:"")
Restaurant.create!(name:"", food_type:"", photo_url:"", link_url:"")
Restaurant.create!(name:"", food_type:"", photo_url:"", link_url:"")


Combo.create!(name:"", description:"",food_type:"Chinese", movie: Movie.where(name: "Kung Fu Panda"))
Combo.create!(name:"", description:"",food_type:"Sushi", movie: Movie.where(name: "Blackfish"))
Combo.create!(name:"", description:"",food_type:"", movie: Movie.where(name: ""))
Combo.create!(name:"", description:"",food_type:"", movie: Movie.where(name: ""))
Combo.create!(name:"", description:"",food_type:"", movie: Movie.where(name: ""))






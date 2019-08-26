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
Movie.create!(name:"Jaws", genre:"Adventure", description:"When a killer shark unleashes chaos on a beach community, it's up to a local sheriff, a marine biologist, and an old seafarer to hunt the beast down.
",photo_url:"https://m.media-amazon.com/images/M/MV5BMmVmODY1MzEtYTMwZC00MzNhLWFkNDMtZjAwM2EwODUxZTA5XkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_SX651_CR0,0,651,999_AL_.jpg",link_url:"https://www.imdb.com/title/tt0073195/?ref_=fn_al_tt_1")
Movie.create!(name:"The Angry Birds Movie", genre:"Comedy", description:"Find out why the birds are so angry. When an island populated by happy, flightless birds is visited by mysterious green piggies, it's up to three unlikely outcasts - Red, Chuck and Bomb - to figure out what the pigs are up to.
",photo_url:"https://m.media-amazon.com/images/M/MV5BMTY3MjU0NDA0OF5BMl5BanBnXkFtZTgwNTc0MTU3OTE@._V1_SY1000_CR0,0,702,1000_AL_.jpg",link_url:"https://www.imdb.com/title/tt1985949/?ref_=fn_al_tt_4")
Movie.create!(name:"The Silence of Lambs", genre:"Crime", description:"A young F.B.I. cadet must receive the help of an incarcerated and manipulative cannibal killer to help catch another serial killer, a madman who skins his victims.
",photo_url:"https://m.media-amazon.com/images/M/MV5BNjNhZTk0ZmEtNjJhMi00YzFlLWE1MmEtYzM1M2ZmMGMwMTU4XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SY1000_CR0,0,677,1000_AL_.jpg",link_url:"https://www.imdb.com/title/tt0102926/?ref_=nv_sr_1?ref_=nv_sr_1")
Movie.create!(name:"Blade Runner", genre:"Sci-Fi", description:"A blade runner must pursue and terminate four replicants who stole a ship in space, and have returned to Earth to find their creator.
",photo_url:"https://m.media-amazon.com/images/M/MV5BNzQzMzJhZTEtOWM4NS00MTdhLTg0YjgtMjM4MDRkZjUwZDBlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SY1000_CR0,0,671,1000_AL_.jpg",link_url:"https://www.imdb.com/title/tt0083658/?ref_=nv_sr_2?ref_=nv_sr_2")


Restaurant.create!(name:"", food_type:"Chinese", photo_url:"", link_url:"https://deliveroo.co.uk/menu/london/old-street/the-old-street-chinese?day=today&postcode=E28DY&time=ASAP")
Restaurant.create!(name:"", food_type:"Sushi", photo_url:"", link_url:"")
Restaurant.create!(name:"", food_type:"Fish&Chips", photo_url:"", link_url:"")
Restaurant.create!(name:"", food_type:"Chicken", photo_url:"", link_url:"")
Restaurant.create!(name:"", food_type:"Shawarma", photo_url:"", link_url:"")


Combo.create!(name:"", description:"",food_type:"Chinese", movie: Movie.where(name: "Kung Fu Panda"))
Combo.create!(name:"", description:"",food_type:"Sushi", movie: Movie.where(name: "Blackfish"))
Combo.create!(name:"", description:"",food_type:"Fish&Chips", movie: Movie.where(name: "Jaws"))
Combo.create!(name:"", description:"",food_type:"Chicken", movie: Movie.where(name: "The Angry Birds Movie"))
Combo.create!(name:"", description:"",food_type:"Shawarma", movie: Movie.where(name: "The Silence of Lambs"))






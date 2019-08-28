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


# Movie seeds
Movie.create!(name:"Kung Fu Panda", genre:"animation", description:"The Dragon Warrior has to clash against the savage Tai Lung as China's fate hangs in the balance. However, the Dragon Warrior mantle is supposedly mistaken to be bestowed upon an obese panda who is a novice in martial arts.
# ",photo_url:"https://m.media-amazon.com/images/M/MV5BODJkZTZhMWItMDI3Yy00ZWZlLTk4NjQtOTI1ZjU5NjBjZTVjXkEyXkFqcGdeQXVyODE5NzE3OTE@._V1_SY1000_CR0,0,689,1000_AL_.jpg",link_url:"https://www.imdb.com/title/tt0441773/?ref_=nv_sr_1?ref_=nv_sr_1")
Movie.create!(name:"Blackfish", genre:"documentary", description:"A documentary following the controversial captivity of killer whales, and its dangers for both humans and whales.
",photo_url:"https://m.media-amazon.com/images/M/MV5BNTkyNTkwMzkxMl5BMl5BanBnXkFtZTcwMzAwOTE2OQ@@._V1_SY1000_CR0,0,674,1000_AL_.jpg",link_url:"https://www.imdb.com/title/tt2545118/?ref_=nv_sr_1?ref_=nv_sr_1")
Movie.create!(name:"Jaws", genre:"adventure", description:"When a killer shark unleashes chaos on a beach community, it's up to a local sheriff, a marine biologist, and an old seafarer to hunt the beast down.
# ",photo_url:"https://m.media-amazon.com/images/M/MV5BMmVmODY1MzEtYTMwZC00MzNhLWFkNDMtZjAwM2EwODUxZTA5XkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_SX651_CR0,0,651,999_AL_.jpg",link_url:"https://www.imdb.com/title/tt0073195/?ref_=fn_al_tt_1")
# Movie.create!(name:"The Angry Birds Movie", genre:"comedy", description:"Find out why the birds are so angry. When an island populated by happy, flightless birds is visited by mysterious green piggies, it's up to three unlikely outcasts - Red, Chuck and Bomb - to figure out what the pigs are up to.
# ",photo_url:"https://m.media-amazon.com/images/M/MV5BMTY3MjU0NDA0OF5BMl5BanBnXkFtZTgwNTc0MTU3OTE@._V1_SY1000_CR0,0,702,1000_AL_.jpg",link_url:"https://www.imdb.com/title/tt1985949/?ref_=fn_al_tt_4")
# Movie.create!(name:"The Silence of Lambs", genre:"crime", description:"A young F.B.I. cadet must receive the help of an incarcerated and manipulative cannibal killer to help catch another serial killer, a madman who skins his victims.
# ",photo_url:"https://m.media-amazon.com/images/M/MV5BNjNhZTk0ZmEtNjJhMi00YzFlLWE1MmEtYzM1M2ZmMGMwMTU4XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SY1000_CR0,0,677,1000_AL_.jpg",link_url:"https://www.imdb.com/title/tt0102926/?ref_=nv_sr_1?ref_=nv_sr_1")
# Movie.create!(name:"Blade Runner", genre:"sci-fi", description:"A blade runner must pursue and terminate four replicants who stole a ship in space, and have returned to Earth to find their creator.
# ",photo_url:"https://m.media-amazon.com/images/M/MV5BNzQzMzJhZTEtOWM4NS00MTdhLTg0YjgtMjM4MDRkZjUwZDBlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SY1000_CR0,0,671,1000_AL_.jpg",link_url:"https://www.imdb.com/title/tt0083658/?ref_=nv_sr_2?ref_=nv_sr_2")


# Movie.create!(name:"Kung Fu Panda2", genre:"animation", description:"The Dragon Warrior has to clash against the savage Tai Lung as China's fate hangs in the balance. However, the Dragon Warrior mantle is supposedly mistaken to be bestowed upon an obese panda who is a novice in martial arts.
# ",photo_url:"https://m.media-amazon.com/images/M/MV5BODJkZTZhMWItMDI3Yy00ZWZlLTk4NjQtOTI1ZjU5NjBjZTVjXkEyXkFqcGdeQXVyODE5NzE3OTE@._V1_SY1000_CR0,0,689,1000_AL_.jpg",link_url:"https://www.imdb.com/title/tt0441773/?ref_=nv_sr_1?ref_=nv_sr_1")
Movie.create!(name:"Jiro Dreams of Sushi", genre:"documentary", description:"Revered sushi chef Jiro Ono strives for perfection in his work, while his eldest son, Yoshikazu, has trouble living up to his father's legacy.
",photo_url:"https://m.media-amazon.com/images/M/MV5BMTA5NzQzODUxOTheQTJeQWpwZ15BbWU3MDIwODg1MDc@._V1_SY1000_CR0,0,715,1000_AL_.jpg",link_url:"https://www.imdb.com/title/tt1772925/?ref_=fn_al_tt_1")
# Movie.create!(name:"Jaws2", genre:"adventure", description:"When a killer shark unleashes chaos on a beach community, it's up to a local sheriff, a marine biologist, and an old seafarer to hunt the beast down.
# ",photo_url:"https://m.media-amazon.com/images/M/MV5BMmVmODY1MzEtYTMwZC00MzNhLWFkNDMtZjAwM2EwODUxZTA5XkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_SX651_CR0,0,651,999_AL_.jpg",link_url:"https://www.imdb.com/title/tt0073195/?ref_=fn_al_tt_1")
# Movie.create!(name:"The Angry Birds Movie2", genre:"comedy", description:"Find out why the birds are so angry. When an island populated by happy, flightless birds is visited by mysterious green piggies, it's up to three unlikely outcasts - Red, Chuck and Bomb - to figure out what the pigs are up to.
# ",photo_url:"https://m.media-amazon.com/images/M/MV5BMTY3MjU0NDA0OF5BMl5BanBnXkFtZTgwNTc0MTU3OTE@._V1_SY1000_CR0,0,702,1000_AL_.jpg",link_url:"https://www.imdb.com/title/tt1985949/?ref_=fn_al_tt_4")
# Movie.create!(name:"The Silence of Lambs2", genre:"crime", description:"A young F.B.I. cadet must receive the help of an incarcerated and manipulative cannibal killer to help catch another serial killer, a madman who skins his victims.
# ",photo_url:"https://m.media-amazon.com/images/M/MV5BNjNhZTk0ZmEtNjJhMi00YzFlLWE1MmEtYzM1M2ZmMGMwMTU4XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SY1000_CR0,0,677,1000_AL_.jpg",link_url:"https://www.imdb.com/title/tt0102926/?ref_=nv_sr_1?ref_=nv_sr_1")
# Movie.create!(name:"Blade Runner2", genre:"sci-fi", description:"A blade runner must pursue and terminate four replicants who stole a ship in space, and have returned to Earth to find their creator.
# ",photo_url:"https://m.media-amazon.com/images/M/MV5BNzQzMzJhZTEtOWM4NS00MTdhLTg0YjgtMjM4MDRkZjUwZDBlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SY1000_CR0,0,671,1000_AL_.jpg",link_url:"https://www.imdb.com/title/tt0083658/?ref_=nv_sr_2?ref_=nv_sr_2")


# Movie.create!(name:"Kung Fu Panda3", genre:"animation", description:"The Dragon Warrior has to clash against the savage Tai Lung as China's fate hangs in the balance. However, the Dragon Warrior mantle is supposedly mistaken to be bestowed upon an obese panda who is a novice in martial arts.
# ",photo_url:"https://m.media-amazon.com/images/M/MV5BODJkZTZhMWItMDI3Yy00ZWZlLTk4NjQtOTI1ZjU5NjBjZTVjXkEyXkFqcGdeQXVyODE5NzE3OTE@._V1_SY1000_CR0,0,689,1000_AL_.jpg",link_url:"https://www.imdb.com/title/tt0441773/?ref_=nv_sr_1?ref_=nv_sr_1")
Movie.create!(name:"The Endless Summer", genre:"documentary", description:"The crown jewel to ten years of Bruce Brown surfing documentaries. Brown follows two young surfers around the world in search of the perfect wave, and ends up finding quite a few in addition to some colorful local characters.
",photo_url:"https://m.media-amazon.com/images/M/MV5BMjEzODQ1Njg4M15BMl5BanBnXkFtZTgwODIyOTcwMjE@._V1_SY1000_CR0,0,674,1000_AL_.jpg",link_url:"https://www.imdb.com/title/tt0060371/?ref_=fn_al_tt_1")
# Movie.create!(name:"Jaws3", genre:"adventure", description:"When a killer shark unleashes chaos on a beach community, it's up to a local sheriff, a marine biologist, and an old seafarer to hunt the beast down.
# ",photo_url:"https://m.media-amazon.com/images/M/MV5BMmVmODY1MzEtYTMwZC00MzNhLWFkNDMtZjAwM2EwODUxZTA5XkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_SX651_CR0,0,651,999_AL_.jpg",link_url:"https://www.imdb.com/title/tt0073195/?ref_=fn_al_tt_1")
# Movie.create!(name:"The Angry Birds Movie3", genre:"comedy", description:"Find out why the birds are so angry. When an island populated by happy, flightless birds is visited by mysterious green piggies, it's up to three unlikely outcasts - Red, Chuck and Bomb - to figure out what the pigs are up to.
# ",photo_url:"https://m.media-amazon.com/images/M/MV5BMTY3MjU0NDA0OF5BMl5BanBnXkFtZTgwNTc0MTU3OTE@._V1_SY1000_CR0,0,702,1000_AL_.jpg",link_url:"https://www.imdb.com/title/tt1985949/?ref_=fn_al_tt_4")
# Movie.create!(name:"The Silence of Lambs3", genre:"crime", description:"A young F.B.I. cadet must receive the help of an incarcerated and manipulative cannibal killer to help catch another serial killer, a madman who skins his victims.
# ",photo_url:"https://m.media-amazon.com/images/M/MV5BNjNhZTk0ZmEtNjJhMi00YzFlLWE1MmEtYzM1M2ZmMGMwMTU4XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SY1000_CR0,0,677,1000_AL_.jpg",link_url:"https://www.imdb.com/title/tt0102926/?ref_=nv_sr_1?ref_=nv_sr_1")
# Movie.create!(name:"Blade Runner3", genre:"sci-fi", description:"A blade runner must pursue and terminate four replicants who stole a ship in space, and have returned to Earth to find their creator.
# ",photo_url:"https://m.media-amazon.com/images/M/MV5BNzQzMzJhZTEtOWM4NS00MTdhLTg0YjgtMjM4MDRkZjUwZDBlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SY1000_CR0,0,671,1000_AL_.jpg",link_url:"https://www.imdb.com/title/tt0083658/?ref_=nv_sr_2?ref_=nv_sr_2")
Movie.create!(name:"Chasing Coral", genre:"documentary", description:"Coral reefs around the world are vanishing at an unprecedented rate. A team of divers, photographers and scientists set out on a thrilling ocean adventure to discover why and to reveal the underwater mystery to the world.
",photo_url:"https://m.media-amazon.com/images/M/MV5BOTkwMGM3MzgtOGVlMy00ZGY1LWEwNTYtM2E2NzhhYTAyYTVkL2ltYWdlXkEyXkFqcGdeQXVyMTE1NjQzNDI@._V1_SY1000_SX675_AL_.jpg",link_url:"https://www.imdb.com/title/tt6333054/?ref_=nv_sr_1?ref_=nv_sr_1")
Movie.create!(name:"Vegucated", genre:"documentary", description:"Vegucated is a guerrilla-style documentary that follows three meat- and cheese-loving New Yorkers who agree to adopt a vegan diet for six weeks and learn what it's all about.
",photo_url:"https://m.media-amazon.com/images/M/MV5BMjIxMDg4NTcxN15BMl5BanBnXkFtZTcwODQ3MTYwNw@@._V1_SY1000_CR0,0,682,1000_AL_.jpg",link_url:"https://www.imdb.com/title/tt1814930/?ref_=tt_sims_tti")



# Restaurant seeds
Restaurant.create!(name:"The Old Street Chinese", food_type:"chinese", photo_url:"https://www.thegrove.co.uk/wp-content/uploads/2019/05/The-Glasshouse-1-New.jpg", link_url:"https://deliveroo.co.uk/menu/london/old-street/the-old-street-chinese?day=today&postcode=E28DY&time=ASAP", address:"EC1V 9FR")
Restaurant.create!(name:"Suito Japanese", food_type:"sushi", photo_url:"http://suito.uk/wp-content/uploads/2014/07/Ichi_platters.jpg", link_url:"https://deliveroo.co.uk/menu/london/brick-lane/suito-japanese-platters?day=today&postcode=E28DY&time=ASAP", address:"E1 6RL")
Restaurant.create!(name:"Great British Fish & Chips", food_type:"fish&chips", photo_url:"https://www.thegrove.co.uk/wp-content/uploads/2019/05/The-Glasshouse-1-New.jpg", link_url:"https://deliveroo.co.uk/menu/london/tower-hill/great-british-fish-and-chips?day=today&postcode=E28DY&time=1100", address:"SE1 7PB")
# Restaurant.create!(name:"Nando's Dalston", food_type:"chicken", photo_url:"https://www.thegrove.co.uk/wp-content/uploads/2019/05/The-Glasshouse-1-New.jpg", link_url:"https://deliveroo.co.uk/menu/london/dalston/nandos-dalston?day=today&postcode=E28DY&time=1100", address:"E8 2NS")
# Restaurant.create!(name:"Turkish Delight", food_type:"shawarma", photo_url:"https://www.thegrove.co.uk/wp-content/uploads/2019/05/The-Glasshouse-1-New.jpg", link_url:"https://deliveroo.co.uk/menu/london/old-street/turkish-delight-london?day=today&postcode=E28DY&time=ASAP", address:"EC1V 9HE")


# Restaurant.create!(name:"The Old Street Chinese2", food_type:"chinese", photo_url:"https://www.thegrove.co.uk/wp-content/uploads/2019/05/The-Glasshouse-1-New.jpg", link_url:"https://deliveroo.co.uk/menu/london/old-street/the-old-street-chinese?day=today&postcode=E28DY&time=ASAP", address:"EC1V 9FR")
Restaurant.create!(name:"Miyako", food_type:"sushi", photo_url:"https://media-cdn.tripadvisor.com/media/photo-s/06/a6/8a/33/ginza-miyako-japanese.jpg", link_url:"https://deliveroo.co.uk/menu/london/liverpool-street/miyako?day=today&postcode=E28DY&time=ASAP", address:"EC2M 7QN")
# Restaurant.create!(name:"Great British Fish & Chips2", food_type:"fish&chips", photo_url:"https://www.thegrove.co.uk/wp-content/uploads/2019/05/The-Glasshouse-1-New.jpg", link_url:"https://deliveroo.co.uk/menu/london/tower-hill/great-british-fish-and-chips?day=today&postcode=E28DY&time=1100", address:"SE1 7PB")
# Restaurant.create!(name:"Nando's Dalston2", food_type:"chicken", photo_url:"https://www.thegrove.co.uk/wp-content/uploads/2019/05/The-Glasshouse-1-New.jpg", link_url:"https://deliveroo.co.uk/menu/london/dalston/nandos-dalston?day=today&postcode=E28DY&time=1100", address:"E8 2NS")
# Restaurant.create!(name:"Turkish Delight2", food_type:"shawarma", photo_url:"https://www.thegrove.co.uk/wp-content/uploads/2019/05/The-Glasshouse-1-New.jpg", link_url:"https://deliveroo.co.uk/menu/london/old-street/turkish-delight-london?day=today&postcode=E28DY&time=ASAP", address:"EC1V 9HE")


# Restaurant.create!(name:"The Old Street Chinese3", food_type:"chinese", photo_url:"https://www.thegrove.co.uk/wp-content/uploads/2019/05/The-Glasshouse-1-New.jpg", link_url:"https://deliveroo.co.uk/menu/london/old-street/the-old-street-chinese?day=today&postcode=E28DY&time=ASAP", address:"EC1V 9FR")
Restaurant.create!(name:"Island Poke", food_type:"sushi", photo_url:"https://images.squaremeal.co.uk/cloud/article/9176/images/vegan-watermelon-sashimi-in-island-poke-bowl_26062019012842.jpg?w=1000", link_url:"https://deliveroo.co.uk/menu/london/shoreditch/island-poke-shoreditch?day=today&postcode=E28DY&time=ASAP", address:"EC2A 3EP")
# Restaurant.create!(name:"Great British Fish & Chips3", food_type:"fish&chips", photo_url:"https://www.thegrove.co.uk/wp-content/uploads/2019/05/The-Glasshouse-1-New.jpg", link_url:"https://deliveroo.co.uk/menu/london/tower-hill/great-british-fish-and-chips?day=today&postcode=E28DY&time=1100", address:"SE1 7PB")
# Restaurant.create!(name:"Nando's Dalston3", food_type:"chicken", photo_url:"https://www.thegrove.co.uk/wp-content/uploads/2019/05/The-Glasshouse-1-New.jpg", link_url:"https://deliveroo.co.uk/menu/london/dalston/nandos-dalston?day=today&postcode=E28DY&time=1100", address:"E8 2NS")
# Restaurant.create!(name:"Turkish Delight3", food_type:"shawarma", photo_url:"https://www.thegrove.co.uk/wp-content/uploads/2019/05/The-Glasshouse-1-New.jpg", link_url:"https://deliveroo.co.uk/menu/london/old-street/turkish-delight-london?day=today&postcode=E28DY&time=ASAP", address:"EC1V 9HE")

Restaurant.create!(name:"Poke Zone", food_type:"sushi", photo_url:"https://f.roocdn.com/images/menus/94354/header-image.jpg?width=1200&height=630&auto=webp&format=jpg&fit=crop&v=1558581725", link_url:"https://deliveroo.co.uk/menu/london/whitechapel/sushizone-ltd-poke-zone-london?day=today&postcode=E28DY&time=ASAP", address:"E1 5BW")
Restaurant.create!(name:"Nobu", food_type:"sushi", photo_url:"https://noburestaurants.com/assets/Food-and-Beverage-Images/Fifty-Seven/24c2e7d152/Nobu-Fifty-Seven-Sunday-Lunch.jpg", link_url:"https://deliveroo.co.uk/menu/london/shoreditch/nobu-shoreditch?day=today&postcode=E28DY&time=ASAP", address:"EC2A 4BH")



# Combo seeds
Combo.create!(name:"Panda Express", description:"Panda Express description", movie: Movie.find_by_name("Kung Fu Panda"), restaurant: Restaurant.find_by_name("The Old Street Chinese"))
Combo.create!(name:"Fresh from the Sea", description:"Fresh from the Sea description", movie: Movie.find_by_name("Blackfish"), restaurant: Restaurant.find_by_name("Suito Japanese"))
Combo.create!(name:"Swimming with the Fish", description:"Swimming with the sea description", movie: Movie.find_by_name("Jaws"), restaurant: Restaurant.find_by_name("Great British Fish & Chips"))
# Combo.create!(name:"Angry Bird Combo", description:"Angry bird combo description", movie: Movie.find_by_name("The Angry Birds Movie"))
# Combo.create!(name:"Silence of Lamb Combo", description:"Silence of lamb description", movie: Movie.find_by_name("The Silence of Lambs"))


# Combo.create!(name:"Panda Express2", description:"Panda Express description", movie: Movie.find_by_name("Kung Fu Panda2"))
Combo.create!(name:"Screen to plate", description:"Screen to plate description", movie: Movie.find_by_name("Jiro Dreams of Sushi"), restaurant: Restaurant.find_by_name("Miyako"))
# Combo.create!(name:"Swimming with the Fish2", description:"Swimming with the sea description", movie: Movie.find_by_name("Jaws2"))
# Combo.create!(name:"Angry Bird Combo2", description:"Angry bird combo description", movie: Movie.find_by_name("The Angry Birds Movie2"))
# Combo.create!(name:"Silence of Lamb Combo2", description:"Silence of lamb description", movie: Movie.find_by_name("The Silence of Lambs2"))


# Combo.create!(name:"Panda Express3", description:"Panda Express description", movie: Movie.find_by_name("Kung Fu Panda3"))
Combo.create!(name:"Surf & Surf", description:"Surf & Surf description", movie: Movie.find_by_name("The Endless Summer"), restaurant: Restaurant.find_by_name("Island Poke"))
# Combo.create!(name:"Swimming with the Fish3", description:"Swimming with the sea description", movie: Movie.find_by_name("Jaws3"))
# Combo.create!(name:"Angry Bird Combo3", description:"Angry bird combo description", movie: Movie.find_by_name("The Angry Birds Movie3"))
# Combo.create!(name:"Silence of Lamb Combo3", description:"Silence of lamb description", movie: Movie.find_by_name("The Silence of Lambs3"))

Combo.create!(name:"Vegan Surf", description:"Vegan Surf description", movie: Movie.find_by_name("Vegucated"), restaurant: Restaurant.find_by_name("Poke Zone"))
Combo.create!(name:"Ocean Adventure", description:"Ocean Adventure description", movie: Movie.find_by_name("Chasing Coral"), restaurant: Restaurant.find_by_name("Nobu"))



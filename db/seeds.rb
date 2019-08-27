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


Movie.create!(name:"Kung Fu Panda", genre:"animation", description:"The Dragon Warrior has to clash against the savage Tai Lung as China's fate hangs in the balance. However, the Dragon Warrior mantle is supposedly mistaken to be bestowed upon an obese panda who is a novice in martial arts.
",photo_url:"https://m.media-amazon.com/images/M/MV5BODJkZTZhMWItMDI3Yy00ZWZlLTk4NjQtOTI1ZjU5NjBjZTVjXkEyXkFqcGdeQXVyODE5NzE3OTE@._V1_SY1000_CR0,0,689,1000_AL_.jpg",link_url:"https://www.imdb.com/title/tt0441773/?ref_=nv_sr_1?ref_=nv_sr_1")
Movie.create!(name:"Blackfish", genre:"documentary", description:"A documentary following the controversial captivity of killer whales, and its dangers for both humans and whales.
",photo_url:"https://m.media-amazon.com/images/M/MV5BNTkyNTkwMzkxMl5BMl5BanBnXkFtZTcwMzAwOTE2OQ@@._V1_SY1000_CR0,0,674,1000_AL_.jpg",link_url:"https://www.imdb.com/title/tt2545118/?ref_=nv_sr_1?ref_=nv_sr_1")
Movie.create!(name:"Jaws", genre:"adventure", description:"When a killer shark unleashes chaos on a beach community, it's up to a local sheriff, a marine biologist, and an old seafarer to hunt the beast down.
",photo_url:"https://m.media-amazon.com/images/M/MV5BMmVmODY1MzEtYTMwZC00MzNhLWFkNDMtZjAwM2EwODUxZTA5XkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_SX651_CR0,0,651,999_AL_.jpg",link_url:"https://www.imdb.com/title/tt0073195/?ref_=fn_al_tt_1")
Movie.create!(name:"The Angry Birds Movie", genre:"comedy", description:"Find out why the birds are so angry. When an island populated by happy, flightless birds is visited by mysterious green piggies, it's up to three unlikely outcasts - Red, Chuck and Bomb - to figure out what the pigs are up to.
",photo_url:"https://m.media-amazon.com/images/M/MV5BMTY3MjU0NDA0OF5BMl5BanBnXkFtZTgwNTc0MTU3OTE@._V1_SY1000_CR0,0,702,1000_AL_.jpg",link_url:"https://www.imdb.com/title/tt1985949/?ref_=fn_al_tt_4")
Movie.create!(name:"The Silence of Lambs", genre:"crime", description:"A young F.B.I. cadet must receive the help of an incarcerated and manipulative cannibal killer to help catch another serial killer, a madman who skins his victims.
",photo_url:"https://m.media-amazon.com/images/M/MV5BNjNhZTk0ZmEtNjJhMi00YzFlLWE1MmEtYzM1M2ZmMGMwMTU4XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SY1000_CR0,0,677,1000_AL_.jpg",link_url:"https://www.imdb.com/title/tt0102926/?ref_=nv_sr_1?ref_=nv_sr_1")
Movie.create!(name:"Blade Runner", genre:"sci-fi", description:"A blade runner must pursue and terminate four replicants who stole a ship in space, and have returned to Earth to find their creator.
",photo_url:"https://m.media-amazon.com/images/M/MV5BNzQzMzJhZTEtOWM4NS00MTdhLTg0YjgtMjM4MDRkZjUwZDBlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SY1000_CR0,0,671,1000_AL_.jpg",link_url:"https://www.imdb.com/title/tt0083658/?ref_=nv_sr_2?ref_=nv_sr_2")


Movie.create!(name:"Kung Fu Panda2", genre:"animation", description:"The Dragon Warrior has to clash against the savage Tai Lung as China's fate hangs in the balance. However, the Dragon Warrior mantle is supposedly mistaken to be bestowed upon an obese panda who is a novice in martial arts.
",photo_url:"https://m.media-amazon.com/images/M/MV5BODJkZTZhMWItMDI3Yy00ZWZlLTk4NjQtOTI1ZjU5NjBjZTVjXkEyXkFqcGdeQXVyODE5NzE3OTE@._V1_SY1000_CR0,0,689,1000_AL_.jpg",link_url:"https://www.imdb.com/title/tt0441773/?ref_=nv_sr_1?ref_=nv_sr_1")
Movie.create!(name:"Blackfish2", genre:"documentary", description:"A documentary following the controversial captivity of killer whales, and its dangers for both humans and whales.
",photo_url:"https://m.media-amazon.com/images/M/MV5BNTkyNTkwMzkxMl5BMl5BanBnXkFtZTcwMzAwOTE2OQ@@._V1_SY1000_CR0,0,674,1000_AL_.jpg",link_url:"https://www.imdb.com/title/tt2545118/?ref_=nv_sr_1?ref_=nv_sr_1")
Movie.create!(name:"Jaws2", genre:"adventure", description:"When a killer shark unleashes chaos on a beach community, it's up to a local sheriff, a marine biologist, and an old seafarer to hunt the beast down.
",photo_url:"https://m.media-amazon.com/images/M/MV5BMmVmODY1MzEtYTMwZC00MzNhLWFkNDMtZjAwM2EwODUxZTA5XkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_SX651_CR0,0,651,999_AL_.jpg",link_url:"https://www.imdb.com/title/tt0073195/?ref_=fn_al_tt_1")
Movie.create!(name:"The Angry Birds Movie2", genre:"comedy", description:"Find out why the birds are so angry. When an island populated by happy, flightless birds is visited by mysterious green piggies, it's up to three unlikely outcasts - Red, Chuck and Bomb - to figure out what the pigs are up to.
",photo_url:"https://m.media-amazon.com/images/M/MV5BMTY3MjU0NDA0OF5BMl5BanBnXkFtZTgwNTc0MTU3OTE@._V1_SY1000_CR0,0,702,1000_AL_.jpg",link_url:"https://www.imdb.com/title/tt1985949/?ref_=fn_al_tt_4")
Movie.create!(name:"The Silence of Lambs2", genre:"crime", description:"A young F.B.I. cadet must receive the help of an incarcerated and manipulative cannibal killer to help catch another serial killer, a madman who skins his victims.
",photo_url:"https://m.media-amazon.com/images/M/MV5BNjNhZTk0ZmEtNjJhMi00YzFlLWE1MmEtYzM1M2ZmMGMwMTU4XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SY1000_CR0,0,677,1000_AL_.jpg",link_url:"https://www.imdb.com/title/tt0102926/?ref_=nv_sr_1?ref_=nv_sr_1")
Movie.create!(name:"Blade Runner2", genre:"sci-fi", description:"A blade runner must pursue and terminate four replicants who stole a ship in space, and have returned to Earth to find their creator.
",photo_url:"https://m.media-amazon.com/images/M/MV5BNzQzMzJhZTEtOWM4NS00MTdhLTg0YjgtMjM4MDRkZjUwZDBlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SY1000_CR0,0,671,1000_AL_.jpg",link_url:"https://www.imdb.com/title/tt0083658/?ref_=nv_sr_2?ref_=nv_sr_2")


Movie.create!(name:"Kung Fu Panda3", genre:"animation", description:"The Dragon Warrior has to clash against the savage Tai Lung as China's fate hangs in the balance. However, the Dragon Warrior mantle is supposedly mistaken to be bestowed upon an obese panda who is a novice in martial arts.
",photo_url:"https://m.media-amazon.com/images/M/MV5BODJkZTZhMWItMDI3Yy00ZWZlLTk4NjQtOTI1ZjU5NjBjZTVjXkEyXkFqcGdeQXVyODE5NzE3OTE@._V1_SY1000_CR0,0,689,1000_AL_.jpg",link_url:"https://www.imdb.com/title/tt0441773/?ref_=nv_sr_1?ref_=nv_sr_1")
Movie.create!(name:"Blackfish3", genre:"documentary", description:"A documentary following the controversial captivity of killer whales, and its dangers for both humans and whales.
",photo_url:"https://m.media-amazon.com/images/M/MV5BNTkyNTkwMzkxMl5BMl5BanBnXkFtZTcwMzAwOTE2OQ@@._V1_SY1000_CR0,0,674,1000_AL_.jpg",link_url:"https://www.imdb.com/title/tt2545118/?ref_=nv_sr_1?ref_=nv_sr_1")
Movie.create!(name:"Jaws3", genre:"adventure", description:"When a killer shark unleashes chaos on a beach community, it's up to a local sheriff, a marine biologist, and an old seafarer to hunt the beast down.
",photo_url:"https://m.media-amazon.com/images/M/MV5BMmVmODY1MzEtYTMwZC00MzNhLWFkNDMtZjAwM2EwODUxZTA5XkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_SX651_CR0,0,651,999_AL_.jpg",link_url:"https://www.imdb.com/title/tt0073195/?ref_=fn_al_tt_1")
Movie.create!(name:"The Angry Birds Movie3", genre:"comedy", description:"Find out why the birds are so angry. When an island populated by happy, flightless birds is visited by mysterious green piggies, it's up to three unlikely outcasts - Red, Chuck and Bomb - to figure out what the pigs are up to.
",photo_url:"https://m.media-amazon.com/images/M/MV5BMTY3MjU0NDA0OF5BMl5BanBnXkFtZTgwNTc0MTU3OTE@._V1_SY1000_CR0,0,702,1000_AL_.jpg",link_url:"https://www.imdb.com/title/tt1985949/?ref_=fn_al_tt_4")
Movie.create!(name:"The Silence of Lambs3", genre:"crime", description:"A young F.B.I. cadet must receive the help of an incarcerated and manipulative cannibal killer to help catch another serial killer, a madman who skins his victims.
",photo_url:"https://m.media-amazon.com/images/M/MV5BNjNhZTk0ZmEtNjJhMi00YzFlLWE1MmEtYzM1M2ZmMGMwMTU4XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SY1000_CR0,0,677,1000_AL_.jpg",link_url:"https://www.imdb.com/title/tt0102926/?ref_=nv_sr_1?ref_=nv_sr_1")
Movie.create!(name:"Blade Runner3", genre:"sci-fi", description:"A blade runner must pursue and terminate four replicants who stole a ship in space, and have returned to Earth to find their creator.
",photo_url:"https://m.media-amazon.com/images/M/MV5BNzQzMzJhZTEtOWM4NS00MTdhLTg0YjgtMjM4MDRkZjUwZDBlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SY1000_CR0,0,671,1000_AL_.jpg",link_url:"https://www.imdb.com/title/tt0083658/?ref_=nv_sr_2?ref_=nv_sr_2")


Restaurant.create!(name:"The Old Street Chinese", food_type:"chinese", photo_url:"https://www.thegrove.co.uk/wp-content/uploads/2019/05/The-Glasshouse-1-New.jpg", link_url:"https://deliveroo.co.uk/menu/london/old-street/the-old-street-chinese?day=today&postcode=E28DY&time=ASAP", address:"EC1V 9FR")
Restaurant.create!(name:"Suito Japanese", food_type:"sushi", photo_url:"https://www.thegrove.co.uk/wp-content/uploads/2019/05/The-Glasshouse-1-New.jpg", link_url:"https://deliveroo.co.uk/menu/london/brick-lane/suito-japanese-platters?day=today&postcode=E28DY&time=ASAP", address:"E1 6RL")
Restaurant.create!(name:"Great British Fish & Chips", food_type:"fish&chips", photo_url:"https://www.thegrove.co.uk/wp-content/uploads/2019/05/The-Glasshouse-1-New.jpg", link_url:"https://deliveroo.co.uk/menu/london/tower-hill/great-british-fish-and-chips?day=today&postcode=E28DY&time=1100", address:"SE1 7PB")
Restaurant.create!(name:"Nando's Dalston", food_type:"chicken", photo_url:"https://www.thegrove.co.uk/wp-content/uploads/2019/05/The-Glasshouse-1-New.jpg", link_url:"https://deliveroo.co.uk/menu/london/dalston/nandos-dalston?day=today&postcode=E28DY&time=1100", address:"E8 2NS")
Restaurant.create!(name:"Turkish Delight", food_type:"shawarma", photo_url:"https://www.thegrove.co.uk/wp-content/uploads/2019/05/The-Glasshouse-1-New.jpg", link_url:"https://deliveroo.co.uk/menu/london/old-street/turkish-delight-london?day=today&postcode=E28DY&time=ASAP", address:"EC1V 9HE")


Restaurant.create!(name:"The Old Street Chinese2", food_type:"chinese", photo_url:"https://www.thegrove.co.uk/wp-content/uploads/2019/05/The-Glasshouse-1-New.jpg", link_url:"https://deliveroo.co.uk/menu/london/old-street/the-old-street-chinese?day=today&postcode=E28DY&time=ASAP", address:"EC1V 9FR")
Restaurant.create!(name:"Suito Japanese2", food_type:"sushi", photo_url:"https://www.thegrove.co.uk/wp-content/uploads/2019/05/The-Glasshouse-1-New.jpg", link_url:"https://deliveroo.co.uk/menu/london/brick-lane/suito-japanese-platters?day=today&postcode=E28DY&time=ASAP", address:"E1 6RL")
Restaurant.create!(name:"Great British Fish & Chips2", food_type:"Fish&Chips", photo_url:"https://www.thegrove.co.uk/wp-content/uploads/2019/05/The-Glasshouse-1-New.jpg", link_url:"https://deliveroo.co.uk/menu/london/tower-hill/great-british-fish-and-chips?day=today&postcode=E28DY&time=1100", address:"SE1 7PB")
Restaurant.create!(name:"Nando's Dalston2", food_type:"chicken", photo_url:"https://www.thegrove.co.uk/wp-content/uploads/2019/05/The-Glasshouse-1-New.jpg", link_url:"https://deliveroo.co.uk/menu/london/dalston/nandos-dalston?day=today&postcode=E28DY&time=1100", address:"E8 2NS")
Restaurant.create!(name:"Turkish Delight2", food_type:"shawarma", photo_url:"https://www.thegrove.co.uk/wp-content/uploads/2019/05/The-Glasshouse-1-New.jpg", link_url:"https://deliveroo.co.uk/menu/london/old-street/turkish-delight-london?day=today&postcode=E28DY&time=ASAP", address:"EC1V 9HE")


Restaurant.create!(name:"The Old Street Chinese3", food_type:"chinese", photo_url:"https://www.thegrove.co.uk/wp-content/uploads/2019/05/The-Glasshouse-1-New.jpg", link_url:"https://deliveroo.co.uk/menu/london/old-street/the-old-street-chinese?day=today&postcode=E28DY&time=ASAP", address:"EC1V 9FR")
Restaurant.create!(name:"Suito Japanese3", food_type:"sushi", photo_url:"https://www.thegrove.co.uk/wp-content/uploads/2019/05/The-Glasshouse-1-New.jpg", link_url:"https://deliveroo.co.uk/menu/london/brick-lane/suito-japanese-platters?day=today&postcode=E28DY&time=ASAP", address:"E1 6RL")
Restaurant.create!(name:"Great British Fish & Chips3", food_type:"fish&chips", photo_url:"https://www.thegrove.co.uk/wp-content/uploads/2019/05/The-Glasshouse-1-New.jpg", link_url:"https://deliveroo.co.uk/menu/london/tower-hill/great-british-fish-and-chips?day=today&postcode=E28DY&time=1100", address:"SE1 7PB")
Restaurant.create!(name:"Nando's Dalston3", food_type:"chicken", photo_url:"https://www.thegrove.co.uk/wp-content/uploads/2019/05/The-Glasshouse-1-New.jpg", link_url:"https://deliveroo.co.uk/menu/london/dalston/nandos-dalston?day=today&postcode=E28DY&time=1100", address:"E8 2NS")
Restaurant.create!(name:"Turkish Delight3", food_type:"shawarma", photo_url:"https://www.thegrove.co.uk/wp-content/uploads/2019/05/The-Glasshouse-1-New.jpg", link_url:"https://deliveroo.co.uk/menu/london/old-street/turkish-delight-london?day=today&postcode=E28DY&time=ASAP", address:"EC1V 9HE")



Combo.create!(name:"Panda Express", description:"Panda Express description",food_type:"chinese", movie: Movie.find_by_name("Kung Fu Panda"))
Combo.create!(name:"Fresh from the Sea", description:"Fresh from the Sea description",food_type:"sushi", movie: Movie.find_by_name("Blackfish"))
Combo.create!(name:"Swimming with the Fish", description:"Swimming with the sea description",food_type:"fish&chips", movie: Movie.find_by_name("Jaws"))
Combo.create!(name:"Angry Bird Combo", description:"Angry bird combo description",food_type:"chicken", movie: Movie.find_by_name("The Angry Birds Movie"))
Combo.create!(name:"Silence of Lamb Combo", description:"Silence of lamb description",food_type:"shawarma", movie: Movie.find_by_name("The Silence of Lambs"))


Combo.create!(name:"Panda Express2", description:"Panda Express description",food_type:"chinese", movie: Movie.find_by_name("Kung Fu Panda2"))
Combo.create!(name:"Fresh from the Sea2", description:"Fresh from the Sea description",food_type:"sushi", movie: Movie.find_by_name("Blackfish2"))
Combo.create!(name:"Swimming with the Fish2", description:"Swimming with the sea description",food_type:"fish&chips", movie: Movie.find_by_name("Jaws2"))
Combo.create!(name:"Angry Bird Combo2", description:"Angry bird combo description",food_type:"chicken", movie: Movie.find_by_name("The Angry Birds Movie2"))
Combo.create!(name:"Silence of Lamb Combo2", description:"Silence of lamb description",food_type:"shawarma", movie: Movie.find_by_name("The Silence of Lambs2"))


Combo.create!(name:"Panda Express3", description:"Panda Express description",food_type:"chinese", movie: Movie.find_by_name("Kung Fu Panda3"))
Combo.create!(name:"Fresh from the Sea3", description:"Fresh from the Sea description",food_type:"sushi", movie: Movie.find_by_name("Blackfish3"))
Combo.create!(name:"Swimming with the Fish3", description:"Swimming with the sea description",food_type:"fish&chips", movie: Movie.find_by_name("Jaws3"))
Combo.create!(name:"Angry Bird Combo3", description:"Angry bird combo description",food_type:"chicken", movie: Movie.find_by_name("The Angry Birds Movie3"))
Combo.create!(name:"Silence of Lamb Combo3", description:"Silence of lamb description",food_type:"shawarma", movie: Movie.find_by_name("The Silence of Lambs3"))



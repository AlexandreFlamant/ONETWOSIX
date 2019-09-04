require 'uri'
require 'net/http'
require 'openssl'
require 'json'

Genre.destroy_all
FoodType.destroy_all
Movie.destroy_all
Restaurant.destroy_all
Combo.destroy_all

Genre.create!(name: "documentary", photo_url: "https://www.adorama.com/alc/wp-content/uploads/2018/02/shutterstock_663360523-1024x483.jpg")
Genre.create!(name: "family", photo_url: "https://vignette2.wikia.nocookie.net/disney/images/2/23/Zootopia_Hopps_Family_photo.png/revision/latest?cb=20160315132551")
Genre.create!(name: "sci-fi", photo_url: "https://i.imgur.com/U48eJ32.jpg")
Genre.create!(name: "romance", photo_url: "https://img.buzzfeed.com/buzzfeed-static/static/2018-03/25/2/asset/buzzfeed-prod-web-09/sub-buzz-3893-1521958649-5.png?downsize=700:*&output-format=auto&output-quality=auto")
Genre.create!(name: "cult", photo_url: "https://www.telegraph.co.uk/content/dam/films/2018/11/25/TELEMMGLPICT000181712910_trans_NvBQzQNjv4BqmKdRvr-WZ3BJn63Zqr5tJBCJnlk6Z3A1gx69YFOTwrk.jpeg?imwidth=450")

# https://unogs-unogs-v1.p.rapidapi.com/aaapi.cgi?q={query}-!{syear},{eyear}-!{snfrate},{enfrate}-!{simdbrate},{eimdbrate}-!{genreid}-!{vtype}-!{audio}-!{subtitle}-!{imdbvotes}&t=ns&cl={clist}&st=adv&ob={sortby}&p={page}&sa={andor}
#                                                  new(days) start year, end year, rating (netflix, 0-5), imdb rating (0-10), genre, movie/series, lang, lang, how many imdb votes, country ID, sort-by (relavance/rating), how many, subtitile and language exclusive?

# TO GET NETFLIX GENRE ID'S TO USE FOR SEARCH
genre = URI("https://unogs-unogs-v1.p.rapidapi.com/api.cgi?t=genres")

http = Net::HTTP.new(genre.host, genre.port)
http.use_ssl = true
http.verify_mode = OpenSSL::SSL::VERIFY_NONE

request = Net::HTTP::Get.new(genre)
request["x-rapidapi-host"] = 'unogs-unogs-v1.p.rapidapi.com'
request["x-rapidapi-key"] = 'c4b46c86c3msh3a9ef6c601b14a6p140610jsnb585dd1486dc'
response = http.request(request)
parsed = JSON.parse(response.read_body)


kids_family_genre = parsed["ITEMS"][2]["All Childrens"]
sci_fi_genre = parsed["ITEMS"][16]["All Sci-Fi"]
cult_genre = parsed["ITEMS"][5]["All Cult"]
documentary_genre = parsed["ITEMS"][6]["All Documentaries"]
romance_genre = parsed["ITEMS"][15]["All Romance"]

genres = [kids_family_genre, sci_fi_genre, cult_genre, documentary_genre, romance_genre]

# SEARCH FOR MOVIES WITH INFO:
# (IMDB RATING 7-10, year 1900-2019, netflix rating 0-5, genreID, movie, language(spoken & subtitle), countryID(uk = 46))
movies = []

genres.each do |genre|
  url = URI("https://unogs-unogs-v1.p.rapidapi.com/aaapi.cgi?q=get%3Anew5000-!1900%2C2019-!0%2C5-!7%2C10-!#{genre.join(",")}-!movie-!Any-!Any-!gt100-!%7Bdownloadable%7D&t=ns&cl=46&st=adv&ob=Relevance&p=1&sa=and")

  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE

  request = Net::HTTP::Get.new(url)
  request["x-rapidapi-host"] = 'unogs-unogs-v1.p.rapidapi.com'
  request["x-rapidapi-key"] = 'c4b46c86c3msh3a9ef6c601b14a6p140610jsnb585dd1486dc'

  response = http.request(request)
  parsed = JSON.parse(response.read_body)
  movies << parsed
end

kids_family_genre = movies[0]["ITEMS"]
sci_fi_genre = movies[1]["ITEMS"]
cult_genre = movies[2]["ITEMS"]
documentary_genre = movies[3]["ITEMS"]
romance_genre = movies[4]["ITEMS"]
movie_genres = {
  "family" => kids_family_genre,
  "sci-fi" => sci_fi_genre,
  "cult" => cult_genre,
  "documentary" => documentary_genre,
  "romance" => romance_genre
}

# p movie_genres["family"].first

movie_genres.each do |genre, films|
  films.each do |item|
    Movie.create(name: item["title"], genre: Genre.find_by_name(genre), description: "#{item["synopsis"]}", photo_url: "#{item["image"]}", link_url: "https://www.netflix.com/title/#{item["netflixid"]}")
  end
end


#FoodType seeds
FoodType.create!(name: "burgers", photo_url: "https://www.traegergrills.com/images/en-us/Shared/images/recipes/banners/Beef/Peanut-Butter-Burger_Traeger-Wood-Fired-Grills_RE_HE_M.jpg")
FoodType.create!(name: "italian", photo_url: "https://serafinamia.com/wp-content/uploads/2018/09/10-Italian-Fun-Facts-The-Food-Fashion-and-Culture-of-Italy.jpg")
FoodType.create!(name: "salad", photo_url: "https://www.bbcgoodfood.com/sites/default/files/editor_files/2017/10/healthy-meal-prep-ideas-meal-prep-pasta-700-350.jpg")
FoodType.create!(name: "vietnamese", photo_url: "https://duyt4h9nfnj50.cloudfront.net/resized/1543931229557-w2880-41.jpg")
FoodType.create!(name: "sushi", photo_url: "https://d22ir9aoo7cbf6.cloudfront.net/wp-content/uploads/sites/2/2017/04/standing-sushi-bar-singapore-header.jpg")

#FoodType Images
images_hash = {
  burgers: ["https://campaignforkids.com/wp-content/uploads/2019/02/UnionsStreet.jpeg", "https://www.thepkpway.com/wp-content/uploads/2016/06/alaskan-pollock-burger-pineapple-jalapeno-slaw-6a.jpg", "https://img-aws.ehowcdn.com/700x/cdn.onlyinyourstate.com/wp-content/uploads/2018/07/33808810_2115675235129629_44295518142070784_n-700x933.jpg", "https://cdn1.clickthecity.com/images/establishment/common/raw/8296.jpg", "https://cms.hostelworld.com/hwblog/wp-content/uploads/sites/2/2017/10/vegan-restaurants-paris-@parisbyvegan-Hank-burger-701x875.jpg"],
  italian: ["https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-190606-flatbread-pizza-432-portrait-pf-1560544301.jpg?crop=0.9997369113391213xw:1xh;center,top&resize=480:*", "https://www.italianbreaks.com/wp-content/uploads/2017/12/27-reasons-Italian-food-is-the-worst-italian-brunch-546x682.jpg", "https://static.wixstatic.com/media/e610d1_eb548ee62cb34fa2af8d3bb8fbc3c01e~mv2_d_3000_1946_s_2.jpg/v1/fill/w_640,h_910,al_c,q_85,usm_0.66_1.00_0.01/e610d1_eb548ee62cb34fa2af8d3bb8fbc3c01e~mv2_d_3000_1946_s_2.webp", "https://marisasitaliankitchen.com/wp-content/uploads/2019/08/Kale-Pesto-with-Spaghetti-6-of-6-1-680x900.jpg", "https://www.limewoodhotel.co.uk/media/1305/cookery-class-classics2.jpg?mode=crop&quality=70&width=1120&height=2080&format=jpg]"],
  salad: ["https://tatyanaseverydayfood.com/wp-content/uploads/2016/02/Garlic-Chicken-Salad.jpg", "https://www.spendwithpennies.com/wp-content/uploads/2018/07/healthy-kale-brocoli-salad-lemon-dressing-recipe-.jpg", "https://sugarandcharm.com/wp-content/uploads/2019/02/easiest-salad-ever-2.jpg", "https://www.littlebroken.com/wp-content/uploads/2019/07/Tomato-Mozzarella-Salad-with-Balsamic-Reduction-13.jpg", "https://www.foodfaithfitness.com/wp-content/uploads/2018/06/three-bean-mexican-corn-black-bean-salad-picture.jpg"],
  sushi: ["https://simple-veganista.com/wp-content/uploads/2012/07/raw-vegan-sushi-rolls-5.jpg", "https://images.squarespace-cdn.com/content/v1/58ae5064d482e9529405676a/1549201753059-1Q5FOR0ZUDTWJO3PM9YW/ke17ZwdGBToddI8pDm48kO4Ymik7jCTU-OigDuhUoP17gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z5QPOohDIaIeljMHgDF5CVlOqpeNLcJ80NK65_fV7S1UbjWf3F0osKH369u33AEJniJgEHb_R28Um2LA17-lActY7x6kDsGDMYkQIOJRDvK5g/Whole30+sushi+burritos+are+the+perfect+thing+to+get+your+through+that+sushi+craving+whether+you+are+following+a+whole30%2C+paleo+or+low+carb+diet.+You+can+easily+make+one+of+these+delicious+and+simple+Whole30+Sushi+Burritos+at+home", "https://www.happyfoodstube.com/wp-content/uploads/2016/03/homemade-sushi-picture.jpg", "https://www.julieslifestyle.com/src/Frontend/Files/blog/images/source/mushroom-avocado-sushi-rolls-vegan-gluten-free-inspiration-anett-velsberg-en-662.jpg", "https://lifemadesweeter.com/wp-content/uploads/Calfornia-Roll-Bowl-Recipe-Picture-photo-two-bowls-picture-recipe.jpg"],
  vietnamese: ["https://www.watchwhatueat.com/wp-content/uploads/2016/06/Healthy-Spring-Rolls-1.jpg", "https://www.readingchronicle.co.uk/resources/images/6666082.jpg?display=1&htype=0&type=responsive-gallery", "https://www.roadiscalling.com/wp-content/uploads/2018/04/60A62182-0331-4067-B2DF-9C4316B5128E.jpg", "https://www.willflyforfood.net/wp-content/uploads/2017/08/banh-mi-hoa-ma2.jpg", "https://static.wixstatic.com/media/68e7a4_e8964124c5334a31a570bf95b3c47dec~mv2.jpg/v1/fill/w_284,h_354,al_c,q_80,usm_0.66_1.00_0.01/68e7a4_e8964124c5334a31a570bf95b3c47dec~mv2.jpg"]
}


# # Restaurant seeds
# Restaurant.create!(name: "Suito Japanese", food_type: FoodType.find_by_name("sushi"), photo_url:"https://resizer.otstatic.com/v2/photos/large/25630082.jpg", link_url:"https://deliveroo.co.uk/menu/london/brick-lane/suito-japanese-platters?day=today&postcode=E28DY&time=ASAP", address:"E1 6RL")
# Restaurant.create!(name: "Miyako", food_type: FoodType.find_by_name("sushi"), photo_url:"https://media-cdn.tripadvisor.com/media/photo-s/06/a6/8a/33/ginza-miyako-japanese.jpg", link_url:"https://deliveroo.co.uk/menu/london/liverpool-street/miyako?day=today&postcode=E28DY&time=ASAP", address:"EC2M 7QN")
# Restaurant.create!(name: "Island Poke", food_type: FoodType.find_by_name("sushi"), photo_url:"https://images.squaremeal.co.uk/cloud/article/9176/images/vegan-watermelon-sashimi-in-island-poke-bowl_26062019012842.jpg?w=1000", link_url:"https://deliveroo.co.uk/menu/london/shoreditch/island-poke-shoreditch?day=today&postcode=E28DY&time=ASAP", address:"EC2A 3EP")
# Restaurant.create!(name: "Poke Zone", food_type: FoodType.find_by_name("sushi"), photo_url:"https://f.roocdn.com/images/menus/94354/header-image.jpg?width=1200&height=630&auto=webp&format=jpg&fit=crop&v=1558581725", link_url:"https://deliveroo.co.uk/menu/london/whitechapel/sushizone-ltd-poke-zone-london?day=today&postcode=E28DY&time=ASAP", address:"E1 5BW")
# Restaurant.create!(name: "Nobu", food_type: FoodType.find_by_name("sushi"), photo_url:"https://noburestaurants.com/assets/Food-and-Beverage-Images/Fifty-Seven/24c2e7d152/Nobu-Fifty-Seven-Sunday-Lunch.jpg", link_url:"https://deliveroo.co.uk/menu/london/shoreditch/nobu-shoreditch?day=today&postcode=E28DY&time=ASAP", address:"EC2A 4BH")
# Restaurant.create!(name: "The Japanese Canteen", food_type: FoodType.find_by_name("sushi"), photo_url: "https://f.roocdn.com/images/menus/113814/header-image.jpg?width=1382&amp;height=320&amp;auto=webp&amp;format=jpg&amp;fit=crop&amp;v=1550753361&quot;", link_url: "https://deliveroo.co.uk/menu/london/spitalfields/the-japanese-canteen-middlesex-street?day=today&postcode=E28DY&time=ASAP", address: "E17EZ")
# Restaurant.create!(name: "Gourmet Sushi", food_type: FoodType.find_by_name("sushi"), photo_url: "https://f.roocdn.com/images/menus/149864/header-image.jpg?width=740&height=320&auto=webp&format=jpg&fit=crop&v=1558361162", link_url: "https://deliveroo.co.uk/menu/london/brick-lane/gourmet-sushi?day=today&postcode=E28DY&time=ASAP", address: "E16PX")
# Restaurant.create!(name: "Japanika", food_type: FoodType.find_by_name("sushi"), photo_url: "https://f.roocdn.com/images/menus/51477/header-image.jpg?width=740&height=320&auto=webp&format=jpg&fit=crop&v=1513955042", link_url: "https://deliveroo.co.uk/menu/london/brick-lane/japanika?day=today&postcode=E28DY&time=ASAP", address: "E16QR")
# Restaurant.create!(name: "Itsu", food_type: FoodType.find_by_name("sushi"), photo_url: "https://f.roocdn.com/images/menus/100760/header-image.jpg?width=740&height=320&auto=webp&format=jpg&fit=crop&v=1559730881", link_url: "https://deliveroo.co.uk/menu/london/the-city/itsu-copthall-ave?day=today&postcode=E28DY&time=ASAP", address: "EC2R7BH")
# Restaurant.create!(name: "EATKatsu", food_type: FoodType.find_by_name("sushi"), photo_url: "https://f.roocdn.com/images/menus/138386/header-image.jpg?width=740&height=320&auto=webp&format=jpg&fit=crop&v=1557227226", link_url: "https://deliveroo.co.uk/menu/london/bethnal-green/eatkatsu?day=today&postcode=E28DY&time=ASAP", address: "E29RF")




# "https://deliveroo.co.uk/menu/london/the-city/shake-shack-mansion-house?day=today&postcode=E28DY&time=ASAP",
# "https://deliveroo.co.uk/menu/london/brick-lane/pepes-brick-lane?day=today&postcode=E28DY&time=ASAP",
# "https://deliveroo.co.uk/menu/london/islington/bird-islington?day=today&postcode=E28DY&time=ASAP",
# "https://deliveroo.co.uk/menu/london/dalston/arancini-brothers-dalston?day=today&postcode=E28DY&time=ASAP",
# "https://deliveroo.co.uk/menu/london/aldgate/10566-burger-king-whitechapel?day=today&postcode=E28DY&time=ASAP",
# "https://deliveroo.co.uk/menu/london/brick-lane/wicked-burgers?day=today&postcode=E28DY&time=ASAP",
# "https://deliveroo.co.uk/menu/london/angel/byron-islington?day=today&postcode=E28DY&time=ASAP",
# "https://deliveroo.co.uk/menu/london/bank/bleecker-bloomberg?day=today&postcode=E28DY&time=ASAP",
# "https://deliveroo.co.uk/menu/london/shoreditch/the-vurger-co?day=today&postcode=E28DY&time=ASAP",
# "https://deliveroo.co.uk/menu/london/brick-lane/wicked-wings-co?day=today&postcode=E28DY&time=ASAP",
# "https://deliveroo.co.uk/menu/london/upper-street/five-guys-islington?day=today&postcode=E28DY&time=ASAP",
# "https://deliveroo.co.uk/menu/london/dalston/beer-and-burger-dalston?day=today&postcode=E28DY&time=ASAP",
# "https://deliveroo.co.uk/menu/london/spitalfields/gourmet-burger-kitchen-spitalfields?day=today&postcode=E28DY&time=ASAP",
# "https://deliveroo.co.uk/menu/london/bethnal-green/gym-food?day=today&postcode=E28DY&time=ASAP",
# "https://deliveroo.co.uk/menu/london/hackney/patty-and-bun-london-fields?day=today&postcode=E28DY&time=ASAP",
# "https://deliveroo.co.uk/menu/london/spitalfields/leon-spitalfields?day=today&postcode=E28DY&time=ASAP",
# "https://deliveroo.co.uk/menu/london/brick-lane/wraps-and-wings-bethnal-green?day=today&postcode=E28DY&time=ASAP",
# "https://deliveroo.co.uk/menu/london/shoreditch/butchies-camden?day=today&postcode=E28DY&time=ASAP",
# "https://deliveroo.co.uk/menu/london/old-street/best-mangal-bar-and-kitchen?day=today&postcode=E28DY&time=ASAP",
# "https://deliveroo.co.uk/menu/london/old-street/honest-burger-old-street?day=today&postcode=E28DY&time=ASAP",
# "https://deliveroo.co.uk/menu/london/spitalfields/bleecker-st-burger?day=today&postcode=E28DY&time=ASAP",
# "https://deliveroo.co.uk/menu/london/dalston/cafe-route?day=today&postcode=E28DY&time=ASAP",
# "https://deliveroo.co.uk/menu/london/shoreditch/coqfighter-shoreditch?day=today&postcode=E28DY&time=ASAP",
# "https://deliveroo.co.uk/menu/london/bethnal-green/king-of-wings-bethnal-green?day=today&postcode=E28DY&time=ASAP",
# "https://deliveroo.co.uk/menu/london/shoreditch/the-diner-shoreditch?day=today&postcode=E28DY&time=ASAP",
# "https://deliveroo.co.uk/menu/london/old-street/the-posh-burger-co?day=today&postcode=E28DY&time=ASAP",




# # Combo seeds
# Combo.create!(name:"Screen to plate", description: "Revered sushi chef Jiro Ono strives for perfection in his work, while his eldest son, Yoshikazu, has trouble living up to his father's legacy.
# ", movie: Movie.find_by_name("Jiro Dreams of Sushi"), restaurant: Restaurant.find_by_name("Miyako"))
# Combo.create!(name:"Surf & Surf", description: "After years of nightmares, depression, and seizures, Iraq war veteran Bobby Lane could see no way out of his trauma other than suicide. Then he met Van Curaza, a former big wave surfer who since founded Operation Surf and dedicated his life to helping veterans find solace in surfing.
#  ", movie: Movie.find_by_name("Resurface"), restaurant: Restaurant.find_by_name("Island Poke"))
# Combo.create!(name:"Vegan Surf", description: "Follow the shocking, yet humorous, journey of an aspiring environmentalist, as he daringly seeks to find the real solution to the most pressing environmental issues and true path to sustainability.",
# movie: Movie.find_by_name("Cowspiracy"), restaurant: Restaurant.find_by_name("Poke Zone"))
# Combo.create!(name:"Ocean Adventure", description: "Coral reefs around the world are vanishing at an unprecedented rate. A team of divers, photographers and scientists set out on a thrilling ocean adventure to discover why and to reveal the underwater mystery to the world.",
# movie: Movie.find_by_name("Chasing Coral"), restaurant: Restaurant.find_by_name("Nobu"))
# Combo.create!(name:"Fresh from the Sea", description: "A documentary following the controversial captivity of killer whales, and its dangers for both humans and whales.",
# movie: Movie.find_by_name("Blackfish"), restaurant: Restaurant.find_by_name("Suito Japanese"))
# Combo.create!(name: "Overpromised and underdelivered", description: "The history of the Fyre Music Festival, from its creation through its unraveling.",
# movie: Movie.find_by_name("Fyre"), restaurant: Restaurant.find_by_name("Itsu"))

# Combo seeds
# Combo.create!(name:"Screen to plate", description: "Revered sushi chef Jiro Ono strives for perfection in his work, while his eldest son, Yoshikazu, has trouble living up to his father's legacy.
# ", movie: Movie.find_by_name("Jiro Dreams of Sushi"), restaurant: Restaurant.find_by_name("Miyako"))
# Combo.create!(name:"Surf & Surf", description: "After years of nightmares, depression, and seizures, Iraq war veteran Bobby Lane could see no way out of his trauma other than suicide. Then he met Van Curaza, a former big wave surfer who since founded Operation Surf and dedicated his life to helping veterans find solace in surfing.
#  ", movie: Movie.find_by_name("Resurface"), restaurant: Restaurant.find_by_name("Island Poke"))
# Combo.create!(name:"Vegan Surf", description: "Follow the shocking, yet humorous, journey of an aspiring environmentalist, as he daringly seeks to find the real solution to the most pressing environmental issues and true path to sustainability.",
# movie: Movie.find_by_name("Cowspiracy"), restaurant: Restaurant.find_by_name("Poke Zone"))
# Combo.create!(name:"Ocean Adventure", description: "Coral reefs around the world are vanishing at an unprecedented rate. A team of divers, photographers and scientists set out on a thrilling ocean adventure to discover why and to reveal the underwater mystery to the world.",
# movie: Movie.find_by_name("Chasing Coral"), restaurant: Restaurant.find_by_name("Nobu"))
# Combo.create!(name:"Fresh from the Sea", description: "A documentary following the controversial captivity of killer whales, and its dangers for both humans and whales.",
# movie: Movie.find_by_name("Blackfish"), restaurant: Restaurant.find_by_name("Suito Japanese"))
# Combo.create!(name: "Overpromised and underdelivered", description: "The history of the Fyre Music Festival, from its creation through its unraveling.",
# movie: Movie.find_by_name("Fyre"), restaurant: Restaurant.find_by_name("Itsu"))

# Combo.create!(name: "Anime and Yakitori", description: "Enter the Anime is a documentary featuring Tania Nolan trying to explain the popularity of anime by interviewing Shinji Aramaki, Kôzô Morishita and Yoko Takahashi, creators behind well-known productions like Castlevania, Aggretsuko and Kengan Ashura.",
# movie: Movie.find_by_name("Enter the Anime"), restaurant: Restaurant.find_by_name("The Japanese Canteen"))
# Combo.create!(name: "Fishpeople...Fish people?!", description: "The stories of people who have dedicated their lives to the sea, from surfers and spearfishers to a long-distance swimmer, a former coal miner and a group of at-risk kids on the streets of San Francisco.",
# movie: Movie.find_by_name("Fishpeople"), restaurant: Restaurant.find_by_name("Japanika"))
# Combo.create!(name: "Betting on Jiro", description: "Hedge fund titan Bill Ackman is on a crusade to expose global nutritional giant Herbalife as the largest pyramid scheme in history, while Herbalife executives claim Ackman is a market manipulator out to bankrupt them.",
# movie: Movie.find_by_name("Betting on Zero"), restaurant: Restaurant.find_by_name("Gourmet Sushi"))
# Combo.create!(name: "Losing sight of Shore", description: "Four women set out to row across the Pacific Ocean, from America to Australia. As they row over 8,000 miles during their nine months at sea, they must overcome extreme mental and physical challenges to make history.",
# movie: Movie.find_by_name("Losing Sight of Shore"), restaurant: Restaurant.find_by_name("EATKatsu"))


# Movie.create!(name:"Jaws", genre: Genre.find_by_name("cult"), description:"When a killer shark unleashes chaos on a beach community, it's up to a local sheriff, a marine biologist, and an old seafarer to hunt the beast down.
# # ",photo_url:"https://m.media-amazon.com/images/M/MV5BMmVmODY1MzEtYTMwZC00MzNhLWFkNDMtZjAwM2EwODUxZTA5XkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_SX651_CR0,0,651,999_AL_.jpg",link_url:"https://www.imdb.com/title/tt0073195/?ref_=fn_al_tt_1")
# Movie.create!(name:"The Angry Birds Movie", genre: Genre.find_by_name("family"), description:"Find out why the birds are so angry. When an island populated by happy, flightless birds is visited by mysterious green piggies, it's up to three unlikely outcasts - Red, Chuck and Bomb - to figure out what the pigs are up to.
# ",photo_url:"https://m.media-amazon.com/images/M/MV5BMTY3MjU0NDA0OF5BMl5BanBnXkFtZTgwNTc0MTU3OTE@._V1_SY1000_CR0,0,702,1000_AL_.jpg",link_url:"https://www.imdb.com/title/tt1985949/?ref_=fn_al_tt_4")
# Movie.create!(name:"The Silence of Lambs", genre: Genre.find_by_name("family"), description:"A young F.B.I. cadet must receive the help of an incarcerated and manipulative cannibal killer to help catch another serial killer, a madman who skins his victims.
# ",photo_url:"https://m.media-amazon.com/images/M/MV5BNjNhZTk0ZmEtNjJhMi00YzFlLWE1MmEtYzM1M2ZmMGMwMTU4XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SY1000_CR0,0,677,1000_AL_.jpg",link_url:"https://www.imdb.com/title/tt0102926/?ref_=nv_sr_1?ref_=nv_sr_1")
# Movie.create!(name:"Blade Runner", genre: Genre.find_by_name("family"), description:"A blade runner must pursue and terminate four replicants who stole a ship in space, and have returned to Earth to find their creator.
# ",photo_url:"https://m.media-amazon.com/images/M/MV5BNzQzMzJhZTEtOWM4NS00MTdhLTg0YjgtMjM4MDRkZjUwZDBlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SY1000_CR0,0,671,1000_AL_.jpg",link_url:"https://www.imdb.com/title/tt0083658/?ref_=nv_sr_2?ref_=nv_sr_2")
# Movie.create!(name:"Kung Fu Panda2", genre: Genre.find_by_name("family"), description:"The Dragon Warrior has to clash against the savage Tai Lung as China's fate hangs in the balance. However, the Dragon Warrior mantle is supposedly mistaken to be bestowed upon an obese panda who is a novice in martial arts.
# ",photo_url:"https://m.media-amazon.com/images/M/MV5BODJkZTZhMWItMDI3Yy00ZWZlLTk4NjQtOTI1ZjU5NjBjZTVjXkEyXkFqcGdeQXVyODE5NzE3OTE@._V1_SY1000_CR0,0,689,1000_AL_.jpg",link_url:"https://www.imdb.com/title/tt0441773/?ref_=nv_sr_1?ref_=nv_sr_1")
# Movie.create!(name:"Jaws2", genre: Genre.find_by_name("family"), description:"When a killer shark unleashes chaos on a beach community, it's up to a local sheriff, a marine biologist, and an old seafarer to hunt the beast down.
# ",photo_url:"https://m.media-amazon.com/images/M/MV5BMmVmODY1MzEtYTMwZC00MzNhLWFkNDMtZjAwM2EwODUxZTA5XkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_SX651_CR0,0,651,999_AL_.jpg",link_url:"https://www.imdb.com/title/tt0073195/?ref_=fn_al_tt_1")
# Movie.create!(name:"The Angry Birds Movie2", genre: Genre.find_by_name("family"), description:"Find out why the birds are so angry. When an island populated by happy, flightless birds is visited by mysterious green piggies, it's up to three unlikely outcasts - Red, Chuck and Bomb - to figure out what the pigs are up to.
# ",photo_url:"https://m.media-amazon.com/images/M/MV5BMTY3MjU0NDA0OF5BMl5BanBnXkFtZTgwNTc0MTU3OTE@._V1_SY1000_CR0,0,702,1000_AL_.jpg",link_url:"https://www.imdb.com/title/tt1985949/?ref_=fn_al_tt_4")
# Movie.create!(name:"The Silence of Lambs2", genre: Genre.find_by_name("family"), description:"A young F.B.I. cadet must receive the help of an incarcerated and manipulative cannibal killer to help catch another serial killer, a madman who skins his victims.
# ",photo_url:"https://m.media-amazon.com/images/M/MV5BNjNhZTk0ZmEtNjJhMi00YzFlLWE1MmEtYzM1M2ZmMGMwMTU4XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SY1000_CR0,0,677,1000_AL_.jpg",link_url:"https://www.imdb.com/title/tt0102926/?ref_=nv_sr_1?ref_=nv_sr_1")
# Movie.create!(name:"Blade Runner2", genre: Genre.find_by_name("family"), description:"A blade runner must pursue and terminate four replicants who stole a ship in space, and have returned to Earth to find their creator.
# ",photo_url:"https://m.media-amazon.com/images/M/MV5BNzQzMzJhZTEtOWM4NS00MTdhLTg0YjgtMjM4MDRkZjUwZDBlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SY1000_CR0,0,671,1000_AL_.jpg",link_url:"https://www.imdb.com/title/tt0083658/?ref_=nv_sr_2?ref_=nv_sr_2")
# Movie.create!(name:"Kung Fu Panda3", genre: Genre.find_by_name("family"), description:"The Dragon Warrior has to clash against the savage Tai Lung as China's fate hangs in the balance. However, the Dragon Warrior mantle is supposedly mistaken to be bestowed upon an obese panda who is a novice in martial arts.
# ",photo_url:"https://m.media-amazon.com/images/M/MV5BODJkZTZhMWItMDI3Yy00ZWZlLTk4NjQtOTI1ZjU5NjBjZTVjXkEyXkFqcGdeQXVyODE5NzE3OTE@._V1_SY1000_CR0,0,689,1000_AL_.jpg",link_url:"https://www.imdb.com/title/tt0441773/?ref_=nv_sr_1?ref_=nv_sr_1")
# Movie.create!(name:"Jaws3", genre: Genre.find_by_name("family"), description:"When a killer shark unleashes chaos on a beach community, it's up to a local sheriff, a marine biologist, and an old seafarer to hunt the beast down.
# ",photo_url:"https://m.media-amazon.com/images/M/MV5BMmVmODY1MzEtYTMwZC00MzNhLWFkNDMtZjAwM2EwODUxZTA5XkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_SX651_CR0,0,651,999_AL_.jpg",link_url:"https://www.imdb.com/title/tt0073195/?ref_=fn_al_tt_1")
# Movie.create!(name:"The Angry Birds Movie3", genre: Genre.find_by_name("family"), description:"Find out why the birds are so angry. When an island populated by happy, flightless birds is visited by mysterious green piggies, it's up to three unlikely outcasts - Red, Chuck and Bomb - to figure out what the pigs are up to.
# ",photo_url:"https://m.media-amazon.com/images/M/MV5BMTY3MjU0NDA0OF5BMl5BanBnXkFtZTgwNTc0MTU3OTE@._V1_SY1000_CR0,0,702,1000_AL_.jpg",link_url:"https://www.imdb.com/title/tt1985949/?ref_=fn_al_tt_4")
# Movie.create!(name:"The Silence of Lambs3", genre: Genre.find_by_name("family"), description:"A young F.B.I. cadet must receive the help of an incarcerated and manipulative cannibal killer to help catch another serial killer, a madman who skins his victims.
# ",photo_url:"https://m.media-amazon.com/images/M/MV5BNjNhZTk0ZmEtNjJhMi00YzFlLWE1MmEtYzM1M2ZmMGMwMTU4XkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SY1000_CR0,0,677,1000_AL_.jpg",link_url:"https://www.imdb.com/title/tt0102926/?ref_=nv_sr_1?ref_=nv_sr_1")
# Movie.create!(name:"Blade Runner3", genre: Genre.find_by_name("family"), description:"A blade runner must pursue and terminate four replicants who stole a ship in space, and have returned to Earth to find their creator.
# ",photo_url:"https://m.media-amazon.com/images/M/MV5BNzQzMzJhZTEtOWM4NS00MTdhLTg0YjgtMjM4MDRkZjUwZDBlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_SY1000_CR0,0,671,1000_AL_.jpg",link_url:"https://www.imdb.com/title/tt0083658/?ref_=nv_sr_2?ref_=nv_sr_2")
# # Movie.create!(name:"Kung Fu Panda", genre: Genre.find_by_name("family"), description:"The Dragon Warrior has to clash against the savage Tai Lung as China's fate hangs in the balance. However, the Dragon Warrior mantle is supposedly mistaken to be bestowed upon an obese panda who is a novice in martial arts.
# # # ",photo_url:"https://m.media-amazon.com/images/M/MV5BODJkZTZhMWItMDI3Yy00ZWZlLTk4NjQtOTI1ZjU5NjBjZTVjXkEyXkFqcGdeQXVyODE5NzE3OTE@._V1_SY1000_CR0,0,689,1000_AL_.jpg",link_url:"https://www.netflix.com/title/70075480")
# Movie.create!(name:"Blackfish", genre: Genre.find_by_name("documentary"), description:"A documentary following the controversial captivity of killer whales, and its dangers for both humans and whales.
# ",photo_url:"https://m.media-amazon.com/images/M/MV5BNTkyNTkwMzkxMl5BMl5BanBnXkFtZTcwMzAwOTE2OQ@@._V1_SY1000_CR0,0,674,1000_AL_.jpg",link_url:"https://www.netflix.com/title/70267802")
# Movie.create!(name:"Jiro Dreams of Sushi", genre: Genre.find_by_name("documentary"), description:"Revered sushi chef Jiro Ono strives for perfection in his work, while his eldest son, Yoshikazu, has trouble living up to his father's legacy.
# ",photo_url:"https://m.media-amazon.com/images/M/MV5BMTA5NzQzODUxOTheQTJeQWpwZ15BbWU3MDIwODg1MDc@._V1_SY1000_CR0,0,715,1000_AL_.jpg",link_url:"https://www.netflix.com/title/70181716")
# Movie.create!(name:"Chasing Coral", genre: Genre.find_by_name("documentary"), description:"Coral reefs around the world are vanishing at an unprecedented rate. A team of divers, photographers and scientists set out on a thrilling ocean adventure to discover why and to reveal the underwater mystery to the world.
# ",photo_url:"https://m.media-amazon.com/images/M/MV5BOTkwMGM3MzgtOGVlMy00ZGY1LWEwNTYtM2E2NzhhYTAyYTVkL2ltYWdlXkEyXkFqcGdeQXVyMTE1NjQzNDI@._V1_SY1000_SX675_AL_.jpg",link_url:"https://www.netflix.com/title/80168188")
# Movie.create!(name: "Cowspiracy", genre: Genre.find_by_name("documentary"), description: "Follow the shocking, yet humorous, journey of an aspiring environmentalist, as he daringly seeks to find the real solution to the most pressing environmental issues and true path to sustainability.", photo_url: "https://upload.wikimedia.org/wikipedia/en/thumb/d/dd/Cowspiracy_poster.jpg/220px-Cowspiracy_poster.jpg",link_url: "https://www.netflix.com/title/80033772")
# Movie.create!(name: "Resurface", genre: Genre.find_by_name("documentary"), description: "After years of nightmares, depression, and seizures, Iraq war veteran Bobby Lane could see no way out of his trauma other than suicide. Then he met Van Curaza, a former big wave surfer who since founded Operation Surf and dedicated his life to helping veterans find solace in surfing.
# ",photo_url: "https://m.media-amazon.com/images/M/MV5BYjU4Y2NjNmEtOTQ5Mi00YzdmLTk2N2MtZTM2YWJlNzE5ZDhhXkEyXkFqcGdeQXVyMjQyMjM4MjI@._V1_SY1000_CR0,0,671,1000_AL_.jpg", link_url: "https://www.netflix.com/title/80184055")

# # Added by Alex Flamant on 30agu2019
# Movie.create!(name:"Enter the Anime", genre: Genre.find_by_name("documentary"), description:"Enter the Anime is a documentary featuring Tania Nolan trying to explain the popularity of anime by interviewing Shinji Aramaki, Kôzô Morishita and Yoko Takahashi, creators behind well-known productions like Castlevania, Aggretsuko and Kengan Ashura.
#   ",photo_url:"https://m.media-amazon.com/images/M/MV5BMTgwNGI5MTAtMGJlZS00MzZlLWJjNmItZDcxYTFmY2VmMGJlXkEyXkFqcGdeQXVyMjUxMTEwNTE@._V1_SY1000_CR0,0,713,1000_AL_.jpg",link_url:"https://www.netflix.com/title/81143771")
# Movie.create!(name:"Fyre", genre: Genre.find_by_name("documentary"), description:"The history of the Fyre Music Festival, from its creation through its unraveling.
#   ",photo_url:"https://m.media-amazon.com/images/M/MV5BMjQ2NzE1MjYxMV5BMl5BanBnXkFtZTgwMjM3MDQxNzM@._V1_SY1000_SX675_AL_.jpg",link_url:"https://www.netflix.com/title/81035279")
# Movie.create!(name:"Betting on Zero", genre: Genre.find_by_name("documentary"), description:"Hedge fund titan Bill Ackman is on a crusade to expose global nutritional giant Herbalife as the largest pyramid scheme in history, while Herbalife executives claim Ackman is a market manipulator out to bankrupt them.
#   ",photo_url:"https://m.media-amazon.com/images/M/MV5BMjA0MTc3ODc3NF5BMl5BanBnXkFtZTgwMTQ5NDc0MTI@._V1_SY1000_CR0,0,676,1000_AL_.jpg",link_url:"https://www.netflix.com/title/80108609")
# Movie.create!(name:"Fishpeople", genre: Genre.find_by_name("documentary"), description:"The stories of people who have dedicated their lives to the sea, from surfers and spearfishers to a long-distance swimmer, a former coal miner and a group of at-risk kids on the streets of San Francisco.
#   ",photo_url:"https://m.media-amazon.com/images/M/MV5BOWM5MTU1OTgtMjVkOC00Y2VkLTgyMTAtMDI5YzE3YzZiZWE0XkEyXkFqcGdeQXVyNTM3MDMyMDQ@._V1_.jpg",link_url:"https://www.netflix.com/title/80196139")
# Movie.create!(name:"Losing Sight of Shore", genre: Genre.find_by_name("documentary"), description:"Four women set out to row across the Pacific Ocean, from America to Australia. As they row over 8,000 miles during their nine months at sea, they must overcome extreme mental and physical challenges to make history.
#   ",photo_url:"https://www.gstatic.com/tv/thumb/v22vodart/14087387/p14087387_v_v8_ab.jpg",link_url:"https://www.netflix.com/title/80169548")

# Restaurant.create!(name:"The Old Street Chinese", food_type: FoodType.find_by_name("vietname"), photo_url:"https://www.thegrove.co.uk/wp-content/uploads/2019/05/The-Glasshouse-1-New.jpg", link_url:"https://deliveroo.co.uk/menu/london/old-street/the-old-street-chinese?day=today&postcode=E28DY&time=ASAP", address:"EC1V 9FR")
# Restaurant.create!(name:"Great British Fish & Chips", food_type: FoodType.find_by_name("vietname"), photo_url:"https://www.thegrove.co.uk/wp-content/uploads/2019/05/The-Glasshouse-1-New.jpg", link_url:"https://deliveroo.co.uk/menu/london/tower-hill/great-british-fish-and-chips?day=today&postcode=E28DY&time=1100", address:"SE1 7PB")
# Restaurant.create!(name:"Nando's Dalston", food_type: FoodType.find_by_name("vietname"), photo_url:"https://www.thegrove.co.uk/wp-content/uploads/2019/05/The-Glasshouse-1-New.jpg", link_url:"https://deliveroo.co.uk/menu/london/dalston/nandos-dalston?day=today&postcode=E28DY&time=1100", address:"E8 2NS")
# Restaurant.create!(name:"Turkish Delight", FoodType.find_by_name("vietname"), photo_url:"https://www.thegrove.co.uk/wp-content/uploads/2019/05/The-Glasshouse-1-New.jpg", link_url:"https://deliveroo.co.uk/menu/london/old-street/turkish-delight-london?day=today&postcode=E28DY&time=ASAP", address:"EC1V 9HE")
# Restaurant.create!(name:"The Old Street Chinese2", food_type: FoodType.find_by_name("vietname"), photo_url:"https://www.thegrove.co.uk/wp-content/uploads/2019/05/The-Glasshouse-1-New.jpg", link_url:"https://deliveroo.co.uk/menu/london/old-street/the-old-street-chinese?day=today&postcode=E28DY&time=ASAP", address:"EC1V 9FR")
# Restaurant.create!(name:"Great British Fish & Chips2", food_type: FoodType.find_by_name("vietname"), photo_url:"https://www.thegrove.co.uk/wp-content/uploads/2019/05/The-Glasshouse-1-New.jpg", link_url:"https://deliveroo.co.uk/menu/london/tower-hill/great-british-fish-and-chips?day=today&postcode=E28DY&time=1100", address:"SE1 7PB")
# Restaurant.create!(name:"Nando's Dalston2", food_type: FoodType.find_by_name("vietname"), photo_url:"https://www.thegrove.co.uk/wp-content/uploads/2019/05/The-Glasshouse-1-New.jpg", link_url:"https://deliveroo.co.uk/menu/london/dalston/nandos-dalston?day=today&postcode=E28DY&time=1100", address:"E8 2NS")
# Restaurant.create!(name:"Turkish Delight2", food_type: FoodType.find_by_name("vietname"), photo_url:"https://www.thegrove.co.uk/wp-content/uploads/2019/05/The-Glasshouse-1-New.jpg", link_url:"https://deliveroo.co.uk/menu/london/old-street/turkish-delight-london?day=today&postcode=E28DY&time=ASAP", address:"EC1V 9HE")
# Restaurant.create!(name:"The Old Street Chinese3", food_type: FoodType.find_by_name("vietname"), photo_url:"https://www.thegrove.co.uk/wp-content/uploads/2019/05/The-Glasshouse-1-New.jpg", link_url:"https://deliveroo.co.uk/menu/london/old-street/the-old-street-chinese?day=today&postcode=E28DY&time=ASAP", address:"EC1V 9FR")
# Restaurant.create!(name:"Great British Fish & Chips3", food_type: FoodType.find_by_name("vietname"), photo_url:"https://www.thegrove.co.uk/wp-content/uploads/2019/05/The-Glasshouse-1-New.jpg", link_url:"https://deliveroo.co.uk/menu/london/tower-hill/great-british-fish-and-chips?day=today&postcode=E28DY&time=1100", address:"SE1 7PB")
# Restaurant.create!(name:"Nando's Dalston3", food_type: FoodType.find_by_name("vietname"), photo_url:"https://www.thegrove.co.uk/wp-content/uploads/2019/05/The-Glasshouse-1-New.jpg", link_url:"https://deliveroo.co.uk/menu/london/dalston/nandos-dalston?day=today&postcode=E28DY&time=1100", address:"E8 2NS")
# Restaurant.create!(name:"Turkish Delight3", food_type: FoodType.find_by_name("vietname"), photo_url:"https://www.thegrove.co.uk/wp-content/uploads/2019/05/The-Glasshouse-1-New.jpg", link_url:"https://deliveroo.co.uk/menu/london/old-street/turkish-delight-london?day=today&postcode=E28DY&time=ASAP", address:"EC1V 9HE")

# Combo.create!(name:"Panda Express", description:"Panda Express description", movie: Movie.find_by_name("Kung Fu Panda"), restaurant: Restaurant.find_by_name("The Old Street Chinese"))
# Combo.create!(name:"Swimming with the Fish", description:"Swimming with the sea description", movie: Movie.find_by_name("Jaws"), restaurant: Restaurant.find_by_name("Great British Fish & Chips"))
# Combo.create!(name:"Angry Bird Combo", description:"Angry bird combo description", movie: Movie.find_by_name("The Angry Birds Movie"))
# Combo.create!(name:"Silence of Lamb Combo", description:"Silence of lamb description", movie: Movie.find_by_name("The Silence of Lambs"))
# Combo.create!(name:"Panda Express2", description:"Panda Express description", movie: Movie.find_by_name("Kung Fu Panda2"))
# Combo.create!(name:"Swimming with the Fish2", description:"Swimming with the sea description", movie: Movie.find_by_name("Jaws2"))
# Combo.create!(name:"Angry Bird Combo2", description:"Angry bird combo description", movie: Movie.find_by_name("The Angry Birds Movie2"))
# Combo.create!(name:"Silence of Lamb Combo2", description:"Silence of lamb description", movie: Movie.find_by_name("The Silence of Lambs2"))
# Combo.create!(name:"Panda Express3", description:"Panda Express description", movie: Movie.find_by_name("Kung Fu Panda3"))
# Combo.create!(name:"Swimming with the Fish3", description:"Swimming with the sea description", movie: Movie.find_by_name("Jaws3"))
# Combo.create!(name:"Angry Bird Combo3", description:"Angry bird combo description", movie: Movie.find_by_name("The Angry Birds Movie3"))
# Combo.create!(name:"Silence of Lamb Combo3", description:"Silence of lamb description", movie: Movie.find_by_name("The Silence of Lambs3"))


# Demo August 30th
# Combo.create!(name:"Screen to plate", description: "Revered sushi chef Jiro Ono strives for perfection in his work, while his eldest son, Yoshikazu, has trouble living up to his father's legacy.
# ", movie: Movie.find_by_name("Jiro Dreams of Sushi"), restaurant: Restaurant.find_by_name("Miyako"))
# Combo.create!(name:"Surf & Surf", description: "After years of nightmares, depression, and seizures, Iraq war veteran Bobby Lane could see no way out of his trauma other than suicide. Then he met Van Curaza, a former big wave surfer who since founded Operation Surf and dedicated his life to helping veterans find solace in surfing.
#  ", movie: Movie.find_by_name("Resurface"), restaurant: Restaurant.find_by_name("Island Poke"))
# Combo.create!(name:"Vegan Surf", description: "Follow the shocking, yet humorous, journey of an aspiring environmentalist, as he daringly seeks to find the real solution to the most pressing environmental issues and true path to sustainability.",
# movie: Movie.find_by_name("Cowspiracy"), restaurant: Restaurant.find_by_name("Poke Zone"))
# Combo.create!(name:"Ocean Adventure", description: "Coral reefs around the world are vanishing at an unprecedented rate. A team of divers, photographers and scientists set out on a thrilling ocean adventure to discover why and to reveal the underwater mystery to the world.",
# movie: Movie.find_by_name("Chasing Coral"), restaurant: Restaurant.find_by_name("Nobu"))
# Combo.create!(name:"Fresh from the Sea", description: "A documentary following the controversial captivity of killer whales, and its dangers for both humans and whales.",
# movie: Movie.find_by_name("Blackfish"), restaurant: Restaurant.find_by_name("Suito Japanese"))
# Combo.create!(name: "Overpromised and underdelivered", description: "The history of the Fyre Music Festival, from its creation through its unraveling.",
# movie: Movie.find_by_name("Fyre"), restaurant: Restaurant.find_by_name("Itsu"))
# Combo.create!(name: "Anime and Yakitori", description: "Enter the Anime is a documentary featuring Tania Nolan trying to explain the popularity of anime by interviewing Shinji Aramaki, Kôzô Morishita and Yoko Takahashi, creators behind well-known productions like Castlevania, Aggretsuko and Kengan Ashura.",
# movie: Movie.find_by_name("Enter the Anime"), restaurant: Restaurant.find_by_name("The Japanese Canteen"))
# Combo.create!(name: "Fishpeople...Fish people?!", description: "The stories of people who have dedicated their lives to the sea, from surfers and spearfishers to a long-distance swimmer, a former coal miner and a group of at-risk kids on the streets of San Francisco.",
# movie: Movie.find_by_name("Fishpeople"), restaurant: Restaurant.find_by_name("Japanika"))
# Combo.create!(name: "Betting on Jiro", description: "Hedge fund titan Bill Ackman is on a crusade to expose global nutritional giant Herbalife as the largest pyramid scheme in history, while Herbalife executives claim Ackman is a market manipulator out to bankrupt them.",
# movie: Movie.find_by_name("Betting on Zero"), restaurant: Restaurant.find_by_name("Gourmet Sushi"))
# Combo.create!(name: "Losing sight of Shore", description: "Four women set out to row across the Pacific Ocean, from America to Australia. As they row over 8,000 miles during their nine months at sea, they must overcome extreme mental and physical challenges to make history.",
# movie: Movie.find_by_name("Losing Sight of Shore"), restaurant: Restaurant.find_by_name("EATKatsu"))


require 'open-uri'
require 'nokogiri'

class ScraperDeliveroo
  def initialize(postcode, foodtype)
    @postcode = postcode
    @foodtype = foodtype
  end

  def call

    url = "https://deliveroo.co.uk/restaurants/london/haggerston?postcode=#{@postcode}&collection=#{@foodtype}"

    html_file = open(url).read
    html_doc = Nokogiri::HTML(html_file)
    # # puts html_doc
    restaurants = {
      @foodtype.to_sym => []
    }

    #FoodType Images
    images_hash = {
      burgers: ["https://www.veggiesdontbite.com/wp-content/uploads/2017/10/vegan-barbecue-black-bean-burger-40-Edit-1.jpg", "https://images.ricardocuisine.com/services/recipes/129545518655faa7115c6e4.jpg", "https://www.theroastedroot.net/wp-content/uploads/2018/06/pesto_burgers_with_caramelized_onions_and_mushrooms_1.jpg", "https://playswellwithbutter.com/wp-content/uploads/2019/08/Stuffed-Southwest-Turkey-Burgers-12.jpg", "https://www.deliciousmagazine.co.uk/wp-content/uploads/2019/06/veggie-burger-768x960.jpg", "https://www.sainsburysmagazine.co.uk/media/5870/download/Peri-peri-halloumi-burger-with-sweetcorn-salsa.jpg?v=1", "https://campaignforkids.com/wp-content/uploads/2019/02/UnionsStreet.jpeg", "https://www.thepkpway.com/wp-content/uploads/2016/06/alaskan-pollock-burger-pineapple-jalapeno-slaw-6a.jpg", "https://img-aws.ehowcdn.com/700x/cdn.onlyinyourstate.com/wp-content/uploads/2018/07/33808810_2115675235129629_44295518142070784_n-700x933.jpg", "https://cdn1.clickthecity.com/images/establishment/common/raw/8296.jpg", "https://cms.hostelworld.com/hwblog/wp-content/uploads/sites/2/2017/10/vegan-restaurants-paris-@parisbyvegan-Hank-burger-701x875.jpg"],
      italian: ["https://www.amummytoo.co.uk/wp-content/uploads/2017/01/Grana-Padano-and-prosciutto-cauliflower-crust-pizza-close-up.jpg", "https://www.thatsmags.com/image/view/201806/1645957629.jpg", "https://d1wb0ukcj65cfk.cloudfront.net/restaurant_original/3f36ff1a-88fb-48df-8ddb-eddf4d8dd771.jpg", "http://weirditaly.com/wp-content/uploads/2017/12/zizzi.jpg", "http://indacocharls.wpengine.com/wp-content/uploads/2015/02/ZT7A6050.jpg", "https://www.creativephototeam.com/wp-content/uploads/2015/12/Papardelle-italian-pasta-with-fresh-cherry-tomatoes-and-basil.jpg", "https://www.lifeinitaly.com/wp-content/uploads/2018/08/Depositphotos_38772135_m.jpg", "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/delish-190606-flatbread-pizza-432-portrait-pf-1560544301.jpg?crop=0.9997369113391213xw:1xh;center,top&resize=480:*", "https://www.italianbreaks.com/wp-content/uploads/2017/12/27-reasons-Italian-food-is-the-worst-italian-brunch-546x682.jpg", "https://static.wixstatic.com/media/e610d1_eb548ee62cb34fa2af8d3bb8fbc3c01e~mv2_d_3000_1946_s_2.jpg/v1/fill/w_640,h_910,al_c,q_85,usm_0.66_1.00_0.01/e610d1_eb548ee62cb34fa2af8d3bb8fbc3c01e~mv2_d_3000_1946_s_2.webp", "https://marisasitaliankitchen.com/wp-content/uploads/2019/08/Kale-Pesto-with-Spaghetti-6-of-6-1-680x900.jpg", "https://www.limewoodhotel.co.uk/media/1305/cookery-class-classics2.jpg?mode=crop&quality=70&width=1120&height=2080&format=jpg]"],
      salad: ["http://honestlyyum.com/wp-content/uploads/2016/06/kale.watermelon.salad_.1.1.jpg", "https://carlsbadcravings.com/wp-content/uploads/2018/11/fall-salad-14-600x900.jpg", "https://cozypeachkitchen.com/wp-content/uploads/2019/02/kale-salad-3.jpg", "https://layersofhappiness.com/wp-content/uploads/2014/07/The-Best-Chopped-Salad.jpg", "https://www.liveeatlearn.com/wp-content/uploads/2015/03/avocado-mango-spinach-salad-vert.jpg", "https://tatyanaseverydayfood.com/wp-content/uploads/2016/02/Garlic-Chicken-Salad.jpg", "https://www.spendwithpennies.com/wp-content/uploads/2018/07/healthy-kale-brocoli-salad-lemon-dressing-recipe-.jpg", "https://sugarandcharm.com/wp-content/uploads/2019/02/easiest-salad-ever-2.jpg", "https://www.littlebroken.com/wp-content/uploads/2019/07/Tomato-Mozzarella-Salad-with-Balsamic-Reduction-13.jpg", "https://www.foodfaithfitness.com/wp-content/uploads/2018/06/three-bean-mexican-corn-black-bean-salad-picture.jpg"],
      sushi: ["http://eatbook.sg/wp-content/uploads/2018/08/Sushi-Buffet-Food-Places-1.jpg", "http://qsushi.com/wp-content/uploads/2017/02/sushipatio.jpg", "https://blog.williams-sonoma.com/wp-content/uploads/2016/12/Sushi-Hero-Long.jpg", "https://images.harrods.com/content/The_Sushi_Bar-Restaurant-3-June19.jpg?dwn=720px:1080px", "https://www.foxandbriar.com/wp-content/uploads/2017/02/Salmon-Sushi-Bowls-10.jpg", "https://www.julieslifestyle.com/src/Frontend/Files/blog/images/source/mushroom-avocado-sushi-rolls-vegan-gluten-free-inspiration-anett-velsberg-en-662.jpg", "https://simple-veganista.com/wp-content/uploads/2012/07/raw-vegan-sushi-rolls-5.jpg", "https://images.squarespace-cdn.com/content/v1/58ae5064d482e9529405676a/1549201753059-1Q5FOR0ZUDTWJO3PM9YW/ke17ZwdGBToddI8pDm48kO4Ymik7jCTU-OigDuhUoP17gQa3H78H3Y0txjaiv_0fDoOvxcdMmMKkDsyUqMSsMWxHk725yiiHCCLfrh8O1z5QPOohDIaIeljMHgDF5CVlOqpeNLcJ80NK65_fV7S1UbjWf3F0osKH369u33AEJniJgEHb_R28Um2LA17-lActY7x6kDsGDMYkQIOJRDvK5g/Whole30+sushi+burritos+are+the+perfect+thing+to+get+your+through+that+sushi+craving+whether+you+are+following+a+whole30%2C+paleo+or+low+carb+diet.+You+can+easily+make+one+of+these+delicious+and+simple+Whole30+Sushi+Burritos+at+home", "https://www.happyfoodstube.com/wp-content/uploads/2016/03/homemade-sushi-picture.jpg", "https://www.julieslifestyle.com/src/Frontend/Files/blog/images/source/mushroom-avocado-sushi-rolls-vegan-gluten-free-inspiration-anett-velsberg-en-662.jpg", "https://lifemadesweeter.com/wp-content/uploads/Calfornia-Roll-Bowl-Recipe-Picture-photo-two-bowls-picture-recipe.jpg"],
      vietnamese: ["https://thewoksoflife.com/wp-content/uploads/2015/03/pho-recipe-3.jpg", "http://foodology.ca/wp-content/uploads/2018/02/dundas-vegan-6-620x794.jpg", "https://c8.alamy.com/comp/T8X3H3/asian-food-set-served-on-gray-stone-background-top-view-chinese-japanese-and-vietnamese-cuisine-sushi-rice-and-noodle-T8X3H3.jpg", "https://www.readingchronicle.co.uk/resources/images/6666082.jpg?display=1&htype=0&type=responsive-gallery", "https://ak.picdn.net/offset/photos/59a878b017fb156e4806a32e/medium/offset_607078.jpg", "https://beautyfoodymom.com/wp-content/uploads/2019/02/IMG_1415.jpg", "https://www.watchwhatueat.com/wp-content/uploads/2016/06/Healthy-Spring-Rolls-1.jpg", "https://www.readingchronicle.co.uk/resources/images/6666082.jpg?display=1&htype=0&type=responsive-gallery", "https://www.roadiscalling.com/wp-content/uploads/2018/04/60A62182-0331-4067-B2DF-9C4316B5128E.jpg", "https://www.willflyforfood.net/wp-content/uploads/2017/08/banh-mi-hoa-ma2.jpg", "https://static.wixstatic.com/media/68e7a4_e8964124c5334a31a570bf95b3c47dec~mv2.jpg/v1/fill/w_284,h_354,al_c,q_80,usm_0.66_1.00_0.01/68e7a4_e8964124c5334a31a570bf95b3c47dec~mv2.jpg"]
    }

    html_doc.search('.HomeFeedUICard-45fe00a3d559fba5').map do |element|
      images_hash.each do |foodtype, links|
          food = FoodType.find_by_name(@foodtype)
          if foodtype == food.name.to_sym
            # NEED TO GET RESTAURANT NAME
            restaurants[@foodtype.to_sym] << Restaurant.create(name: element.search(".HomeFeedUICard-f7ccdc5e7b2c5059.HomeFeedUICard-a9d288756e60cf37").text.strip, food_type: food, photo_url: links.sample, link_url: "https://deliveroo.co.uk/menu/london/haggerston/#{element.search(".HomeFeedUICard-f7ccdc5e7b2c5059.HomeFeedUICard-a9d288756e60cf37").text.strip}-haggerston?day=today&postcode=E28DY&time=ASAP", address: @postcode)
          end
        end
      end
    end
  end
end

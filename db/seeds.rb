Product.destroy_all
User.destroy_all


user_test = User.create!(email:"test@caddyconnect.fr", password:"123456")

Product.create!(name: "Poele", price: "10", description: "poele a steak", brand: "Tefal", ecommerce: "Amazon", tracking_number: "1ZV4V414A600215239", purchase_date: "21-08-15", user: user_test, photo: "http://i2.cdscdn.com/pdt2/2/7/3/1/700x700/ge506273/rw/tradifonte-poele-fonte-20-cm.jpg")
Product.create!(name: "Velo", price: "150", description: "Velo tout terrain", brand: "Giant", ecommerce: "Amazon", tracking_number: "LA007319522FR", purchase_date: "21-08-25", user: user_test, photo: "http://www.velo-cycle-vtt.com/images/mtb-monster-xt.jpg")
Product.create!(name: "Iphone 6", price: "450", description: "Le nouveau téléphone à la mode", brand: "Apple", ecommerce: "Apple Store", tracking_number: "CW015373485FR", purchase_date: "21-08-30", user: user_test, photo: "http://www.deserres.ca/data/Products/Photos/FR/standard/Source/85132_1_GUSTAVE.jpg")
Product.create!(name: "Jeans Slim", price: "66", description: "Jean Bleu taille 36", brand: "Levis", ecommerce: "Amazon", tracking_number: "400962332", purchase_date: "21-08-05", user: user_test, photo: "http://i2.kym-cdn.com/entries/icons/original/000/019/677/5Pikachu.png")


Product.destroy_all
User.destroy_all


user_test = User.create!(email:"test@caddyconnect.fr", password:"123456")

Product.create!(name: "Poele", price: 10, description: "poele a steak", brand: "Tefal", ecommerce: "Amazon", tracking_number: "", purchase_date: "2016-08-15", user: user_test, category: "Cuisine", photo: "http://i2.cdscdn.com/pdt2/2/7/3/1/700x700/ge506273/rw/tradifonte-poele-fonte-20-cm.jpg")
Product.create!(name: "Velo", price: 150, description: "Velo tout terrain", brand: "Giant", ecommerce: "Amazon", tracking_number: "", purchase_date: "2016-05-13", user: user_test, category: "Sport", photo: "http://www.velo-cycle-vtt.com/images/mtb-monster-xt.jpg")
Product.create!(name: "Iphone 6", price: 450, description: "Le nouveau téléphone à la mode", brand: "Apple", ecommerce: "Apple Store", tracking_number: "", purchase_date: "2016-07-20", user: user_test, category: "Hi-Tech", photo: "http://www.deserres.ca/data/Products/Photos/FR/standard/Source/85132_1_GUSTAVE.jpg")
Product.create!(name: "Jeans Slim", price: 66, description: "Jean Bleu taille 36", brand: "Levis", ecommerce: "Amazon", tracking_number: "", purchase_date: "2016-05-13", user: user_test, category: "Vetement", photo: "http://i2.kym-cdn.com/entries/icons/original/000/019/677/5Pikachu.png")
Product.create!(name: "Top Bleu", price: 52, description: "Top bleu taille M", brand: "Sandro", ecommerce: "Sandro.com", tracking_number: "", purchase_date: "2016-08-03", user: user_test, category: "Vetement", photo: "http://i2.kym-cdn.com/entries/icons/original/000/019/677/5Pikachu.png")
Product.create!(name: "Bilboquet", price: 10, description: "Jeu d'adresse en bois", brand: "Janod", ecommerce: "Cdiscount", tracking_number: "", purchase_date: "2016-06-02", user: user_test, category: "Jouet", photo: "http://i2.kym-cdn.com/entries/icons/original/000/019/677/5Pikachu.png")
Product.create!(name: "Ecran TV", price: 539, description: "Ecran 4K", brand: "Samsung", ecommerce: "Materiel.net", tracking_number: "", purchase_date: "2016-07-11", user: user_test, category: "Hi-Tech", photo: "http://i2.kym-cdn.com/entries/icons/original/000/019/677/5Pikachu.png")
Product.create!(name: "Rideaux", price: 45, description: "Tissu rose", brand: "Habitat", ecommerce: "Habitat.com", tracking_number: "", purchase_date: "2016-08-23", user: user_test, category: "Maison", photo: "http://i2.kym-cdn.com/entries/icons/original/000/019/677/5Pikachu.png")
Product.create!(name: "Canapé", price: 888, description: "Cuir d'Italie", brand: "Habitat.com", ecommerce: "Habitat.com", tracking_number: "", purchase_date: "2016-08-23", user: user_test, category: "Maison", photo: "http://i2.kym-cdn.com/entries/icons/original/000/019/677/5Pikachu.png")

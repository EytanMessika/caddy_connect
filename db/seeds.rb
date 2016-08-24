# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Product.destroy_all

Product.create!(name: "Poele", price: "10", description: "poele a steak", brand: "Tefal", ecommerce: "Amazon", tracking_number: "1ZV4V414A600215239", purchase_date: "21-08-15", user_id: 6, photo: "http://i2.cdscdn.com/pdt2/2/7/3/1/700x700/ge506273/rw/tradifonte-poele-fonte-20-cm.jpg")
Product.create!(name: "Velo", price: "150", description: "Velo tout terrain", brand: "Giant", ecommerce: "Amazon", tracking_number: "LA007319522FR", purchase_date: "21-08-25", user_id: 6, photo: "http://www.velo-cycle-vtt.com/images/mtb-monster-xt.jpg")
Product.create!(name: "Chevalet", price: "111", description: "en Uranium", brand: "DESERRES", ecommerce: "Amazon", tracking_number: "CW015373485FR", purchase_date: "21-08-30", user_id: 6, photo: "http://www.deserres.ca/data/Products/Photos/FR/standard/Source/85132_1_GUSTAVE.jpg")
Product.create!(name: "Pokemon", price: "66", description: "Pikachu", brand: "Prout", ecommerce: "Amazon", tracking_number: "400962332", purchase_date: "21-08-05", user_id: 6, photo: "http://i2.kym-cdn.com/entries/icons/original/000/019/677/5Pikachu.png")


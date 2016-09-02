require 'facebook/messenger'

Facebook::Messenger.configure do |config|
  config.access_token = ENV['ACCESS_TOKEN']
  config.verify_token = ENV['VERIFY_TOKEN']
  config.app_secret = ENV['FACEBOOK_APP_KEY']
end

delivery_state = {
  "InTransit"=> "en cours de livraison",
  "Delivered"=> "livré",
  "Pending"=> "en attente",
  "" => "encore inconnu. Reviens vers moi bientôt. Je devrais en savoir plus."
}

FB_PAGE_ID = ENV['FB_PAGE_ID']

include Facebook::Messenger

Bot.on :message do |message|
  p message
  user = User.find_by(messenger_id: message.sender["id"])
  p message, user

  puts "Received #{message.text} from #{message.sender}"

  if message.sender["id"] != FB_PAGE_ID
    if user
      p "Sending..."
      case message.text.downcase
      when /hello/i, "yo", "bonjour", "hey", "hi", "salut"
        Bot.deliver(
          recipient: message.sender,
          message: {
            text: "Salut, que puis-je faire pour toi ?"
          }
        )
      when /non rien merci/i
        #New response
      else
        found_products = []
        words = message.text.split(" ")
        words.each do |word|
          found_products = user.products.where("name ~* ?", "\\y#{word}\\y")
          if !found_products.blank?
            Bot.deliver(
              recipient: message.sender,
              message: {
                text: "Ta #{found_products.first.name} est #{delivery_state[found_products.first.delivery_steps]}. Il arrivera lundi 5 Septembre 2016"
              }
            )
            break
          elsif
            case message.text.downcase
            when /merci/i, "jte remercie", "cool merci", "génial merci", "tu gères", "merci champion"
              Bot.deliver(
                recipient: message.sender,
                message: {
                  text: "De rien, mais remercie surtout les profs & les TA. Maxime,  Dimitri,  Julien,  Gab,  Edward,  Kevin,  Karine,  Thomas,  David,  Benjamin,  Antoine,  Claire,  Cécile,  Louis,  Boris,  Seb,  Romain. Mais aussi, Super-Gina et Edouard F !
                  Keep calm and keep on coding !"
                }
              )
            end
          end
        end
        # if found_products.blank?
        #   Bot.deliver(
        #     recipient: message.sender,
        #     message: {
        #       text: 'Désolé, ce produit est inexistant dans ma base de donnée'
        #     }
        #   )
        # end
      end
    end
  end
end

Bot.on :delivery do |delivery|
  puts "Delivered message(s) #{delivery.ids}"
end

Bot.on :optin do |optin|
  u = User.where(id: optin.messaging["optin"]["ref"]).first
  p "OPTIN: #{u.id}:#{u.email}"
  if u
    if u.messenger_id.blank?
      u.messenger_id = optin.messaging["sender"]["id"]
      u.save
    end
  end
end


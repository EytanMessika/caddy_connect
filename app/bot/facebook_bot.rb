require 'facebook/messenger'

Facebook::Messenger.configure do |config|
  config.access_token = ENV['ACCESS_TOKEN']
  config.verify_token = ENV['VERIFY_TOKEN']
  config.app_secret = ENV['FACEBOOK_APP_KEY']
end

FB_PAGE_ID = ENV['FB_PAGE_ID']

include Facebook::Messenger

Bot.on :message do |message|
  p message
  user = User.find_by(messenger_id: message.sender["id"])
  p message, user

  puts "Received #{message.text} from #{message.sender}"

  p user

  if message.sender["id"] != FB_PAGE_ID
    p "Sending..."
    case message.text
    when /hello/i
      Bot.deliver(
        recipient: message.sender,
        message: {
          text: "hello! De quel produit souhaites tu avoir le statut de livraison ?"
        }
      )
    when user.products.last
      text = 'le statut de votre livraison est : #{user.products.last.delivery_steps}'
      Bot.deliver(
      recipient: message.sender,
      message: {
        text: "le statut de votre livraison est : #{user.products.last.delivery_steps}"
      }
    )
    else
      Bot.deliver(
      recipient: message.sender,
      message: {
        text: 'Désolé, ce produit est inexistant dans ma base de donnée'
      }
    )
    end

  end
end

Bot.on :delivery do |delivery|
  puts "Delivered message(s) #{delivery.ids}"
end

Bot.on :optin do |optin|
  u = User.where(id: optin.messaging["optin"]["ref"]).first
  if u
    if u.messenger_id.blank?
      u.messenger_id = optin.messaging["sender"]["id"]
      u.save
    end
  end

end

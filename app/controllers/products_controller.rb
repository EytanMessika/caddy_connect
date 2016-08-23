class ProductsController < ApplicationController

  def index
    @products = Product.all

    client = GmailClient.new(current_user)
    p "----------------------------"
    mail = client.get_mail("156b27dc2b090088")
    pp client.get_body(mail)
  end

  def create
  end

  def new
  end

  def update
  end

  def edit
  end

end

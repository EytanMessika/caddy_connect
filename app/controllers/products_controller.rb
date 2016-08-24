class ProductsController < ApplicationController

  def index
    @products = Product.all

    # client = GmailClient.new(current_user)
    # p "----------------------------"
    # mail = client.get_mail("156b27dc2b090088")
    # pp client.get_body(mail)
    AftershipService.new(current_user).get_trackings(@products)

  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    AftershipService.new(current_user).create(@product)
    if @product.save
         redirect_to products_path(@product)
    else
      render 'new'
    end

    def status

    end
  end

  def new
  end

  def update
  end

  def edit
  end

end

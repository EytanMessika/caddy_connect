class ProductsController < ApplicationController
  before_action :set_product, only: [ :edit, :update]

  def index
    @products = current_user.products
    #//GMAIL SCRAPPING//
    # client = GmailClient.new(current_user)
    # p "----------------------------"
    # mail = client.get_mail("156b27dc2b090088")
    # pp client.get_body(mail)
    # ////////////
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    if @product.save
      redirect_to index_path
    else
      render "new"
    end
  end

  def new
    @product = Product.new
  end

  def update
    @product.update(product_params)
  end

  def edit
  end

  def stats
    @products = current_user.products
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :description, :brand, :ecommerce, :tracking_number, :purchase_date, :photo, :user_id)
  end
end

class ProductsController < ApplicationController
  before_action :set_product, only: [ :edit, :update]

  def index
    @products = current_user.products.order(created_at: :desc)
    # //GMAIL SCRAPPING//
    # client = GmailClient.new(current_user)
    # p "----------------------------"
    # mail = client.get_mail("156b27dc2b090088")
    # pp client.get_body(mail)
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    if @product.save
         redirect_to products_path(@product)
    else
      render 'new'
    end
  end

  def status
    if @product.save
      redirect_to index_path
    else
      render "new"
    end
  end

  def new
  end

  def update
    @product.assign_attributes(product_params)
    status = AftershipService.new(current_user).get_tracking_status(@product)
    @product.delivery_steps = status
    @product.save
    redirect_to :back
  end

  def edit
  end

  def graph
    
  end
  def stats
    if params[:interval] == 'week'
      @products = current_user.products.select { |product| product.purchase_date.cweek == Date.today.cweek }
    elsif params[:interval] == 'month'
      @products = current_user.products.select { |product| product.purchase_date.mon == Date.today.mon }
    elsif params[:interval] == 'year'
      @products = current_user.products.select { |product| product.purchase_date.cwyear == Date.today.cwyear }
    else
      @products = current_user.products
    end
    @products_by_category_hash = current_user.products.group_by(&:category)
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :price, :description, :brand, :ecommerce, :category, :tracking_number, :purchase_date, :photo, :user_id)
  end
end

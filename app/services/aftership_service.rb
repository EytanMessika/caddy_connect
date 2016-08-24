class AftershipService

  def initialize(user)
    @after_ship = AfterShip
    @after_ship.api_key = ENV['AFTERSHIP_API_KEY']
    @user = user

    # AfterShip::V4::Tracking.create('1ZA6F598D992381375', {:emails => ['a@abcd.com', 'asdfasdfs@gmail.com']})
    # AfterShip::V4::Tracking.get('ups', '1ZA6F598D992381375')
    # AfterShip::V4::Tracking.get_all
    # AfterShip::V4::Tracking.update('ups', '1ZA6F598D992381375', {:title => 'Testing'})
    # AfterShip::V4::Tracking.retrack('ups', '1ZA6F598D992381375')
    # AfterShip::V4::Tracking.delete('ups', '1ZA6F598D992381375')
  end

  def get_trackings(products)
    product_tracking_numbers = products.map {|p| p.tracking_number }.join(', ')
    AfterShip::V4::Tracking.get_all({keyword: @user.email})
    # AfterShip::V4::Tracking.get_all(emails=@user.email)
  end

  def create(product)
    AfterShip::V4::Tracking.create(product.tracking_number, {customer_name: @user.email})
  end

end

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

  def get_tracking_status(product)
    tracking_number = product.tracking_number
    trackings_infos = AfterShip::V4::Courier.detect(tracking_number: tracking_number)["data"]["couriers"]


    if trackings_infos.any?
      courier = trackings_infos.first["slug"]
      data = AfterShip::V4::Tracking.get(courier, tracking_number)["data"]
      if data.empty?
        "Unknown"
      else
        data["tracking"]["tag"]
      end
    else
      raise ArgumentError, "Tracking number is not correct could not find courier"
    end
  end
end

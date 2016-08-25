class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :delivery_status
  skip_before_action :authenticate_user!, only: :delivery_status

  def delivery_status
    tracking_number = params["msg"]["tracking_number"]
    courier = params["msg"]["slug"]
    # trackings = AfterShip::V4::Tracking.get(tracking_number)["data"]["trackings"]
    @product = Product.find_by(tracking_number: tracking_number)
    @product.update({ delivery_steps: params["msg"]["tag"] })

    render json: { type: "success" }, status: 200
  end
end

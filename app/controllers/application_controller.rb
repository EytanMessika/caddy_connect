class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  before_action :set_unread_notifications, if: :user_signed_in?

  private

  def set_unread_notifications
    @notifications = PublicActivity::Activity.where(recipient: current_user, read_at: nil)
  end
end

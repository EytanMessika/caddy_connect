class Product < ApplicationRecord
  include PgSearch
  pg_search_scope :search_product, against: [ :name, :category, :ecommerce ]
  belongs_to :user
  has_many :bookings

  include PublicActivity::Model
  tracked
end

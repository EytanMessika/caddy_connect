class Product < ApplicationRecord
  belongs_to :user
  include PublicActivity::Model
  tracked
end

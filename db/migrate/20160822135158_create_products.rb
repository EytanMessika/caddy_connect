class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :price
      t.string :description
      t.string :brand
      t.string :ecommerce
      t.string :tracking_number
      t.date   :purchase_date
      t.string :delivery_steps
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end

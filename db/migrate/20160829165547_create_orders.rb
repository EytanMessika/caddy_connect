class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :state
      t.string :user_sku
      t.monetize :amount
      t.json :payment

      t.timestamps
    end
  end
end

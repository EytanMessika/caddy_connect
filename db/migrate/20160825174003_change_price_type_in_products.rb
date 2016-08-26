class ChangePriceTypeInProducts < ActiveRecord::Migration[5.0]
  def change
    execute "ALTER TABLE products ALTER COLUMN price TYPE float USING price::double precision;"
  end
end

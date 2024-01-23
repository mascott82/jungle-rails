# db/migrate/xxxxxx_create_carts.rb
class CreateCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :carts do |t|
      # Add your cart table columns here
      t.timestamps
    end
  end
end
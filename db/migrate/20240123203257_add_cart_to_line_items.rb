class AddCartToLineItems < ActiveRecord::Migration[6.1]
  def change
    add_reference :line_items, :cart, index: true, foreign_key: true, null: true
  end
end

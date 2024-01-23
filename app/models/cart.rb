class Cart < ApplicationRecord
  has_many :line_items
  
  def empty?
    line_items.empty?
  end
end
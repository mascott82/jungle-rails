class LineItem < ApplicationRecord
  belongs_to :cart
  belongs_to :order
  belongs_to :product

  monetize :item_price_cents, numericality: true
  monetize :total_price_cents, numericality: true

  # Other attributes and validations
  # For example, you might have quantity and price attributes

  # Calculate and return the total amount for the line item
  def line_item_total
    quantity * price
    # Assuming you have a quantity attribute and a price attribute in your LineItem model
    # Adjust the calculation based on your specific attributes
  end

end

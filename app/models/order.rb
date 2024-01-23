class Order < ApplicationRecord
  
  belongs_to :user, optional: true

  has_many :line_items

  monetize :total_cents, numericality: true

  validates :stripe_charge_id, presence: true

  def total_amount
    line_items.sum(&:line_item_total)
  end
end

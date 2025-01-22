class Sale < ApplicationRecord
  belongs_to :car
  belongs_to :customer
  belongs_to :employee

  validates :sale_price, presence: true, numericality: { greater_than: 0 }
end

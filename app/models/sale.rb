class Sale < ApplicationRecord
  belongs_to :car
  belongs_to :customer
  belongs_to :employee

  validates :sale_price, numericality: { greater_than: 0 }
  validate :sale_price_greater_than_or_equal_to_car_price_minus_20000

  private

  def sale_price_greater_than_or_equal_to_car_price_minus_20000
    if car.present? && sale_price.to_f < (car.price.to_f - 20000)
      errors.add(:sale_price, "должна быть не меньше, чем цена машины минус 20000")
    end
  end
  end


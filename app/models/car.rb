class Car < ApplicationRecord
  has_many_attached :images  # Это добавляет возможность прикреплять несколько изображений
  validates :year, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1950, less_than_or_equal_to: 2025 }
  validates :price, presence: true, numericality: { greater_than: 0 }

end
class Car < ApplicationRecord
  has_many_attached :images  # Это добавляет возможность прикреплять несколько изображений
end
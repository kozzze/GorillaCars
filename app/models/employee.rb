class Employee < ApplicationRecord
  has_many :sales
  validates :salary, presence: true, numericality: { greater_than: 0 }
  validates :first_name, presence: true, format: { with: /\A[А-Яа-яЁё]+\z/, message: "может содержать только русские буквы" }
  validates :last_name, presence: true, format: { with: /\A[А-Яа-яЁё]+\z/, message: "может содержать только русские буквы" }
  end
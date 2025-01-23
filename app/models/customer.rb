class Customer < ApplicationRecord
  has_many :sales
  validates :phone, presence: true, format: { with: /\A8\d{10}\z/, message: "может содержать только 11 цифр" },  uniqueness: { message: ", Клиент с таким телефоном уже существует уже существует" }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "не является действительным email-адресом" }, uniqueness: { message: ", Клиент с такой электронной почтой уже существует" }
  validates :first_name, presence: true, format: { with: /\A[А-Яа-яЁё]+\z/, message: "может содержать только русские буквы" }
  validates :last_name, presence: true, format: { with: /\A[А-Яа-яЁё]+\z/, message: "может содержать только русские буквы" }
end

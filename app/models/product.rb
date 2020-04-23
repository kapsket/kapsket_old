class Product < ApplicationRecord
    has_many :users
    validates :name, presence: true
    validates :price, presence: true, numericality: { greater_than: 0 }
    validates :description, presence: true
    validates :stock, presence: true
end

class Cap < ApplicationRecord
    has_many :products
    validates :name, presence: true 
    validates :company, presence: true 
end

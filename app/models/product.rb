class Product < ApplicationRecord
  belongs_to :game
  belongs_to :product_type
  has_one :pokemon_products
end

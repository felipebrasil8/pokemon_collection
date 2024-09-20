class PokemonProduct < ApplicationRecord

  belongs_to :product, autosave: true

  def product
    super || build_product
  end

  delegate_associations to: :product
  delegate_attributes to: :product
end

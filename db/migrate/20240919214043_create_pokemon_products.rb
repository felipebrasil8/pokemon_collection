class CreatePokemonProducts < ActiveRecord::Migration[7.2]
  def change
    create_table :pokemon_products do |t|
      t.string :set_id
      t.string :serie
      t.string :expansion
      t.string :art_coin
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end

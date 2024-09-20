class CreateProducts < ActiveRecord::Migration[7.2]
  def change
    create_table :products do |t|
      t.string :name
      t.date :release_at
      t.string :art
      t.references :game, null: false, foreign_key: true
      t.references :product_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end

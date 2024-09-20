class CreateGames < ActiveRecord::Migration[7.2]
  def change
    create_table :games do |t|
      t.string :name
      t.text :description
      t.string :art
      t.string :site

      t.timestamps
    end
  end
end

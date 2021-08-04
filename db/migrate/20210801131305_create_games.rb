class CreateGames < ActiveRecord::Migration[6.1]
  def change
    create_table :games do |t|
      t.string :title
      t.string :image
      t.text :description
      t.integer :category_id

      t.timestamps
    end
  end
end

class CreateGifts < ActiveRecord::Migration[6.0]
  def change
    create_table :gifts do |t|
      t.references :house, null: false, foreign_key: true
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end

class CreateBottles < ActiveRecord::Migration[7.1]
  def change
    create_table :bottles do |t|
      t.string :name
      t.string :appellation
      t.string :type
      t.integer :vintage
      t.string :area
      t.string :variety
      t.text :notes
      t.references :slot, null: false, foreign_key: true

      t.timestamps
    end
  end
end

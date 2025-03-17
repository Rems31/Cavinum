class CreateCellars < ActiveRecord::Migration[7.1]
  def change
    create_table :cellars do |t|
      t.integer :height
      t.integer :width
      t.references :user, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end

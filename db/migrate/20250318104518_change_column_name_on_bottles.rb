class ChangeColumnNameOnBottles < ActiveRecord::Migration[7.1]
  def change
    rename_column :bottles, :type, :kind
  end
end

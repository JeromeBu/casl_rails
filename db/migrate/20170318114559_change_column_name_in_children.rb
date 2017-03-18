class ChangeColumnNameInChildren < ActiveRecord::Migration[5.0]
  def change
    rename_column :children, :class, :classe
  end
end

class RenameOrderToApplication < ActiveRecord::Migration
  def change
    rename_table :orders, :applications
  end
end

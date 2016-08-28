class RenameProductTable < ActiveRecord::Migration
  def up
    rename_table :products, :jobs
  end

  def down
    rename_table :jobs, :products
  end
end

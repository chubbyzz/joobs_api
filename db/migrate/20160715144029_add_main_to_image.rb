class AddMainToImage < ActiveRecord::Migration
  def change
    add_column :images, :main, :boolean, default: false
  end
end

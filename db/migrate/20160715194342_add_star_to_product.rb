class AddStarToProduct < ActiveRecord::Migration
  def change
    add_column :products, :star, :integer, default: 0
  end
end

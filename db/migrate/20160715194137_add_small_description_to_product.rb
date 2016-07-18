class AddSmallDescriptionToProduct < ActiveRecord::Migration
  def change
    add_column :products, :small_description, :string
  end
end

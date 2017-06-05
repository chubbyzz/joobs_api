class AddSourceFkToAddressTable < ActiveRecord::Migration
  def change
    add_column :addresses, :source_id, :integer, index: true
    add_column :addresses, :source_type, :string, index: true 
  end
end

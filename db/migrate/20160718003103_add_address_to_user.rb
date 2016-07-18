class AddAddressToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :zip_code
      t.string :address
      t.string :city
      t.string :state
      t.integer :number
    end
  end
end

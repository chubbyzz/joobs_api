class AddPolymorthToUser < ActiveRecord::Migration
  def change
    change_table :users do | t |
      t.integer :profile_id
      t.string :profile_type
    end

    add_index :users, [:profile_id, :profile_type]
  end
end

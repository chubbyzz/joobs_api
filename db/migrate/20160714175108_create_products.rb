class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.float :price

      t.timestamps null: false
    end
  end
end

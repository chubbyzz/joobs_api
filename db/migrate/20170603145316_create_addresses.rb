class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.references :city, index: true, foreign_key: true
      t.string :zipcode
      t.string :district
      t.string :street
      t.integer :number

      t.timestamps null: false
    end
  end
end

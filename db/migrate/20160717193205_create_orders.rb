class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :product, foreign_key: true, index: true
      t.references :user, foreign_key: true, index: true
      t.integer :quantity, :integer, default: 1
      t.timestamps null: false
    end
  end
end

class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :file, null: false
      t.integer :source_id, index: true
      t.string :source_type, index: true
      t.timestamps null: false
    end
  end
end

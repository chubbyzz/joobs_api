class CreateFlagSources < ActiveRecord::Migration
  def change
    create_table :flag_sources do |t|
      t.integer :source_id
      t.string :source_type
      t.integer :flag_id

      t.timestamps null: false
    end
  end
end

class CreateFlags < ActiveRecord::Migration
  def change
    create_table :flags do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end

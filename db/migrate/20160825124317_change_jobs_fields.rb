class ChangeJobsFields < ActiveRecord::Migration
  def change
    change_table :jobs do | t |
      t.remove :price
      t.remove :discount
      t.decimal :start_salary, precision: 8, scale: 2, null: true
      t.decimal :until_salary, precision: 8, scale: 2, null: true
    end
  end
end

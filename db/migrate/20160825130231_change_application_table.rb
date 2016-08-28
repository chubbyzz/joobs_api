class ChangeApplicationTable < ActiveRecord::Migration
  def change
    remove_columns :applications, :quantity, :integer
    add_reference :applications, :job, foreign_key: true, index: true
    remove_reference :applications, :product, foreign_key: true, index: true
  end
end

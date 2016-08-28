class RemoveColumnsFromUser < ActiveRecord::Migration
  def change
    remove_columns :users, :neighborhood, :number, :state, :city, :address, :zip_code
  end
end

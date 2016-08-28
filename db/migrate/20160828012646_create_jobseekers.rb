class CreateJobseekers < ActiveRecord::Migration
  def change
    create_table :jobseekers do |t|
      t.string :cv
      t.string :linkedin

      t.timestamps null: false
    end
  end
end

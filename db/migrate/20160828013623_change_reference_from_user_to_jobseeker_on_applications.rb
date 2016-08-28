class ChangeReferenceFromUserToJobseekerOnApplications < ActiveRecord::Migration
  def change
    remove_reference :applications, :user, index: true, foreign_key: true
    add_reference :applications, :jobseeker, index:true, foreign_key: true
  end
end

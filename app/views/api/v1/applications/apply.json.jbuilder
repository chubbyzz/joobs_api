if @application.valid?
    json.id @application.id
    json.job @application.job.name
    json.user @application.jobseeker.user , :name, :email
else
  json.errors @application.errors
end
json.name @job.name
json.array @job.applications do | application|
	json.id application.id
	json.name application.jobseeker.user.name
	json.linkedin application.jobseeker.linkedin
	json.status application.translated_status
	json.status_color application.colored_status
end 
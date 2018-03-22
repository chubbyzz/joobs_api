json.array! @jobs do |job|
	json.name job.name
	json.slug job.slug
	json.small_description job.small_description
	json.start_salary job.start_salary
	json.until_salary job.until_salary
	json.company job.company.user.name
   	json.city job.company.address.city.name
   	json.state job.company.address.city.state.acronym
end
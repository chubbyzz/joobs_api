json.array! @applications do |application|
  json.id application.id
  json.name application.job.name
  json.company application.job.company.user.name
  json.status application.translated_status
  json.status_color application.colored_status
end
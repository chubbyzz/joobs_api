json.array! @jobs do |job|
  json.id job.id
  json.name job.name
  json.slug job.slug
  json.quantity job.jobseekers.count
end
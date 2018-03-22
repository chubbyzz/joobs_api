if @job.valid?
    json.msg "Salvo com sucesso"
    json.company @job.company.name
    json.name @job.name
else
  json.errors(@job.errors.full_messages)
end

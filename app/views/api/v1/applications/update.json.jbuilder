if @application.valid?
  json.sucess true
  json.msg "Alterado com sucesso"
else
  json.errors(@application.errors.full_messages)
end

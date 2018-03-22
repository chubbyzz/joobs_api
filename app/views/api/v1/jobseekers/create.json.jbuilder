if @user.valid?
    json.name @user.name
    json.email @user.email
else
  json.errors(@user.errors.full_messages + @user.profile.errors.full_messages)
end

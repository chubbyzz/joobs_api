if @valid
    json.name @user.profile.name
    json.email @user.email
else
  json.errors(@user.errors.full_messages + @company.errors.full_messages + @address.errors.full_messages)
end

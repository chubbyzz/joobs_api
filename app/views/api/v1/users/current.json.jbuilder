if @user.nil?
  json.error 'no current user found'
else
  json.name @user.name
  json.email @user.email
  json.type @user.profile_type
end
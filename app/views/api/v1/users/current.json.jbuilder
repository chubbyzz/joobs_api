if @user.nil?
  json.error 'no current user found'
else
  json.(@user, :name, :email)
end
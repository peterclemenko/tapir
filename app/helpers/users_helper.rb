module UsersHelper


  def tapir_users_path(users=nil)
    "/users"
  end

  def tapir_user_path(user=nil)
    "/users/#{user._id}"
  end

end

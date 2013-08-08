module UsersHelper

  # TODO - not sure wtf is going on here. 
  # could be a bug in devise, but most likely 
  # just a misconfiguration.
  def edit_user_registration_path(resource=nil)
    "/user/#{current_user.id}/edit"
  end

end

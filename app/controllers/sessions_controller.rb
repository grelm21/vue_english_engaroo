class SessionsController < Devise::SessionsController

  def after_sign_in_path_for(resource)
    if current_user.profile.present?
      super
    else
      new_user_profile_path(current_user)
    end
  end

  def stored_location_for(resource)
    if current_user.profile.present?
      super
    else
      nil
    end
  end
end

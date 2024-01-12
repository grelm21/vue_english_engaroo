class RegistrationsController < Devise::RegistrationsController

  def after_sign_up_path_for(resource)
    if current_user.profile.present?
      super
    else
      new_user_profile_path(current_user)
    end
  end
end

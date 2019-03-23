class ApplicationController < ActionController::Base

  before_action :store_user_location!, if: :storable_location?
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname,:email])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:nickname])
    devise_parameter_sanitizer.permit(:account_update, keys: [:nickname,:email])
  end


  def after_sign_in_path_for(resources)
    top_path(current_user)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def storable_location?
    request.get? && is_navigational_format? && !devise_controller? && !request.xhr? 
  end

  def store_user_location!
    store_location_for(:user, request.fullpath)
  end

    # def after_sign_in_path_for(resource_or_scope)
    #   stored_location_for(resource_or_scope) || super
    # end
end
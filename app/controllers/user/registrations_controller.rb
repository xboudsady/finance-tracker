class User::RegistrationsController < Devise::RegistrationsController       # Inherits from Devise Class, looks at User Class first, then fallback to parent Devise Class
    before_action :configure_permitted_parameters

    protected

    def configure_permitted_parameters                                                          # All first_name and last_name to be allowed to be included, for sign_up and edit
       devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])             # Locate the object, update the keys
       devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])      # For account edit
    end
end
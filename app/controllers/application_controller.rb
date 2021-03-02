class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      root_path          #pathは設定したい遷移先へのpathを指定してください
    when Customer
      public_root_path             #ここもpathはご自由に変更してください
    end
  end

  
  def after_sign_out_path_for(resource)
      if resource == :admin
      new_admin_session_path
      else
      public_root_path
      end
  end

  def configure_permitted_parameters
    added_attrs = [ :last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
  end

end

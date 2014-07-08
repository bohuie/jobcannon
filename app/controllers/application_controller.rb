class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :set_last_seen_at, if: proc { |p| user_signed_in? }
  before_filter :log_page_view, if: proc { |p| user_signed_in? }

  before_action :set_user

  def set_user
    @user = current_user
  end

  def home
    @user = current_user
    current_user.online = true
    current_user.save
  end

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) do |u|
        u.permit :username, :email, :password, :password_confirmation, :fname, :lname, :user_id, 
        :employee, :employer, :phone_number, :city, :province,  :gender,
        :country, :birthday, :goals, :company_name, :company_address, :field, :uid, :provider, :online
      end
      devise_parameter_sanitizer.for(:account_update) do |u|
        u.permit :current_password, :username, :email, :password, :password_confirmation, :fname, :lname, :user_id, 
        :employee, :employer, :phone_number, :city, :province,  :gender,
        :country, :birthday, :goals, :company_name, :company_address, :field, :online
      end

    end


  
   private
  def set_last_seen_at
    current_user.update_attribute(:last_seen_at, Time.now)
  end

  def log_page_view
    if !PageView.where(user_id: current_user.id).first().nil?
      if (!(PageView.where(user_id: current_user.id).order(created_at: :desc).first().request_url == request.original_url)&& request.fullpath != "/")
        @pageView = PageView.new
        @pageView.update_attribute(:user_id, current_user.id)
        @pageView.update_attribute(:request_url, request.original_url)
        @pageView.update_attribute(:ip_address, current_user.current_sign_in_ip)
        @pageView.update_attribute(:created_at, Time.now)
      end
    else
      @pageView = PageView.new
      @pageView.update_attribute(:user_id, current_user.id)
      @pageView.update_attribute(:request_url, request.original_url)
      @pageView.update_attribute(:ip_address, current_user.current_sign_in_ip)
      @pageView.update_attribute(:created_at, Time.now)
    end
  end
  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    current_user.online = false
    current_user.save
    root_path
  end
end
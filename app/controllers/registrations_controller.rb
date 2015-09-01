class RegistrationsController < Devise::RegistrationsController


	def create
      if params[:provider].nil?
  		  super
      end
  		#session[:omniauth] = nil unless @user.new_record? 
	end

  	private
  	def build_resource(*args)
    	super
    	if session[:omniauth]
      		@user.apply_omniauth(session[:omniauth])
      		@user.valid?
    	end
  	end
end
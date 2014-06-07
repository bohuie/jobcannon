class Survey::Tech::EmailFluentciesController < ApplicationController

def update
	@user = current_user
	@email = EmailFluentcy.find_by(:user_id=>@user.user_id)
	@email.update_attributes(email_params)
	
	respond_to do |f|		
		 f.js 
	end
end

	private

	def email_params
		params.require(:email_fluentcy).permit(:outlook, :mail, :impress, :magnitude_other, :other)
	end

end
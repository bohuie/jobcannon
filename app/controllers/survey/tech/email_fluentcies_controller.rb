class Survey::Tech::EmailFluentciesController < ApplicationController

def update
	@user = current_user
	@email = EmailFluentcy.find_by(:user_id=>@user.user_id)
	@email.update_attributes(email_params)
	redirect_to survey_path(@user,:type=> 3,:tech=>0,:word=>0)
end

	private

	def email_params
		params.require(:email_skill).permit(:outlook, :mail, :impress, :magnitude_other, :other)
	end

end
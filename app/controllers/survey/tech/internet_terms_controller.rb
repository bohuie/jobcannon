class Survey::Tech::InternetTermsController < ApplicationController

def update
	@user = current_user
	@internetterm = InternetTerm.find_by(:user_id=>@user.user_id)
	@internetterm.update_attributes(internetterm_params)
	redirect_to survey_path(@user,:type=> 3,:tech=>0,:word=>0)
end

	private

	def internetterm_params
		params.require(:email_skill).permit(:q1,:q2,:q3,:q4,:q5,:q6,:q7)
	end

end
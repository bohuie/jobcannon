class Survey::Tech::BrowsersController < ApplicationController

def update
	@user = current_user
	@browser = Browser.find_by(:user_id=>@user.user_id)
	@browser.update_attributes(browser_params)
	redirect_to survey_path(@user,:type=> 3,:tech=>0, :word => 0)
end

	private

	def browser_params
		params.require(:online_colab_fluentcy).permit(:q1,:q2,:q3,:q4,:q5,
			:magnitude_other,:other)
	end

end
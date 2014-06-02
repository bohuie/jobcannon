class Survey::Tech::TechnologyDifferencesController < ApplicationController

def update
	@user = current_user
	@td = TechnologyDifference.find_by(:user_id=>@user.user_id)
	@td.update_attributes(diff_params)
	redirect_to survey_path(@user,:type=> 3,:tech=>0)
end

	private

	def diff_params
		params.require(:technology_difference).permit(:q1,:q2,:q3)
	end
end
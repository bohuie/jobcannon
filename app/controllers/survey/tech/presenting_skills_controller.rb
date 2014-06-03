class Survey::Tech::PresentingSkillsController < ApplicationController

def update
	@user = current_user
	@present = PresentingSkill.find_by(:user_id=>@user.user_id)
	@present.update_attributes(present_params)
	redirect_to survey_path(@user,:type=> 3,:pres=>1)
end

	private

	def present_params
		params.require(:presenting_skill).permit(:q1,:q2,:q3,:q4,:q5,:q6,:q7,:q8,:q9,:q10,:q11,:q12,:q13,:q14,:q15,
			:q16,:q17)
	end

end
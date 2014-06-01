class ThinkingSkillsController < ApplicationController

def update
	
	@user = current_user
	@com = ThinkingSkill.find_by(:user_id=>@user.user_id)
	@com.update_attributes(thinking_params)		
	redirect_to survey_path(@user,:type=> 1)
end

	private

	def thinking_params
		params.require(:thinking_skill).permit(:q1,:q2,:q3,:q4,:q5,:q6,:q7,:q8)
	end

end
class Survey::Personality::InterpersonalSkillsController < ApplicationController

def update
	
	@user = current_user
	@com = InterpersonalSkill.find_by(:user_id=>@user.user_id)
	@com.update_attributes(interpersonal_params)		
	redirect_to survey_path(@user,:type=> 1)
end

	private

	def interpersonal_params
		params.require(:interpersonal_skill).permit(:q1,:q2,:q3,:q4,:q5,:q6)
	end

end
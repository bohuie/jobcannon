class Survey::Personality::InterpersonalSkillsController < ApplicationController

def update
	
	@user = current_user
	@com = InterpersonalSkill.find_by(:user_id=>@user.user_id)
	@com.update_attributes(interpersonal_params)
	respond_to do |f|
		f.js
	end			
end

	private

	def interpersonal_params
		params.require(:interpersonal_skill).permit(:q1,:q2,:q3,:q4,:q5,:q6, :user_id)
	end

end
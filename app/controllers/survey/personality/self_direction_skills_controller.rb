class Survey::Personality::SelfDirectionSkillsController < ApplicationController

def update
	
	@user = current_user
	@com = SelfDirectionSkill.find_by(:user_id=>@user.user_id)
	@com.update_attributes(self_params)		
	respond_to do |f|
		f.js
	end
end

	private

	def self_params
		params.require(:self_direction_skill).permit(:q1,:q2,:q3,:q4,:q5,:q6,:q7,:q8,:q9,:q10,:q11, :user_id)
	end

end
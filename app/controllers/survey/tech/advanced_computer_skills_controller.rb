class Survey::Tech::AdvancedComputerSkillsController < ApplicationController

def update
	@user = current_user
	@advanced = AdvancedComputerSkill.find_by(:user_id=>@user.user_id)
	@advanced.update_attributes(advanced_params)
	respond_to do |f|		
		 f.js
	end
end

	private

	def advanced_params
		params.require(:advanced_computer_skill).permit(:q1,:q2,:q3,:q4,:q5,:q6)
	end

end
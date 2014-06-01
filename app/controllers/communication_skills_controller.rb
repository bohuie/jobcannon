class CommunicationSkillsController < ApplicationController

def update
	
	@user = current_user
	@com = CommunicationSkill.find_by(:user_id=>@user.user_id)
	@com.update_attributes(communication_params)		
	redirect_to survey_path(@user,:type=> 1)
end

	private

	def communication_params
		params.require(:communication_skill).permit(:q1,:q2,:q3,:q4,:q5,:q6,:q7,:q8,:q9,:q10,:q11)
	end

end
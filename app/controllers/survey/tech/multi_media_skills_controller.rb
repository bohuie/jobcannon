class Survey::Tech::MultiMediaSkillsController < ApplicationController

def update
	@user = current_user
	@media = MultiMediaSkill.find_by(:user_id=>@user.user_id)
	@media.update_attributes(media_params)
	redirect_to survey_path(@user,:type=> 3,:tech=>0)
end

	private

	def media_params
		params.require(:multi_media_skill).permit(:q1,:q2,:q3,:q4,:q5)
	end

end
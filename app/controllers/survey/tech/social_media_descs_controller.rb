class Survey::Tech::SocialMediaDescsController < ApplicationController

def update
	@user = current_user
	@socialmediadesc = SocialMediaDesc.find_by(:user_id=>@user.user_id)
	@socialmediadesc.update_attributes(social_params)
	redirect_to survey_path(@user,:type=>, :social=>0)
end

	private

	def social_params
		params.require(:social_media_desc).permit(:q1,:q2,:q3,:q4,:q5)
	end

end
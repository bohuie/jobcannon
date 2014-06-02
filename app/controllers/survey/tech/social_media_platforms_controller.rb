class Survey::Tech::SocialMediaPlatformsController < ApplicationController

def update
	@user = current_user
	@socialmediaplat = SocialMediaPlatform.find_by(:user_id=>@user.user_id)
	@socialmediaplat.update_attributes(social_params)
	redirect_to survey_path(@user,:type=> 3,:tech=>0, :word => 0)
end

	private

	def social_params
		params.require(:social_media_platform).permit(:q1,:q2,:q3,:q4,:q5,:q6,:q7,:q8,:magnitude_other,:other)
	end

end
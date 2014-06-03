class Survey::Tech::SocialMediaPlatformsController < ApplicationController

def update
	@user = current_user
	@socialmediaplat = SocialMediaPlatform.find_by(:user_id=>@user.user_id)
	@socialmediaplat.update_attributes(social_params)
	redirect_to survey_path(@user,:type=> 3,:tech=>0, :word => 0)
end

	private

	def social_params
		params.require(:social_media_platform).permit(:q1a,:q1b,:q1c,:q1d,
													  :q2a,:q2b,:q2c,:q2d,
													  :q3a,:q3b,:q3c,:q3d,
													  :q4a,:q4b,:q4c,:q4d,
													  :q5a,:q5b,:q5c,:q5d,
													  :q6a,:q6b,:q6c,:q6d,
													  :q7a,:q7b,:q7c,:q7d,
													  :q8a,:q8b,:q8c,:q8d,
													  :magnitude_othera,:magnitude_other, :magnitude_otherc, :magnitude_otherd,
													  :other)
	end

end
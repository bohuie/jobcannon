class Survey::Tech::SocialMediaDescsController < ApplicationController

def update
	@user = current_user
	@socialmediadesc = SocialMediaDesc.find_by(:user_id=>@user.user_id)
	@socialmediadesc.update_attributes(social_params)
	
	respond_to do |f|		
		 f.js { render 'shared/ajax/social_media_b.js.erb' }
	end
end

	private

	def social_params
		params.require(:social_media_desc).permit(:q1,:q2,:q3,:q4,:q5)
	end

end
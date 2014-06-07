class Survey::Tech::SocialMediaSkillsController < ApplicationController

def update
	@user = current_user
	@socialmedia = SocialMediaSkill.find_by(:user_id=>@user.user_id)
	@socialmedia.update_attributes(social_params)
	
	respond_to do |f|		
		 f.js { render 'shared/ajax/social_media_a.js.erb' }
	end
end

	private

	def social_params
		params.require(:social_media_skill).permit(:q1,:q2,:q3,:q4,:q5,:q6,:q7,:q8,:q9,:q10,:q11,:q12,:q13,:q14,:q15,
			:q16,:q17,:q18,:q19,:q20,:q21,:q22,:q23)
	end

end
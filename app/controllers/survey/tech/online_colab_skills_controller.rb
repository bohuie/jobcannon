class Survey::Tech::OnlineColabSkillsController < ApplicationController

def update
	@user = current_user
	@onlinecolab = OnlineColabSkill.find_by(:user_id=>@user.user_id)
	@onlinecolab.update_attributes(online_params)
	
	respond_to do |f|		
		 f.js { render 'shared/ajax/online_a.js.erb' }
	end
end

	private

	def online_params
		params.require(:online_colab_skill).permit(:q1,:q2,:q3,:q4,:q5,:q6,:q7,:q8)
	end

end
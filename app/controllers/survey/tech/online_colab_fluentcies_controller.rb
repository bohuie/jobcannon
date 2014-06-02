class Survey::Tech::OnlineColabSkillsController < ApplicationController

def update
	@user = current_user
	@onlinecolab_fluentcy = OnlineColabFluentcy.find_by(:user_id=>@user.user_id)
	@onlinecolab_fluentcy.update_attributes(online_params)
	redirect_to survey_path(@user,:type=> 3,:tech=>0, :word => 0)
end

	private

	def online_params
		params.require(:online_colab_fluentcy).permit(:q1,:q2,:q3,:q4,:q5,:q6,:q7,:q8,:q9,:q10,:q11,:q12,
			:magnitude_other,:other)
	end

end
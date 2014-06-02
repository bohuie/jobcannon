class Survey::Tech::InternetTasksController < ApplicationController

def update
	@user = current_user
	@internettask = InternetTask.find_by(:user_id=>@user.user_id)
	@internettask.update_attributes(internettask_params)
	redirect_to survey_path(@user,:type=> 3,:tech=>0,:word=>0)
end

	private

	def internettask_params
		params.require(:internet_task).permit(:q1,:q2,:q3,:q4,:q5,:q6,:q7)
	end

end
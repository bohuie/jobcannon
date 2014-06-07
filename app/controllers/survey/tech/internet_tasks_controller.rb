class Survey::Tech::InternetTasksController < ApplicationController

def update
	@user = current_user
	@internettask = InternetTask.find_by(:user_id=>@user.user_id)
	@internettask.update_attributes(internettask_params)
	
	respond_to do |f|		
		 f.js { render 'shared/ajax/internet_b.js.erb' }
	end
end

	private

	def internettask_params
		params.require(:internet_task).permit(:q1,:q2,:q3,:q4,:q5,:q6,:q7,:q8,:q9,:q10,:q11,:q12,:q13,:q14,:q15,
			:q16,:q17)
	end

end
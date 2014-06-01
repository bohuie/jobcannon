class AccountabilitiesController < ApplicationController

def update
	
	@user = current_user
	@com = Accountability.find_by(:user_id=>@user.user_id)
	@com.update_attributes(accountability_params)		
	redirect_to survey_path(@user,:type=> 1)
end

	private

	def accountability_params
		params.require(:accountability).permit(:q1,:q2,:q3,:q4,:q5,:q6)
	end

end
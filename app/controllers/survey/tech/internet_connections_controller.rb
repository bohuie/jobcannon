class Survey::Tech::InternetConnectionsController < ApplicationController

def update
	@user = current_user
	@internetconnection = InternetConnection.find_by(:user_id=>@user.user_id)
	@internetconnection.update_attributes(internetconnection_params)
	redirect_to survey_path(@user,:type=> 3,:internet=>3)
end

	private

	def internetconnection_params
		params.require(:internet_connection).permit(:q1,:q1a,:q1b,:q1c,:q2,:q2a,:q2b,:q2c,
			:q3,:q3a,:q3b,:q3c,:q4,:q4a,:q4b,:q4c,)
	end

end
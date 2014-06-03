class Survey::Tech::InternetConnectionsController < ApplicationController

def update
	@user = current_user
	@internetconnection = InternetConnection.find_by(:user_id=>@user.user_id)
	@internetconnection.update_attributes(internetconnection_params)
	redirect_to survey_path(@user,:type=> 3,:internet=>3)
end

	private

	def internetconnection_params
		params.require(:internet_connection).permit(:q1,:q2,:q3,:q4)
	end

end
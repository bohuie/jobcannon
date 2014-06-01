class OperatingSystemsUsagesController < ApplicationController

def update
	
	@user = current_user
	@osu = OperatingSystemsUsage.find_by(:user_id=>@user.user_id)
	@osu.update_attributes(os_params)
	redirect_to survey_path(@user,:type=> 3,:tech=>1)
end

	private

	def os_params
		params.require(:operating_systems_usage).permit(:windows,:mac,:linux,:other)
	end

end
class Survey::Tech::OperatingSystemsFluentsController < ApplicationController

def update
	@user = current_user
	@osf = OperatingSystemsFluent.find_by(:user_id=>@user.user_id)
	@osf.update_attributes(os_params)
	redirect_to survey_path(@user,:type=> 3,:tech=>1)
end

	private

	def os_params
		params.require(:operating_systems_fluent).permit(:windows,:mac,:linux,:other,:magnitude_other)
	end

end
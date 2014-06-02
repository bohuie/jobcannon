class Survey::Tech::PresentingFluentciesController < ApplicationController

def update
	@user = current_user
	@present = PresentingFluentcy.find_by(:user_id=>@user.user_id)
	@present.update_attributes(present_params)
	redirect_to survey_path(@user,:type=> 3,:tech=>0,:word=>0)
end

	private

	def present_params
		params.require(:presenting_fluentcy).permit(:powerpoint, :keynote, :impress, :prezi, :magnitude_other, :other)
	end

end
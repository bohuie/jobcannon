class Survey::Tech::PresentingFluentciesController < ApplicationController

def update
	@user = current_user
	@present_fluentcy = PresentingFluentcy.find_by(:user_id=>@user.user_id)
	@present_fluentcy.update_attributes(present_params)
	redirect_to survey_path(@user,:type=> 3)
end

	private

	def present_params
		params.require(:presenting_fluentcy).permit(:powerpoint, :keynote, :impress, :prezi, :magnitude_other, :other)
	end

end
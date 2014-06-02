class Survey::Tech::SpreadsheetFluentciesController < ApplicationController

def update
	
	@user = current_user
	@spreadsheet = SpreadsheetFluentcy.find_by(:user_id=>@user.user_id)
	@spreadsheet.update_attributes(spreadsheet_params)
	redirect_to survey_path(@user,:type=> 3,:tech=>0,:word=>0)
end

	private

	def spreadsheet_params
		params.require(:spreadsheet_fluentcy).permit(:excel,:numbers,:calc,:magnitude_other,:other)
			
	end

end
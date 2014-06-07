class Survey::Tech::SpreadsheetFluentciesController < ApplicationController

def update
	
	@user = current_user
	@spreadsheet = SpreadsheetFluentcy.find_by(:user_id=>@user.user_id)
	@spreadsheet.update_attributes(spreadsheet_params)
	
	respond_to do |f|		
		 f.js 
	end
end

	private

	def spreadsheet_params
		params.require(:spreadsheet_fluentcy).permit(:excel,:numbers,:calc,:magnitude_other,:other)
			
	end

end
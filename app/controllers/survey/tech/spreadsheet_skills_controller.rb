class Survey::Tech::SpreadsheetSkillsController < ApplicationController

def update
	
	@user = current_user
	@spreadsheet = SpreadsheetSkill.find_by(:user_id=>@user.user_id)
	@spreadsheet.update_attributes(spreadsheet_params)		#breaks, dunno why
	redirect_to survey_path(@user,:type=> 3,:word=>1);
end

	private

	def spreadsheet_params
		params.require(:spreadsheet_skill).permit(:q1,:q2,:q3,:q4,:q5,:q6,:q7,:q8,:q9,:q10,:q11,:q12,:q13,:q14,:q15)
			
	end

end
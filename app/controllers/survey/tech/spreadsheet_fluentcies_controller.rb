class Survey::Tech::SpreadsheetFluentciesController < ApplicationController

def update
	
	@user = current_user
	@spreadsheet = SpreadsheetFluentcy.find_by(:user_id=>@user.user_id)
	@spreadsheet.update_attributes(spreadsheet_params)
	spreadsheet_progression()
	
	respond_to do |f|		
		 f.js 
	end
end

	private

	def spreadsheet_params
		params.require(:spreadsheet_fluency).permit(:excel,:numbers,:calc,:magnitude_other,:other)
			
	end

	def spreadsheet_progression
	    @spreadsheet_progress = -6
	    @total_spreadsheet_questions = 18

	    @DBprogress = Progress.find_by(:user_id=> @user.user_id)
	    @spreadsheet = SpreadsheetSkill.find_by(:user_id=> @user.user_id)
	    @spreadsheet_fluent = SpreadsheetFluentcy.find_by(:user_id=> @user.user_id)

	    if @spreadsheet.nil?
	      @spreadsheet_progress = 0
	    else
	      @spreadsheet.attributes.each do |attr_name, attr_value|
	        if attr_value != 0
	          @spreadsheet_progress += 1
	        end
	      end

	      @spreadsheet_fluent.attributes.each do |attr_name, attr_value|
	        if (attr_value != 0 && attr_name != "other" && attr_name != "magnitude_other")
	          @spreadsheet_progress += 1
	        end
	      end
	    end

	    @spreadsheet_progress = (@spreadsheet_progress*100)/@total_spreadsheet_questions
	    @DBprogress.spreadsheet_progress = @spreadsheet_progress
	    @DBprogress.save
  end 

end
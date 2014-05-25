class SurveyprofilesController < ApplicationController

	def update	
		@user = current_user
		@survey = Surveyprofile.find_by(:user_id => @user.user_id)	
		@survey.update_attributes(survey_params)
		@survey.user_id = current_user.user_id
		@survey.save
		respond_to do |f|
			f.html {redirect_to root_path}
			f.js 
		end
		
	end


	private
    
    def survey_params
        params.require(:surveyprofile).permit(:postalcode,:gender, :birthday, :province, :city, :education)
    end

end
class Survey::Profile::SurveyprofilesController < ApplicationController

	def update	
		@user = current_user
		@survey = Surveyprofile.find_by(:user_id => @user.user_id)	
		@survey.user_id = current_user.user_id
    puts "saving data"

		if @survey.update_attributes(survey_params)
		  profile_progression()		       
    else
      #the below two lines do not display a message. broken
      flash[:error] = "You must enter a date up from 12 years ago or more"
      puts "error should be shown"      
    end

    respond_to do |f|        
         f.js
    end 

	end
	private
    
    def survey_params
        params.require(:surveyprofile).permit(:postalcode,:gender, :birthday, :province, :city, :education)
    end

    def profile_progression
      @profile_progress = -3
      @total_profile_questions = 7

      @DBprogress = Progress.find_by(:user_id=> @user.user_id)       
      @pp = Surveyprofile.find_by(:user_id => @user.user_id)      
      @lp = Language.find_by(:user_id => @user.user_id)      
      @local_counter = -3

      if (@pp.nil?)        
        @profile_progress = 0
      else          
        @pp.attributes.each do |attr_name, attr_value|
          if !(attr_value.nil? || attr_value == "") 
            @profile_progress += 1 
          end
        end

        @lp.attributes.each do |attr_name, attr_value|
          if (attr_value != false && !attr_value.nil?) 
            @local_counter += 1 
          end
        end

        if @local_counter > 0
          @profile_progress += 1
        end
      end
      @profile_progress = (@profile_progress*100/@total_profile_questions)
      @DBprogress.profile_progress = @profile_progress
      @DBprogress.save
  end

end
class Survey::Tech::BrowsersController < ApplicationController

def update
	@user = current_user
	@browser = Browser.find_by(:user_id=>@user.user_id)
	@browser.update_attributes(browser_params)
	internet_progression()
	
	respond_to do |f|		
		 f.js
	end
end

	private

	def browser_params
		params.require(:browser).permit(:q1,:q2,:q3,:q4,:q5,
			:magnitude_other,:other)
	end

	def internet_progression

		@internet_progress = -12
	    @total_internet_questions = 33

	    @DBprogress = Progress.find_by(:user_id=> @user.user_id)
	    @internetterm = InternetTerm.find_by(:user_id=> @user.user_id)
	    @internettask = InternetTask.find_by(:user_id=> @user.user_id)
	    @internetconnection = InternetConnection.find_by(:user_id=> @user.user_id)
	    @browser = Browser.find_by(:user_id=> @user.user_id)

	    if @internetterm.nil?
	      @internet_progress = 0
	    else
	      @internetterm.attributes.each do |attr_name, attr_value|
	        if (attr_value != 0)
	          @internet_progress += 1
	        end
	      end
	      
	      @internettask.attributes.each do |attr_name, attr_value|
	      	if (attr_value !=0)
	      		@internet_progress += 1
	      	end
	      end

	      @internetconnection.attributes.each do |attr_name, attr_value|
	      	if (attr_value !=0 && attr_value != true && attr_value != false && attr_value != nil)
	      		@internet_progress += 1
	      	end
	      end

	      @browser.attributes.each do |attr_name, attr_value|
	      	if (attr_value !=0 && attr_name != "magnitude_other" && attr_name != "other")
	      		@internet_progress += 1
	      	end
	      end
	    end	    

	    @internet_progress =(@internet_progress*100)/@total_internet_questions
		@DBprogress.internet_progress = @internet_progress
		@DBprogress.save
	end	

end
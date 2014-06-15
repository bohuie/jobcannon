class Survey::Tech::InternetTasksController < ApplicationController

def update
	@user = current_user
	@internettask = InternetTask.find_by(:user_id=>@user.user_id)
	@internettask.update_attributes(internettask_params)
	internet_progression()
	
	respond_to do |f|		
		 f.js { render 'shared/ajax/internet_b.js.erb' }
	end
end

	private

	def internettask_params
		params.require(:internet_task).permit(:q1,:q2,:q3,:q4,:q5,:q6,:q7,:q8,:q9,:q10,:q11,:q12,:q13,:q14,:q15,
			:q16,:q17)
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
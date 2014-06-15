class Survey::Tech::InternetConnectionsController < ApplicationController

def update
	@user = current_user
	@internetconnection = InternetConnection.find_by(:user_id=>@user.user_id)
	@internetconnection.update_attributes(internetconnection_params)
	internet_progression()
	
	respond_to do |f|		
		 f.js { render 'shared/ajax/internet_c.js.erb' }
	end
end

	private

	def internetconnection_params
		params.require(:internet_connection).permit(:q1,:q1a,:q1b,:q1c,:q2,:q2a,:q2b,:q2c,
			:q3,:q3a,:q3b,:q3c,:q4,:q4a,:q4b,:q4c,)
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
class Survey::Tech::OperatingSystemsFluentsController < ApplicationController

def update
	@user = current_user
	@osf = OperatingSystemsFluent.find_by(:user_id=>@user.user_id)
	@osf.update_attributes(os_params)
	basic_computer_progression()

	respond_to do |f|		
		 f.js
	end
end

	private

	def os_params
		params.require(:operating_systems_fluent).permit(:windows,:mac,:linux,:other,:magnitude_other)
	end

	def basic_computer_progression
	    @basic_progress = -9
	    @total_basic_questions = 28

	    @DBprogress = Progress.find_by(:user_id=> @user.user_id)       
	    @basic = BasicComputerSkill.find_by(:user_id=>@user.user_id)
	    @os = OperatingSystemsUsage.find_by(:user_id=> @user.user_id)
	    @fluent = OperatingSystemsFluent.find_by(:user_id=> @user.user_id) 

	    if @basic.nil?
	      @basic_progress = 0
	    else
	      @basic.attributes.each do |attr_name, attr_value|
	        if (attr_value != 0)
	            @basic_progress += 1
	        end
	      end

	      @os.attributes.each do |attr_name, attr_value|
	        if (attr_value != 0 && attr_value != nil && attr_value != "" && attr_name != "magnitude_other" && attr_name != "other")
	        	
	            @basic_progress += 1
	        end
	      end

	      @fluent.attributes.each do |attr_name, attr_value|
	        if (attr_value != 0 && attr_value != nil && attr_value != "" && attr_name != "magnitude_other" && attr_name != "other")
	        	
	            @basic_progress += 1
	        end
	      end
	    end

	    @basic_progess = (@basic_progress*100)/@total_basic_questions
	    @DBprogress.basic_progress = @basic_progess
	    @DBprogress.save
  end
end
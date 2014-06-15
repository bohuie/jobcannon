class Survey::Tech::BasicComputerSkillsController < ApplicationController

def update
	
	@user = current_user
	@basic = BasicComputerSkill.find_by(:user_id=>@user.user_id)
	@basic.update_attributes(basic_params)
	basic_computer_progression()

	respond_to do |f|		
		 f.js { render 'shared/ajax/basic_computer_a.js.erb' }
	end
end

def show
	@id = params[:div]
	@file = params[:file]
	puts "THIS IS THE SHOW METHOD IN THE BASIC CONTROLLER"
	puts @id
	render 'shared/ajax/previous.js.erb'
end

	private

	def basic_params
		params.require(:basic_computer_skill).permit(:q1,:q2,:q3,:q4,:q5,:q6,:q7,:q8,:q9,:q10,:q11,:q12,:q13,:q14,:q15,
			:q16,:q17,:q18,:q19,:q20,:q21,:q22)
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
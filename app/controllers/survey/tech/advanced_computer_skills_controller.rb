class Survey::Tech::AdvancedComputerSkillsController < ApplicationController

def update
	@user = current_user
	@advanced = AdvancedComputerSkill.find_by(:user_id=>@user.user_id)
	@advanced.update_attributes(advanced_params)
	advanced_computer_progression()
	respond_to do |f|		
		 f.js
	end
end

	private

	def advanced_params
		params.require(:advanced_computer_skill).permit(:q1,:q2,:q3,:q4,:q5,:q6)
	end

	def advanced_computer_progression
	    @advanced_progress = -3
	    @total_advanced_questions = 6

	    @DBprogress = Progress.find_by(:user_id=> @user.user_id)
	    @advanced = AdvancedComputerSkill.find_by(:user_id=> @user.user_id)

	    if @advanced.nil?
	      @advanced_progress = 0
	    else
	      @advanced.attributes.each do |attr_name, attr_value|
	        if (attr_value != 0)
	          @advanced_progress += 1
	        end
	      end
	    end

	    @advanced_progress = (@advanced_progress*100)/ @total_advanced_questions 
	    @DBprogress.advanced_progress = @advanced_progress
	    @DBprogress.save
  end

end
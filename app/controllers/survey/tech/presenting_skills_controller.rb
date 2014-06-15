class Survey::Tech::PresentingSkillsController < ApplicationController

def update
	@user = current_user
	@present = PresentingSkill.find_by(:user_id=>@user.user_id)
	@present.update_attributes(present_params)
	presentation_progression()
	respond_to do |f|		
		 f.js { render 'shared/ajax/presentation_a.js.erb' }
	end
end

	private

	def present_params
		params.require(:presenting_skill).permit(:q1,:q2,:q3,:q4,:q5,:q6,:q7,:q8,:q9,:q10,:q11,:q12,:q13,:q14,:q15,
			:q16,:q17)
	end

	def presentation_progression
	    @presentation_progress = -6
	    @total_presentation_questions = 21

	    @DBprogress = Progress.find_by(:user_id=> @user.user_id)
	    @presentation = PresentingSkill.find_by(:user_id=> @user.user_id)
	    @presentation_fluent = PresentingFluentcy.find_by(:user_id=> @user.user_id)

	    if @presentation.nil?
	      @presentation_progress = 0
	    else
	      @presentation.attributes.each do |attr_name, attr_value|
	        if attr_value != 0
	          @presentation_progress += 1
	        end
	      end

	      @presentation_fluent.attributes.each do |attr_name, attr_value|
	        if (attr_value != 0 && attr_name != "other" && attr_name != "magnitude_other")
	          @presentation_progress += 1
	        end
	      end
	    end

	    @presentation_progress = (@presentation_progress*100)/@total_presentation_questions
	    @DBprogress.presentation_progress = @presentation_progress
	    @DBprogress.save
  end 

end
class Survey::Tech::EmailSkillsController < ApplicationController

def update
	@user = current_user
	@email = EmailSkill.find_by(:user_id=>@user.user_id)
	@email.update_attributes(email_params)
	email_progression()

	respond_to do |f|		
		 f.js { render 'shared/ajax/email_a.js.erb' }
	end
end

	private

	def email_params
		params.require(:email_skill).permit(:q1,:q2,:q3,:q4,:q5,:q6,:q7,:q8,:q9,:q10,:q11,:q12,:q13,:q14,:q15,
			:q16)
	end

	def email_progression
		@email_progress = -6
	    @total_email_questions = 18

	    @DBprogress = Progress.find_by(:user_id=> @user.user_id)
	    @email = EmailSkill.find_by(:user_id=> @user.user_id)
	    @email_fluentcy = EmailFluentcy.find_by(:user_id=> @user.user_id)

	    if @email.nil?
	      @email_progress = 0
	    else
	      @email.attributes.each do |attr_name, attr_value|
	        if (attr_value != 0)
	          @email_progress += 1
	        end
	      end

	      @email_fluentcy.attributes.each do |attr_name,attr_value|
	      	if (attr_value != 0 && attr_name != "other" && attr_name != "magnitude_other")
	      		@email_progress += 1
	      	end
	      end
	    end

	    @email_progress = (@email_progress*100)/ @total_email_questions 
	    @DBprogress.email_progress = @email_progress
	    @DBprogress.save
	end

end
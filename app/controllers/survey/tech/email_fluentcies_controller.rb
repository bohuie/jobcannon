class Survey::Tech::EmailFluentciesController < ApplicationController

def update
	@user = current_user
	@email = EmailFluentcy.find_by(:user_id=>@user.user_id)
	@email.update_attributes(email_params)
	email_progression()
	
	respond_to do |f|		
		 f.js 
	end
end

	private

	def email_params
		params.require(:email_fluentcy).permit(:outlook, :mail, :impress, :magnitude_other, :other)
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
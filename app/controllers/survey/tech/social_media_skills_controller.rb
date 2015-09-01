class Survey::Tech::SocialMediaSkillsController < ApplicationController

def update
	@user = current_user
	@socialmedia = SocialMediaSkill.find_by(:user_id=>@user.user_id)
	@socialmedia.update_attributes(social_params)
	social_progression()

	respond_to do |f|		
		 f.js { render 'shared/ajax/social_media_a.js.erb' }
	end
end

	private

	def social_params
		params.require(:social_media_skill).permit(:q1,:q2,:q3,:q4,:q5,:q6,:q7,:q8,:q9,:q10,:q11,:q12,:q13,:q14,:q15,
			:q16,:q17,:q18,:q19,:q20,:q21,:q22,:q23)
	end


	def social_progression
		@social_progress = -6
	    @total_social_questions = 36

	    @DBprogress = Progress.find_by(:user_id=> @user.user_id)
	    @socialmediadesc = SocialMediaDesc.find_by(:user_id=> @user.user_id)
	    @socialmedia = SocialMediaSkill.find_by(:user_id=> @user.user_id)
	    @s = SocialMediaPlatform.find_by(:user_id=> @user.user_id)

	    if @socialmedia.nil?
	    	@social_progress = 0
    	else

    		if(@s.q1a || @s.q1b || @s.q1c || @s.q1d)
    			@social_progress += 1
    		end

    		if(@s.q2a || @s.q2b || @s.q2c || @s.q2d)
    			@social_progress += 1
    		end
    		
    		if(@s.q3a || @s.q3b || @s.q3c || @s.q3d)
    			@social_progress += 1
    		end
    		
    		if(@s.q4a || @s.q4b || @s.q4c || @s.q4d)
    			@social_progress += 1
    		end
    		
    		if(@s.q5a || @s.q5b || @s.q5c || @s.q5d)
    			@social_progress += 1
    		end

    		if(@s.q6a || @s.q6b || @s.q6c || @s.q6d)
    			@social_progress += 1
    		end

    		if(@s.q7a || @s.q7b || @s.q7c || @s.q7d)
    			@social_progress += 1
    		end

    		if(@s.q8a || @s.q8b || @s.q8c || @s.q8d)
    			@social_progress += 1
    		end    		                	

    		@socialmedia.attributes.each do |attr_name, attr_value|
	        	if (attr_value != 0)
	         	 @social_progress += 1
	        	end
	      	end            

	      	@socialmediadesc.attributes.each do |attr_name, attr_value|
	        	if (attr_value != 0)
	         	 @social_progress += 1
	        	end
	      	end            
    	end    	
    	@social_progress = (@social_progress*100)/@total_social_questions
    	@DBprogress.social_progress = @social_progress
    	@DBprogress.save

	end 
end
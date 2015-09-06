class Survey::Tech::OnlineColabSkillsController < ApplicationController

def update
	@user = current_user
	@onlinecolab = OnlineColabSkill.find_by(:user_id=>@user.user_id)
	@onlinecolab.update_attributes(online_params)
	online_progression()
	
	respond_to do |f|		
		 f.js { render 'shared/ajax/online_a.js.erb' }
	end
end

	private

	def online_params
		params.require(:online_colab_skill).permit(:q1,:q2,:q3,:q4,:q5,:q6,:q7,:q8)
	end

	def online_progression
		@online_progress = -6
	    @total_online_questions = 20

	    @DBprogress = Progress.find_by(:user_id=> @user.user_id)
	    @onlinecolab = OnlineColabSkill.find_by(:user_id=> @user.user_id)
	    @onlinecolab_fluency = OnlineColabFluentcy.find_by(:user_id=> @user.user_id)

	    if @onlinecolab.nil?
	      @online_progress = 0
	    else
	      @onlinecolab.attributes.each do |attr_name, attr_value|
	        if (attr_value != 0)
	          @online_progress += 1
	        end
	      end

	      @onlinecolab_fluency.attributes.each do |attr_name, attr_value|
	      	if (attr_value != 0 && attr_name != "magnitude_other" && attr_name != "other")
	          @online_progress += 1
	        end
	      end
	    end

	    @online_progress = (@online_progress*100)/ @total_online_questions 
	    @DBprogress.online_progress = @online_progress
	    @DBprogress.save
	end

end
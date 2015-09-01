class Survey::Tech::MultiMediaSkillsController < ApplicationController

def update
	@user = current_user
	@media = MultiMediaSkill.find_by(:user_id=>@user.user_id)
	@media.update_attributes(media_params)
	multi_media_progression()

	respond_to do |f|		
		 f.js { render 'shared/ajax/multi_media_a.js.erb' }
	end
end

	private

	def media_params
		params.require(:multi_media_skill).permit(:q1,:q2,:q3,:q4,:q5)
	end

	def multi_media_progression
	    @media_progress = -6
	    @total_media_questions = 8

	    @DBprogress = Progress.find_by(:user_id=> @user.user_id)
	    @media = MultiMediaSkill.find_by(:user_id=> @user.user_id)
	    @tech_diff = TechnologyDifference.find_by(:user_id=> @user.user_id)

	    if @media.nil?
	      @media_progress = 0
	    else
	      @media.attributes.each do |attr_name, attr_value|
	        if attr_value != 0
	          @media_progress += 1
	        end
	      end

	      @tech_diff.attributes.each do |attr_name, attr_value|
	        if attr_value != 0
	          @media_progress += 1
	        end
	      end
	    end

	    @media_progress = (@media_progress*100)/@total_media_questions
	    @DBprogress.media_progress = @media_progress
	    @DBprogress.save
	  end

end
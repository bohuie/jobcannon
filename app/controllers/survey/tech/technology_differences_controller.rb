class Survey::Tech::TechnologyDifferencesController < ApplicationController

def update
	@user = current_user
	@td = TechnologyDifference.find_by(:user_id=>@user.user_id)
	@td.update_attributes(diff_params)
	multi_media_progression()
	
	respond_to do |f|		
		 f.js 
	end
end

	private

	def diff_params
		params.require(:technology_difference).permit(:q1,:q2,:q3)
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
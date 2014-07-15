class EndorsesController < ApplicationController

	def create
		@endor = Endorse.new(endorse_params)		
		

		@skill = Skill.find(@endor.skill_id)
		@skill.times_endorsed += 1
		@skill.save

		@owner = User.find(@skill.user_id)
		@endor.endorse_id = @owner.user_id
		@endor.save

		@id = "all_skills"
        @file = "skills?owner=" + @owner.user_id
        @skills = Skill.where(:user_id => @owner)

		respond_to do |f|
	      f.js { render 'shared/ajax/endorse_skill.js.erb'}
	      f.html {redirect_to profile_path(:id=>@owner.user_id)}
	    end
		
	end

	def update
		@endor = Endorse.find(params[:id])

		@skill = Skill.find(@endor.skill_id)
		@owner = User.find(@skill.user_id)
		@endor.destroy	
		@skill.times_endorsed -= 1	

		redirect_to profile_path(:id=>@owner.user_id)
	end 

	private

	def endorse_params
		params.require(:endorse).permit(:skill_id,:endorser_id)
	end

end
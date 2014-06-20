class EndorsesController < ApplicationController

	def create
		@endor = Endorse.new
		@endor.update_attributes(endorse_params)
		@endor.save

		@skill = Skill.find(@endor.skill_id)
		@owner = User.find(@skill.user_id)

		redirect_to profile_path(:id=>@owner.user_id)
	end

	def update
		@endor = Endorse.find(params[:id])

		@skill = Skill.find(@endor.skill_id)
		@owner = User.find(@skill.user_id)
		@endor.destroy		


		redirect_to profile_path(:id=>@owner.user_id)
	end 

	private

	def endorse_params
		params.require(:endorse).permit(:skill_id,:endorser_id)
	end

end
class EndorsesController < ApplicationController

	def create
		@endor = Endorse.new
		@endor.update_attributes(endorse_params)
		@endor.save

		redirect_to root_path
	end

	def update
		@endor = Endorse.find(params[:id])
		@endor.destroy

		redirect_to root_path
	end 

	private

	def endorse_params
		params.require(:endorse).permit(:skill_id,:endorser_id)
	end

end
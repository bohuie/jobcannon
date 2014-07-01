class FlaggedCandidatesController < ApplicationController


	def create
		@candidate = FlaggedCandidate.new(candidate_params)		
		@candidate.save
		@owner = User.find(@candidate.flagged_user_id)

		redirect_to profile_path(:id=>@owner.user_id)
		flash[:success] = "Candidate Added"
	end

	def update 
	end	

	def destroy
		@c = FlaggedCandidate.find(params[:id])
		@c.destroy
		redirect_to root_path
	end 


	private

	def candidate_params

		params.require(:flagged_candidate).permit(:list_id, :flagged_user_id)
	end 

end

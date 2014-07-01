class FlaggedCandidatesController < ApplicationController


	def create
		@candidate = FlaggedCandidate.new(candidate_params)
		unless(FlaggedCandidate.find_by(list_id: @candidate.list_id, flagged_user_id: @candidate.flagged_user_id))
			@candidate.save
		end
		@owner = User.find(@candidate.flagged_user_id)
		respond_to do |f|
			f.html{
				redirect_to profile_path(:id=>@owner.user_id)
				flash[:success] = "Candidate Added"
			}
			f.js{
				render 'shared/ajax/network_flag.js.erb'
			}
		end
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

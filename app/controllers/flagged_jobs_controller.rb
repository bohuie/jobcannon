class FlaggedJobsController < ApplicationController

	def index
	end

	def show
		@user = current_user
		@jobs = FlaggedJob.where(:user_id=>@user.user_id).select(:posting_id)
		@postings = Posting.where(:posting_id => @jobs)		
	end


	def destroy
		
	    @job = FlaggedJob.find(params[:id])
	    
	    if @job.destroy
	      flash[:success] = "Job Removed."
	    else
	      flash[:error] = "Error"
	    end
	    redirect_to root_path
	end
end
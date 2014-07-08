class PostingsController < ApplicationController

  def index
  	@posting = Posting.new
    @user = current_user
    @userID = @user.user_id
    @skill = Skill.new    

    @owner = User.find(params[:id])
    @postings = Posting.where(:user_id => @owner.user_id)
  end

  def show
    @posting = Posting.find(params[:id])
    @user = current_user

  end

  def create

  	if(user_signed_in? && current_user.employer)
  		@posting = Posting.new(posting_params)
  		@posting.user_id = current_user.user_id
  		if(@posting.save)
  			flash[:success] = "Posting created!"
        	redirect_to '/postings'
        else
  			flash[:error] = "Fill in all required fields"
        	redirect_to '/postings'
    end
  	else
  		flash[:error] = "No access"
        redirect_to root_path

  	end

  	
  end

  def update
    @posting = Posting.find(params[:id])
    if (user_signed_in? && current_user.user_id == @posting.user_id && current_user.employer)
      if @posting.update_attributes(posting_params)
        @posting.save
        flash[:success] = "Changes saved"        
      else
        flash[:error] = "Changes not saved."            
      end
    else
      flash[:error] = "No access"      
    end
    redirect_to postings_path(:id=>@user.user_id, :anchor=>@posting.title.delete(' '))
  end

  def edit
    @posting = Posting.find(params[:id])
    @user = current_user
  end

  def destroy
    @posting = Posting.find(params[:id])
    if (user_signed_in? && current_user.user_id == @posting.user_id && current_user.employer)
      @posting.destroy
      flash[:success] = "Posting Removed."
    else
      flash[:error] = "No access"
    end
    redirect_to '/postings'

  end

  def people

    @postingID = params[:id]

    @candidates = FlaggedJob.where(:posting_id=>@postingID)

  end 

  def flagged    

    @flagged = FlaggedJob.new
    @flagged.posting_id = params[:post_id]
    @flagged.user_id = current_user.user_id
    @flagged.status = "Not Seen"

    @flagged.save

    redirect_to root_path()

  end 

  private
    
    def posting_params
        params.require(:posting).permit(:title, :description, :posting_id, :salary)
    end
end
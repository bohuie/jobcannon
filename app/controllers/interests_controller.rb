class InterestsController < ApplicationController
  autocomplete :interestlabel, :label, :full => true

  def index
    #@owner_interests = interest.where(:user_id => params[:owner]) 
  	@interest = Interest.new
    @owner = params[:owner]

    @user = current_user
    @userID = current_user.user_id    
    @interests = Interest.where(:user_id => @owner).paginate(page: params[:page])
  end

  def show

    @interest = Interest.find(params[:id])
    @user = current_user

  end

  def destroy
    @interest = Interest.find(params[:id])
    @userID = current_user.user_id    
    
    if @interest.destroy
      flash[:success] = "interest Removed."
    else
      flash[:error] = "No access here "
    end

      redirect_to interests_path(:owner =>@userID)
  end

  def create
  	if(user_signed_in?)
  		@interest = Interest.new(interest_params)
      @interest.user_id = current_user.user_id
      @userID = current_user.user_id
      if(Interestlabel.find_by(label: @interest.label).nil?)
        @interestlabel = Interestlabel.new
        @interestlabel.label = @interest.label
        @interestlabel.save
      end
  		if(@interest.save)
  			flash[:success] = "interest created!"
      	redirect_to interests_path(:owner =>@userID)
      else
  			flash[:error] = "Fill in all required fields"
       	redirect_to "/interests"
      end
      @interests = Interest.where(:user_id => current_user.user_id).paginate(page: params[:page])
            
  	else
  		flash[:error] = "No access"
      redirect_to root_path
    end
  end

  private
    def interest_params
        params.require(:interest).permit(:label, :interest_id)
    end
end
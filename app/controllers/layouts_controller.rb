class LayoutsController < ApplicationController

	def privatechat
	   	@user = current_user
	   	if params[:id1]<params[:id2]		#the convention will be to have the lesser number come first in the path and the channel
	    	@id1 = params[:id1].to_i
	    	@id2 = params[:id2].to_i
	    else
	    	@id2 = params[:id1].to_i
	    	@id1 = params[:id2].to_i
	    end

	    if @user.user_id==@id1
	  		@other = User.find(@id2)
	  		@requested = Friendship.where(sender_id: @user.user_id, receiver_id: @other.user_id, accepted: true)
	    	@accepted = Friendship.where(sender_id: @other.user_id, receiver_id: @user.user_id, accepted: true)
	    	if @accepted.empty? and @requested.empty? #make sure they are friends
	    		redirect_to root_path
	    	end 
	    elsif @user.user_id==@id2
	  		@other = User.find(@id1)
	  		@requested = Friendship.where(sender_id: @user.user_id, receiver_id: @other.user_id, accepted: true)
	    	@accepted = Friendship.where(sender_id: @other.user_id, receiver_id: @user.user_id, accepted: true)
	    	if @accepted.empty? and @requested.empty? #make sure they are friends
	    		redirect_to root_path
	    	end
	  	else 
	  		redirect_to root_path
	  	end
	    if !@other.nil? #make sure the other user exists
	      @messages = Message.where(sender_id: @other.user_id, receiver_id: @user.user_id)
	      @messages = @messages + Message.where(sender_id: @user.user_id, receiver_id: @other.user_id)
	      @messages = @messages.sort_by { |obj| obj.sent_at } #loads all the past messages, ordered by date
	    end

	    @channel = "/"+@id1.to_s+"chatwith"+ @id2.to_s    #create the channel variable

	    respond_to do |format|
          	format.js
    	end
  	end

end
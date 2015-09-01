class LayoutsController < ApplicationController

	def show
<<<<<<< HEAD
		# if user_signed_in?
		# 	#This checks for currently online users
		# 	@user = current_user
		#     @online = User.where(last_seen_at: (Time.now-7.hours-15.seconds..Time.now-7.hours)).where.not(id: @user.user_id)
		#     #check for unread messages
		#     @messagesreceived = Message.where(receiver_id: @user.id, seen: false).order(:sent_at)
		#     if !@messagesreceived.empty? || !@user.partner_id.nil? || @user.partner_id != -1		    	
		#     	#find the sender of the most recent unread message
		#     	if(@messagesreceived.first)
		#     		@other = User.find(@messagesreceived.first.sender_id)
		#     		if(@other.partner_id = @user.user_id)
		#     			@user.update_attribute(:partner_id, @other.user_id)
		#     		end
		#     	end
		#     	if !@other.nil?
		#     		@user.update_attribute(:available, false)
		# 	    	#find all messages send to current user
		# 	    	@messagesreceived = Message.where(sender_id: @other.user_id, receiver_id: @user.user_id).order(:sent_at)
		# 	    	#find all messages sent from user to other messager
		# 	    	@messagessent = Message.where(sender_id: @user.user_id, receiver_id: @other.user_id).order(:sent_at)
		# 	    end
		#     end
		#     if !@messagesreceived.nil?
		#     	@messages = @messagesreceived
		#     else
		#     	@messages = []
		#     end
		#     if !@messagessent.nil?		    
		#     	@messages = @messages+@messagessent
		#     end
		#     #order all messages between these two and store it in messages
		#     @messages = @messages.sort_by { |obj| obj.sent_at }
		#     @unseen = @messagesreceived.where(seen: false)
		# end
		# respond_to do |format|
	 #      format.js { 
	 #      	if @messages.nil? || @messages.empty?
	 #      		render :online 
	 #      	elsif @user.partner_id == -1
	 #      		render :nochat
	 #      	elsif !@unseen.empty?
	 #      		render :chat
	 #      	else
	 #      		render :closedchat
	 #      	end
	 #      }
	 #    end
=======
		if user_signed_in?
			#This checks for currently online users
			@user = current_user
		    @online = User.where(last_seen_at: (Time.now-7.hours-15.seconds..Time.now-7.hours)).where.not(id: @user.user_id)
		    #check for unread messages
		    @messagesreceived = Message.where(receiver_id: @user.id, seen: false).order(:sent_at)
		    if !@messagesreceived.empty? || !@user.partner_id.nil? || @user.partner_id != -1		    	
		    	#find the sender of the most recent unread message
		    	if(@messagesreceived.first)
		    		@other = User.find(@messagesreceived.first.sender_id)
		    		if(@other.partner_id = @user.user_id)
		    			@user.update_attribute(:partner_id, @other.user_id)
		    		end
		    	end
		    	if !@other.nil?
		    		@user.update_attribute(:available, false)
			    	#find all messages send to current user
			    	@messagesreceived = Message.where(sender_id: @other.user_id, receiver_id: @user.user_id).order(:sent_at)
			    	#find all messages sent from user to other messager
			    	@messagessent = Message.where(sender_id: @user.user_id, receiver_id: @other.user_id).order(:sent_at)
			    end
		    end
		    if !@messagesreceived.nil?
		    	@messages = @messagesreceived
		    else
		    	@messages = []
		    end
		    if !@messagessent.nil?		    
		    	@messages = @messages+@messagessent
		    end
		    #order all messages between these two and store it in messages
		    @messages = @messages.sort_by { |obj| obj.sent_at }
		    @unseen = @messagesreceived.where(seen: false)
		end
		respond_to do |format|
	      format.js { 
	      	if @messages.nil? || @messages.empty?
	      		render :online 
	      	elsif @user.partner_id == -1
	      		render :nochat
	      	elsif !@unseen.empty?
	      		render :chat
	      	else
	      		render :closedchat
	      	end
	      }
	    end
>>>>>>> f525c470cbce5b41f808865a5e8f71be2774a00f
  	end

  	def openchat
		if user_signed_in?
			@user = current_user
			@other = User.find(params[:id2])
		    @online = User.where(last_seen_at: (Time.now-7.hours-15.seconds..Time.now-7.hours)).where.not(id: @user.user_id)
		    @invitation = Message.new(sender_id: @user.user_id, receiver_id: @other.user_id, 
		    	sent_at: DateTime.now-7.hours, 
		    	message: "" )
		    @invitation.save
		end
		respond_to do |format|
	      format.js { render :chat }
	    end
  	end

  	def accept_inv
  		@message = Message.find(params[:id])
  		@sender = User.find(@message.sender_id)
  		@receiver = User.find(@message.receiver_id)
  		@response = Message.new(sender_id: @receiver.user_id, receiver_id: @sender.user_id, 
		    	sent_at: DateTime.now-7.hours, 
		    	message: "Yes, thank-you")
  		@response.save
  		respond_to do |format|
	      format.js { render :chat }
	    end
  	end

  	def decline_inv
  		@message = Message.find(params[:id])
  		@sender = User.find(@message.sender_id)
  		@receiver = User.find(@message.receiver_id)
  		respond_to do |format|
	      format.js { render :nochat }
	    end
  	end

  	def endchat
  		@sender = User.find(params[:id1])
  		@receiver = User.find(params[:id2])
  		respond_to do |format|
	      format.js { render :nochat }
	    end
  	end
end
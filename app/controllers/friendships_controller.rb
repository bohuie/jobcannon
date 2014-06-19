class FriendshipsController < ApplicationController

  def index

    @left = true  #used to determin where to postion the list of friends
    @user = current_user
    @userID = current_user.user_id
    @requests = Friendship.where(receiver_id: @user.user_id, accepted: false)
    @requested = Friendship.where(sender_id: @user.user_id, accepted: true)
    @accepted = Friendship.where(receiver_id: @user.user_id, accepted: true)
    @friends= @requested+@accepted
    @online = Array.new
    @friends.each do |r|
      if r.receiver_id==@user.user_id
        @friend = User.find_by(user_id: r.sender_id)
         if @friend.online
          @online.push(r)
        end
      else
        @friend = User.find_by(user_id: r.receiver_id)
         if @friend.online
          @online.push(r)
        end
      end
    end
  end

  def create

  end

  def show
    @temp1 = Friendship.where(sender_id: @user.user_id, accepted: true)
    @temp2 = Friendship.where(receiver_id: @user.user_id, accepted: true)
    @temp = @temp1+@temp2
    @friendships = []
    @temp.each do |r|
      @friendships.push({source: User.find(r.sender_id).fname + " " + User.find(r.sender_id).lname,
                         target: User.find(r.receiver_id).fname + " " + User.find(r.receiver_id).lname})
    end
    puts "MATT WAS HERE"
    puts @friendships.to_json
    @friendships = @friendships.to_json
  end

  def findfriend

    @user=current_user
    @results = User.findbyemail(params[:q])
    @q = params[:q]

  end

  def addfriend
    if user_signed_in?
      @sender = params[:sender]
      @receiver = params[:receiver]
      if Friendship.find_by(sender_id: @sender, receiver_id: @receiver).nil? &&
        Friendship.find_by(sender_id: @receiver, receiver_id: @sender).nil?

        @friend = Friendship.create(friendship_id: 0, sender_id: @sender, receiver_id: @receiver, sent_at: DateTime.now, accepted: false)

        if @friend.save

          flash[:success] = "Friend request sent"
          redirect_to root_path 
        else
          flash[:error] = "Oops, something went wrong."
          redirect_to root_path
        end

      else
        flash[:notice] = "Already friends with this person or friendship pending acceptance."
        redirect_to root_path
      end
    end
  end

  def accept

    if user_signed_in?
      @friendship = Friendship.find(params[:friend_id])
      @friendship.accepted = true
      @friendship.accepted_at = DateTime.now

      if @friendship.save
        flash[:success] = "Friend added"
        redirect_to network_path
      else
        flash[:error] = "Oops, something went wrong."
        redirect_to network_path
      end

    end

  end

  def decline
    fid = params[:friend_id]
    if user_signed_in?
      @friendship = Friendship.find_by(friendship_id: fid)
      @friendship.destroy
      flash[:success] = "Friendship avoided"
      redirect_to network_path
      
     
    end

  end

  def destroy

    @friendship = Friendship.find(params[:id])
    if user_signed_in? && (current_user.user_id == @friendship.sender_id || current_user.user_id== @friendship.receiver_id)
      @friendship.destroy
      flash[:success] = "Friendship destroyed."
    else
      flash[:error] = "No access"
    end
    redirect_to network_path

  end



 
end
class FriendshipsController < ApplicationController

  def index
    @left = 0  #used to determine where to postion the list of friends
    @user = current_user
    @userID = current_user.user_id
    @requests = Friendship.where(receiver_id: @user.user_id, accepted: false)
    @requested = Friendship.where(user_id: @user.user_id, accepted: true)
    @accepted = Friendship.where(receiver_id: @user.user_id, accepted: true)
    @friends= @requested+@accepted
    @companies = Following.where(user_id: @user.user_id)
    @online = Array.new
    @friends.each do |r|
      if r.receiver_id==@user.user_id
        @friend = User.find_by(user_id: r.user_id)
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
    @user = current_user
    @network = NetworkSearch.new
    @temp1 = Friendship.where(user_id: @user.user_id, accepted: true)
    @temp2 = Friendship.where(receiver_id: @user.user_id, accepted: true)
    @temp = @temp1+@temp2
    #Add friends of friends to the network
    @temp.each do |t|
      @temp1 = @temp1 + Friendship.where(user_id: t.receiver_id, accepted: true)
      @temp1 = @temp1 + Friendship.where(receiver_id: t.user_id, accepted: true)
    end
    @temp = @temp1+@temp2
    @temp = @temp.uniq
    @friendships = []
    @temp.each do |r|
      if(Photo.find_by(:user_id=>r.user_id).nil?)
        @sourcephoto = "" 
      else
        @sourcephoto = Photo.find_by(:user_id=>r.user_id).photo.url
      end
      if(Photo.find_by(:user_id=>r.receiver_id).nil?)
        @targetphoto = "" 
      else
        @targetphoto = Photo.find_by(:user_id=>r.receiver_id).photo.url
      end
      @source = User.find(r.user_id)
      @target = User.find(r.receiver_id)
      @sourcefollowing = Following.where(user_id: r.user_id)
      @sourceusers = Array.new
      @sourcefollowing.each do |sf|
        @sourceusers.push(User.find(sf.receiver_id))
      end
      @targetfollowing = Following.where(user_id: r.receiver_id)
      @targetusers = Array.new
      @targetfollowing.each do |sf|
        @targetusers.push(User.find(sf.receiver_id))
      end
        @friendships.push({source: @source.fname + " " + @source.lname,
                          sourceid: r.user_id, 
                          sourceskills: Skill.where(user_id: r.user_id), 
                          sourcephoto: @sourcephoto, 
                          sourceemail: @source.email,
                          sourcereferences: Reference.where(user_id: r.user_id),
                          sourceexperiences: Experience.where(user_id: r.user_id), 
                          sourcecompany: false,
                          sourceflaggedjobs: FlaggedCandidate.where(flagged_user_id: r.user_id),
                          sourceinterests: Interest.where(user_id: r.user_id),
                          sourcefollowing: @sourceusers,
                          targetreferences: Reference.where(user_id: r.receiver_id),
                          targetexperiences: Experience.where(user_id: r.receiver_id),
                          target: @target.fname + " " + @target.lname,
                          targetid: r.receiver_id, 
                          targetskills: Skill.where(user_id: r.receiver_id),
                          targetphoto: @targetphoto, 
                          targetemail: @target.email, 
                          targetcompany: @target.employer,
                          targetinterests: Interest.where(user_id: r.receiver_id),
                          targetfollowing: @targetusers})
    end
    @friendships = @friendships.to_json
    @friendship = Friendship.new
  end

  def findfriend

    @user=current_user
    @results = User.findbyemail(params[:q])
    @q = params[:q]

  end

  def findcompany

    @user=current_user
    @results = User.findbyfname(params[:q])
    @q = params[:q]

  end

  def addfriend
    if user_signed_in?
      @sender = params[:sender]
      @receiver = params[:receiver]
      if Friendship.find_by(user_id: @sender, receiver_id: @receiver).nil? &&
        Friendship.find_by(user_id: @receiver, receiver_id: @sender).nil?

        @friend = Friendship.create(friendship_id: 0, user_id: @sender, receiver_id: @receiver, sent_at: DateTime.now, accepted: false)

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

  def addcompany
    if user_signed_in?
      @sender = params[:sender]
      @receiver = params[:receiver]
      if Following.find_by(user_id: @sender, receiver_id: @receiver).nil?

        @friend = Following.create(following_id: 0, user_id: @sender, receiver_id: @receiver, sent_at: DateTime.now)

        if @friend.save

          flash[:success] = "Following "+User.find(@receiver).fname
          redirect_to root_path 
        else
          flash[:error] = "Oops, something went wrong."
          redirect_to root_path
        end

      else
        flash[:notice] = "You are already following "+User.find(@receiver).fname
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
    if user_signed_in? && (current_user.user_id == @friendship.user_id || current_user.user_id== @friendship.receiver_id)
      @friendship.destroy
      flash[:success] = "Friendship destroyed."
    else
      flash[:error] = "No access"
    end
    redirect_to network_path

  end



 
end
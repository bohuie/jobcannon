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
    @user = current_user
    @network = NetworkSearch.new
    @temp1 = Friendship.where(sender_id: @user.user_id, accepted: true)
    @temp2 = Friendship.where(receiver_id: @user.user_id, accepted: true)
    @temp = @temp1+@temp2
    @temp.each do |t|
      @temp1 = @temp1 + Friendship.where(sender_id: t.receiver_id, accepted: true)
      @temp1 = @temp1 + Friendship.where(receiver_id: t.sender_id, accepted: true)
      @temp1 = @temp1 + Friendship.where(receiver_id: t.receiver_id, accepted: true)
    end
    @temp = @temp1+@temp2
    @temp = @temp.uniq
    @friendships = []
    @temp.each do |r|
      if(Photo.find_by(:user_id=>r.sender_id).nil? && Photo.find_by(:user_id=>r.receiver_id).nil?)
        @friendships.push({source: User.find(r.sender_id).fname + " " + User.find(r.sender_id).lname,
                          sourceid: r.sender_id, sourceskills: Skill.where(user_id: r.sender_id), 
                          sourcephoto: "", sourceemail: User.find(r.sender_id).email,
                          sourcereferences: Reference.where(user_id: r.sender_id),
                          sourceexperiences: Experience.where(user_id: r.sender_id),
                          targetreferences: Reference.where(user_id: r.receiver_id),
                          targetexperiences: Experience.where(user_id: r.receiver_id),
                          target: User.find(r.receiver_id).fname + " " + User.find(r.receiver_id).lname,
                          targetid: r.receiver_id, targetskills: Skill.where(user_id: r.receiver_id),
                          targetphoto: "", targetemail: User.find(r.receiver_id).email})
      elsif(Photo.find_by(:user_id=>r.sender_id).nil?)
        @friendships.push({source: User.find(r.sender_id).fname + " " + User.find(r.sender_id).lname,
                          sourceid: r.sender_id, sourceskills: Skill.where(user_id: r.sender_id), 
                          sourcephoto: "", sourceemail: User.find(r.sender_id).email,
                          sourcereferences: Reference.where(user_id: r.sender_id),
                          sourceexperiences: Experience.where(user_id: r.sender_id),
                          targetreferences: Reference.where(user_id: r.receiver_id),
                          targetexperiences: Experience.where(user_id: r.receiver_id),
                          target: User.find(r.receiver_id).fname + " " + User.find(r.receiver_id).lname,
                          targetid: r.receiver_id, targetskills: Skill.where(user_id: r.receiver_id),
                          targetphoto: Photo.find_by(:user_id=>r.receiver_id).photo.url, targetemail: User.find(r.receiver_id).email})
      elsif(Photo.find_by(:user_id=>r.receiver_id).nil?)
        @friendships.push({source: User.find(r.sender_id).fname + " " + User.find(r.sender_id).lname,
                          sourceid: r.sender_id, sourceskills: Skill.where(user_id: r.sender_id), 
                          sourcephoto: Photo.find_by(:user_id=>r.sender_id).photo.url, sourceemail: User.find(r.sender_id).email,
                          sourcereferences: Reference.where(user_id: r.sender_id),
                          sourceexperiences: Experience.where(user_id: r.sender_id),
                          targetreferences: Reference.where(user_id: r.receiver_id),
                          targetexperiences: Experience.where(user_id: r.receiver_id),
                          target: User.find(r.receiver_id).fname + " " + User.find(r.receiver_id).lname,
                          targetid: r.receiver_id, targetskills: Skill.where(user_id: r.receiver_id),
                          targetphoto: "", targetemail: User.find(r.receiver_id).email})
      else
        @friendships.push({source: User.find(r.sender_id).fname + " " + User.find(r.sender_id).lname,
                          sourceid: r.sender_id, sourceskills: Skill.where(user_id: r.sender_id), 
                          sourcephoto: Photo.find_by(:user_id=>r.sender_id).photo.url, sourceemail: User.find(r.sender_id).email,
                          sourcereferences: Reference.where(user_id: r.sender_id),
                          sourceexperiences: Experience.where(user_id: r.sender_id),
                          targetreferences: Reference.where(user_id: r.receiver_id),
                          targetexperiences: Experience.where(user_id: r.receiver_id),
                          target: User.find(r.receiver_id).fname + " " + User.find(r.receiver_id).lname,
                          targetid: r.receiver_id, targetskills: Skill.where(user_id: r.receiver_id),
                          targetphoto: Photo.find_by(:user_id=>r.receiver_id).photo.url, targetemail: User.find(r.receiver_id).email})
      end
    end
    @friendships = @friendships.to_json
    @friendship = Friendship.new
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
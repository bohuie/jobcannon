class ProfileController < ApplicationController

  def index
   	@user = current_user
    @user.update_attribute(:online, true)
    puts @user
    @owner = User.find(params[:id])
    if(@owner.employer?)
      @postings = Posting.where(:user_id => @owner.user_id)
      @pp = 0
    else
      @experiences = Experience.where(:user_id => @owner.user_id)
      @skills = Skill.where(:user_id => @owner.user_id)
      @references = Reference.where(:user_id => @owner.user_id)
    end

  end

  def online

  end

  def resume
    @users = User.find(params[:id])
    @experiences = Experience.where(user_id: @user.id)
    @references = Reference.where(user_id: @user.id)
    @location = Surveyprofile.find_by(user_id: @user.user_id)
    respond_to do |format|
      format.html { redirect_to root_path }
      format.pdf do
        pdf = ReportPdf.new(@users, @experiences, @references, @location)
        send_data pdf.render, filename: 'report.pdf', type: 'application/pdf'
      end
    end
  end

  def update
    @user = current_user
    @owner = User.find(params[:id])

    @owner.update_attributes(info_params)
    redirect_to root_path
  end

  def show
    @user = current_user
    @owner = User.find(params[:id])
    @user.update_attribute(:online, true)
    puts @user
    @friendsadded = Friendship.where(user_id: @owner.user_id, accepted: true)
    @friendsaccepted = Friendship.where(receiver_id: @owner.user_id, accepted: true)
    @friends = (@friendsaccepted + @friendsadded)

    if(@owner.employer?)
      @postings = Posting.where(:user_id => @owner.user_id)
      @shopping_lists = ShoppingList.where(user_id: @owner.user_id).first(9)
      @new_list = ShoppingList.new
      @new_list.user_id = @owner.user_id
    else
      @experiences = Experience.where(:user_id => @owner.user_id)
      @skills = Skill.where(:user_id => @owner.user_id)
      @references = Reference.where(:user_id => @owner.user_id)
      progress()
    end
    reccomend()

    
    if params[:seen]
        @job = FlaggedJob.find_by(:user_id=> @owner.user_id, :posting_id=> params[:pid])
        @job.status = "Seen"
        @job.save
    end

  end

  def reccomend
    @user = current_user
    if @user.employer?
    else
      @userskills = Skill.where(user_id: @user.user_id)
      @postings = find_postings(@userskills)
      #@postings = sort_postings(@postings)
    end
  end
  def find_postings(userskills)
    postings = Posting.where(posting_id: 0)
    p userskills
    userskills.each do |us|
      @label = us.label
      @jobskills = Skill.where(label: @label)
      @jobskills.each do |js|
        if !js.posting_id.nil?
          postings.push(Posting.find_by(posting_id: js.posting_id))
        end
      end
    end
    p postings
    return postings
  end

  def sort_postings(postings)
    @hash = {0 => 0}

    postings.each do |p|
      if @hash[p.posting_id].nil?
        @hash.merge!({p.posting_id => 1})
      else
        @hash[p.posting_id] = @hash[p.posting_id] + 1
      end
    end
    postings.clear
    @hash = Hash[@hash.sort_by{|k, v| v}.reverse]
    @hash.each_key do |key|
      postings.push(Posting.find_by(posting_id: key))
    end
    return postings
  end

  private

  def info_params
    params.require(:user).permit(:info)
  end

  def progress      
      
      @local_tech = 0

      @progress = Progress.find_by(:user_id=>@user.user_id)

      if @progress.nil?
        @progress = Progress.new
        @progress.user_id = @user.user_id
        @progress.save
      end                   

      @local_tech += @progress.basic_progress
      @local_tech += @progress.advanced_progress
      @local_tech += @progress.media_progress
      @local_tech += @progress.spreadsheet_progress
      @local_tech += @progress.word_progress
      @local_tech += @progress.email_progress
      @local_tech += @progress.presentation_progress
      @local_tech += @progress.internet_progress
      @local_tech += @progress.online_progress
      @local_tech += @progress.social_progress

      @progress.tech_progress = @local_tech/10
      @progress.save 
  end

end
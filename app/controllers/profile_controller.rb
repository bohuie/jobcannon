class ProfileController < ApplicationController

  def index
   	@user = current_user
    @user.update_attribute(:online, true)
    puts @user
    @owner = User.find(params[:id])
    if(@owner.employer?)
      @postings = Posting.where(:user_id => @owner.user_id).paginate(page: params[:page])
      @pp = 0
    else
      @experiences = Experience.where(:user_id => @owner.user_id).paginate(page: params[:page])
      @skills = Skill.where(:user_id => @owner.user_id).paginate(page: params[:page])
      @references = Reference.where(:user_id => @owner.user_id).paginate(page: params[:page])
    end
  end

  def online

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
    @friendsadded = Friendship.where(sender_id: @owner.user_id, accepted: true)
    @friendsaccepted = Friendship.where(receiver_id: @owner.user_id, accepted: true)
    @friends = (@friendsaccepted + @friendsadded)

    if(@owner.employer?)
      @postings = Posting.where(:user_id => @owner.user_id).paginate(page: params[:page])
    else
      @experiences = Experience.where(:user_id => @owner.user_id).paginate(page: params[:page])
      @skills = Skill.where(:user_id => @owner.user_id).paginate(page: params[:page])
      @references = Reference.where(:user_id => @owner.user_id).paginate(page: params[:page])      
      progress()
    end
    reccomend()
  end

  def reccomend
    @user = current_user
    if @user.employer?
    else
      @userskills = Skill.where(user_id: @user.user_id)
      @postings = find_postings(@userskills)
      @postings = sort_postings(@postings)
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
      #@personality_progress = 0
      #@experience_progress = 0

      profile_progression()
      personality_progression()
      experience_progression()      
  end

  private

  def experience_progression
    @experience_progress = -16
    @total_experience_questions = 82

    @full_time = Experiencetable.find_by(:user_id => @user.user_id, :full_time => true)
    @part_time = Experiencetable.find_by(:user_id => @user.user_id, :part_time => true)
    @employ = Experiencetable.find_by(:user_id => @user.user_id, :employ => true) 
    @volunteer = Experiencetable.find_by(:user_id => @user.user_id, :volunteer => true)

    if (@full_time.nil?) 
        @experience_progress =0
    else 
        @full_time.attributes.each do |attr_name, attr_value|
            if (attr_value != false && attr_value != nil && attr_value != "") 
              @experience_progress += 1 
            end
        end

        @part_time.attributes.each do |attr_name, attr_value|
            if (attr_value != false && attr_value != nil && attr_value != "") 
              @experience_progress += 1 
            end
        end

        @employ.attributes.each do |attr_name, attr_value|
            if (attr_value != false && attr_value != nil && attr_value != "") 
              @experience_progress += 1 
            end
        end

        @volunteer.attributes.each do |attr_name, attr_value|
            if (attr_value != false && attr_value != nil && attr_value != "") 
              @experience_progress += 1 
            end
        end
    end
        #@experience_progress = (100*@experience_progress)/@total_experience_questions
  end

  def personality_progression
    @personality_progress = -15
    @total_personality_questions = 45
    @communication = CommunicationSkill.find_by(:user_id=>@user.user_id)
    @thinking = ThinkingSkill.find_by(:user_id=>@user.user_id)
    @self = SelfDirectionSkill.find_by(:user_id=>@user.user_id)
    @accountability = Accountability.find_by(:user_id=>@user.user_id)
    @interpersonal = InterpersonalSkill.find_by(:user_id=>@user.user_id)

    if (@communication.nil?)
        @personality_progress = 0
    else
        @communication.attributes.each do |attr_name, attr_value|
            if (attr_value != 0) 
              @personality_progress += 1 
          end
        end

        @thinking.attributes.each do |attr_name, attr_value|
            if (attr_value != 0) 
              @personality_progress += 1 
          end
        end

        @self.attributes.each do |attr_name, attr_value|
            if (attr_value != 0) 
              @personality_progress += 1 
          end
        end

        @accountability.attributes.each do |attr_name, attr_value|
            if (attr_value != 0) 
              @personality_progress += 1 
          end
        end

        @interpersonal.attributes.each do |attr_name, attr_value|
            if (attr_value != 0) 
              @personality_progress += 1 
          end
        end
    end

    @personality_progress = (100*@personality_progress)/@total_personality_questions
  end

  def profile_progression
      @profile_progress = -3
      @total_profile_questions = 7      
      @pp = Surveyprofile.find_by(:user_id => @user.user_id)      
      @lp = Language.find_by(:user_id => @user.user_id)      
      @local_counter = -3

      if (@pp.nil?)        
        @profile_progress = 0
      else          
        @pp.attributes.each do |attr_name, attr_value|
          if !(attr_value.nil? || attr_value == "") 
            @profile_progress += 1 
          end
        end

        @lp.attributes.each do |attr_name, attr_value|
          if (attr_value != false && !attr_value.nil?) 
            @local_counter += 1 
          end
        end

        if @local_counter > 0
          @profile_progress += 1
        end
      end
      @profile_progress = (@profile_progress*100/@total_profile_questions)
  end
end
class Survey::Profile::LanguagesController < ApplicationController

	def update
		@user = current_user
		@language = Language.find_by(:user_id => @user.user_id)	
		@language.user_id = current_user.user_id
		@language.update_attributes(language_params)		
		profile_progression()
		respond_to do|f|
			f.js
		end						
	end

	private

	def language_params
	    params.require(:language).permit(:eng_speak,:eng_write,:eng_read,:eng_formal,
	    								:fren_speak,:fren_write,:fren_read,:fren_formal,
	    								:spnish_speak,:spnish_write,:spnish_read,:spnish_formal,
	    								:tagalog_speak,:tagalog_write,:tagalog_read,:tagalog_formal,
	    								:mandarin_speak,:mandarin_write,:mandarin_read,:mandarin_formal,
	    								:cantonese_speak,:cantonese_write,:cantonese_read,:cantonese_formal,
	    								:punjabi_speak,:punjabi_write,:punjabi_read,:punjabi_formal,
	    								:urdu_speak,:urdu_write,:urdu_read,:urdu_formal,
	    								:tamil_speak,:tamil_write,:tamil_read,:tamil_formal,
	    								:persian_speak,:persian_write,:persian_read,:persian_formal,
	    								:italian_speak,:italian_write,:italian_read,:italian_formal,
	    								:other_speak,:other_write,:other_read,:other_formal, :other)
	end


	def profile_progression
      @profile_progress = -3
      @total_profile_questions = 7

      @DBprogress = Progress.find_by(:user_id=> @user_id)       
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
      @DBprogress.profile_progress = @profile_progress
      @DBprogress.save
  end

end
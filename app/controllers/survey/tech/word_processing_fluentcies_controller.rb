class Survey::Tech::WordProcessingFluentciesController < ApplicationController

def update
	@user = current_user
	@word = WordProcessingFluentcy.find_by(:user_id=>@user.user_id)
	@word.update_attributes(word_params)
	word_progression()
	
	respond_to do |f|		
		 f.js
	end
end

	private

	def word_params
		params.require(:word_processing_fluency).permit(:word,:pages,:writer,:magnitude_other,:other)
	end

	def word_progression
	    @word_progress = -6
	    @total_word_questions = -8  #minus the 3 id values and 2 other values

	    @DBprogress = Progress.find_by(:user_id=> @user.user_id)
	    @word = WordProcessingSkill.find_by(:user_id=> @user.user_id)
	    @word_fluent = WordProcessingFluentcy.find_by(:user_id=> @user.user_id)

	    if @word.nil?
	      @word_progress = 0
	    else
	      @word.attributes.each do |attr_name, attr_value|
	      	@total_word_questions += 1
	        if attr_value != 0
	          @word_progress += 1
	        end
	      end

	      @word_fluent.attributes.each do |attr_name, attr_value|
	      	@total_word_questions += 1
	        if (attr_value != 0 && attr_name != "other" && attr_name != "magnitude_other")
	          @word_progress += 1
	        end
	      end
	    end

	    @word_progress = (@word_progress*100)/@total_word_questions
	    @DBprogress.word_progress = @word_progress
	    @DBprogress.save
  end 

end
class Survey::Tech::WordProcessingSkillsController < ApplicationController

def update
	@user = current_user
	@word = WordProcessingSkill.find_by(:user_id=>@user.user_id)
	@word.update_attributes(word_params)
	word_progression()
	respond_to do |f|		
		 f.js { render 'shared/ajax/word_processing_a.js.erb' }
	end

end

	private

	def word_params
		params.require(:word_processing_skill).permit(:q1,:q2,:q3,:q4,:q5,:q6,:q7,:q8,:q9,:q10,:q11,:q12,:q13,:q14,:q15,
			:q16,:q17,:q18,:q19,:q20)
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
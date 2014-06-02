class Survey::Tech::WordProcessingSkillsController < ApplicationController

def update
	@user = current_user
	@word = WordProcessingSkill.find_by(:user_id=>@user.user_id)
	@word.update_attributes(word_params)
	redirect_to survey_path(@user,:type=> 3,:tech=>0,:word=>1)
end

	private

	def word_params
		params.require(:word_processing_skill).permit(:q1,:q2,:q3,:q4,:q5,:q6,:q7,:q8,:q9,:q10,:q11,:q12,:q13,:q14,:q15,
			:q16,:q17,:q18,:q19,:q20)
	end

end
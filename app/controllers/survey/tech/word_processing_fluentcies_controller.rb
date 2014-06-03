class Survey::Tech::WordProcessingFluentciesController < ApplicationController

def update
	@user = current_user
	@word = WordProcessingFluentcy.find_by(:user_id=>@user.user_id)
	@word.update_attributes(word_params)
	redirect_to survey_path(@user,:type=> 3, :word=>0)
end

	private

	def word_params
		params.require(:word_processing_fluentcy).permit(:word,:pages,:writer,:magnitude_other,:other)
	end

end
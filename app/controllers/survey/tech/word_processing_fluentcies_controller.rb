class Survey::Tech::WordProcessingFluentciesController < ApplicationController

def update
	@user = current_user
	@word = WordProcessingFluentcy.find_by(:user_id=>@user.user_id)
	@word.update_attributes(word_params)
	
	respond_to do |f|		
		 f.js
	end
end

	private

	def word_params
		params.require(:word_processing_fluentcy).permit(:word,:pages,:writer,:magnitude_other,:other)
	end

end
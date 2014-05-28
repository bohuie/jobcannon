class LanguagesController < ApplicationController

	def update

		@user = current_user
		@language = Language.find_by(:user_id => @user.user_id)	
		@language.user_id = current_user.user_id
		@language.update_attributes(language_params)						
		redirect_to root_path
		
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

end
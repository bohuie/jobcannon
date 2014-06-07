class Survey::Tech::EmailSkillsController < ApplicationController

def update
	@user = current_user
	@email = EmailSkill.find_by(:user_id=>@user.user_id)
	@email.update_attributes(email_params)
	

	respond_to do |f|		
		 f.js { render 'shared/ajax/email_a.js.erb' }
	end
end

	private

	def email_params
		params.require(:email_skill).permit(:q1,:q2,:q3,:q4,:q5,:q6,:q7,:q8,:q9,:q10,:q11,:q12,:q13,:q14,:q15,
			:q16)
	end

end
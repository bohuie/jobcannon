class Survey::Tech::BasicComputerSkillsController < ApplicationController

def update
	
	@user = current_user
	@basic = BasicComputerSkill.find_by(:user_id=>@user.user_id)
	@basic.update_attributes(basic_params)
	#redirect_to survey_path(@user,:type=> 3,:tech=>1)

	respond_to do |f|		
		 f.js { render 'shared/ajax/basic_computer_a.js.erb' }
	end
end

	private

	def basic_params
		params.require(:basic_computer_skill).permit(:q1,:q2,:q3,:q4,:q5,:q6,:q7,:q8,:q9,:q10,:q11,:q12,:q13,:q14,:q15,
			:q16,:q17,:q18,:q19,:q20,:q21,:q22)
	end
end
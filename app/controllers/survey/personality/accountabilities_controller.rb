class Survey::Personality::AccountabilitiesController < ApplicationController

def update
	
	@user = current_user
	@com = Accountability.find_by(:user_id=>@user.user_id)
	@com.update_attributes(accountability_params)	
	respond_to do |f|
		f.js
	end	
end

	private

	def accountability_params
		params.require(:accountability).permit(:q1,:q2,:q3,:q4,:q5,:q6, :user_id)
	end

end
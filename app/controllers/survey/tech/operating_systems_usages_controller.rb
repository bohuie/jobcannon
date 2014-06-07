class Survey::Tech::OperatingSystemsUsagesController < ApplicationController

def update
	
	@user = current_user
	@osu = OperatingSystemsUsage.find_by(:user_id=>@user.user_id)
	@osu.update_attributes(os_params)
	#redirect_to survey_path(@user,:type=> 3,:tech=>2)

	respond_to do |f|
		#f.js render(partial: 'shared/survey/tech/basic_computer_b.html.erb')
		 f.js { render 'shared/ajax/basic_computer_b.js.erb' }
	end
end

def show
end

	private

	def os_params
		params.require(:operating_systems_usage).permit(:windows,:mac,:linux,:other)
	end

end
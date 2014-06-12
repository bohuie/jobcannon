class ExperiencetablesController < ApplicationController

	def update							
	end 

	def employ_update
		@user = current_user
		@exp_vol = Experiencetable.find_by(:user_id => @user.user_id,:employ => true)
		@exp_vol.update_attributes(employ_params)
		respond_to do |f|
			f.js
		end
	end

	def pt_update
		@user = current_user
		@exp_vol = Experiencetable.find_by(:user_id => @user.user_id,:part_time => true)
		@exp_vol.update_attributes(work_params)
		respond_to do |f|
			f.js
		end
	end

	def ft_update
		@user = current_user
		@exp_vol = Experiencetable.find_by(:user_id => @user.user_id,:full_time => true)		
		@exp_vol.update_attributes(work_params)
		respond_to do |f|
			f.js
		end	
	end

	def vol_update
		@user = current_user
		@exp_vol = Experiencetable.find_by(:user_id => @user.user_id,:volunteer => true)
		@exp_vol.update_attributes(vol_params)
		respond_to do |f|
			f.js
		end
	end

	private

	def employ_params
		params.require(:experiencetable).permit(:agriculture,:mining,:utilities,:construction,
		 	:manufacturing,:wholesale,:retail,:transport,:information,:finance,:real_estate,:professional,:managment,
		 	:administrative,:education,:health,:arts,:accomodation,:public,:other,:user_id)
	end

	def vol_params
		 params.require(:experiencetable).permit(:vol_worked,:vol_hours,:agriculture,:mining,:utilities,:construction,
		 	:manufacturing,:wholesale,:retail,:transport,:information,:finance,:real_estate,:professional,:managment,
		 	:administrative,:education,:health,:arts,:accomodation,:public,:other, :volunteer,:user_id)
	end

	def work_params
		params.require(:experiencetable).permit(:years_worked,:months_worked,:agriculture,:mining,:utilities,:construction,
		 	:manufacturing,:wholesale,:retail,:transport,:information,:finance,:real_estate,:professional,:managment,
		 	:administrative,:education,:health,:arts,:accomodation,:public,:other,:user_id)
	end
end
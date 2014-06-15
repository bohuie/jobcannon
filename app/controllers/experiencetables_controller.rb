class ExperiencetablesController < ApplicationController

	def update							
	end 

	def employ_update
		@user = current_user
		@exp_vol = Experiencetable.find_by(:user_id => @user.user_id,:employ => true)
		@exp_vol.update_attributes(employ_params)
		experience_progression()
		respond_to do |f|
			f.js
		end
	end

	def pt_update
		@user = current_user
		@exp_vol = Experiencetable.find_by(:user_id => @user.user_id,:part_time => true)
		@exp_vol.update_attributes(work_params)
		experience_progression()
		respond_to do |f|
			f.js
		end
	end

	def ft_update
		@user = current_user
		@exp_vol = Experiencetable.find_by(:user_id => @user.user_id,:full_time => true)		
		@exp_vol.update_attributes(work_params)
		experience_progression()
		respond_to do |f|
			f.js
		end	
	end

	def vol_update
		@user = current_user
		@exp_vol = Experiencetable.find_by(:user_id => @user.user_id,:volunteer => true)
		@exp_vol.update_attributes(vol_params)
		experience_progression()
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
		 params.require(:experiencetable).permit(:vol_work,:vol_hours,:agriculture,:mining,:utilities,:construction,
		 	:manufacturing,:wholesale,:retail,:transport,:information,:finance,:real_estate,:professional,:managment,
		 	:administrative,:education,:health,:arts,:accomodation,:public,:other, :volunteer,:user_id)
	end

	def work_params
		params.require(:experiencetable).permit(:years_worked,:months_worked,:agriculture,:mining,:utilities,:construction,
		 	:manufacturing,:wholesale,:retail,:transport,:information,:finance,:real_estate,:professional,:managment,
		 	:administrative,:education,:health,:arts,:accomodation,:public,:other,:user_id)
	end

	def experience_progression
	    @experience_progress = -16
	    @total_experience_questions = 10
	    @a1 = 0
	    @a2 = 0
	    @a3 = 0
	    @a4 = 0

	    @DBprogress = Progress.find_by(:user_id => @user.user_id)
	    @full_time = Experiencetable.find_by(:user_id => @user.user_id, :full_time => true)
	    @part_time = Experiencetable.find_by(:user_id => @user.user_id, :part_time => true)
	    @employ = Experiencetable.find_by(:user_id => @user.user_id, :employ => true) 
	    @volunteer = Experiencetable.find_by(:user_id => @user.user_id, :volunteer => true)

	    if (@full_time.nil?) 
	        @experience_progress =0
	    else 
	        @full_time.attributes.each do |attr_name, attr_value|
	            if (attr_value != false && attr_value != nil && attr_value != "" && attr_name != "other")               
	              if (attr_value == true && attr_name != "full_time")
	                @a1 = 1              
	                puts "This is true in full time"
	              else
	                @experience_progress += 1
	                puts "This is a number in full time"
	              end
	            end
	        end

	        @part_time.attributes.each do |attr_name, attr_value|
	            if (attr_value != false && attr_value != nil && attr_value != "" && attr_name != "other") 
	              if (attr_value == true && attr_name != "part_time")
	                @a2 = 1	                
	              else
	                @experience_progress += 1	                
	              end            
	            end
	        end

	        @employ.attributes.each do |attr_name, attr_value|
	            if (attr_value != false && attr_value != nil && attr_value != "" && attr_name != "other") 
	              if (attr_value == true && attr_name != "employ")
	                @a3 = 1        	                
	              else
	                @experience_progress += 1	                
	              end     
	            end
	        end

	        @volunteer.attributes.each do |attr_name, attr_value|
	            if (attr_value != false && attr_value != nil && attr_value != "" && attr_name != "other") 
	              if (attr_value == true && attr_name != "volunteer")
	                @a4 = 1 	                
	              else
	                @experience_progress += 1	                
	              end     
	            end

	            if(attr_name=="vol_work" && attr_value == true)
	            	@experience_progress +=1
	            end
	        end
	    end  
	    @experience_progress += @a1 + @a2 + @a3 + @a4  
	    puts @experience_progress    
	    @experience_progress = (100*@experience_progress)/@total_experience_questions

	    @DBprogress.experience_progress = @experience_progress
	    @DBprogress.save
  end

end
class SurveysController < ApplicationController

	def index
		@user = current_user
		@survey = Survey.new
	end
	def show
		@user = current_user
		@survey_type = params[:type]

		@profile = Surveyprofile.find_by(:user_id => @user.user_id)		
		@language = Language.find_by(:user_id => @user.user_id)

		@full_time = Experiencetable.find_by(:user_id => @user.user_id, :full_time => true)
		@part_time = Experiencetable.find_by(:user_id => @user.user_id, :part_time => true)
		@employ = Experiencetable.find_by(:user_id => @user.user_id, :employ => true) 
		@volunteer = Experiencetable.find_by(:user_id => @user.user_id, :volunteer => true) 
		

		@communication = Communication_skill.find_by(:user_id=>@user.user_id)
		@thinking = Thinking_skill.find_by(:user_id=>@user.user_id)
		@self = Self_direction_skill.find_by(:user_id=>@user.user_id)
		@accountability = Accountability.find_by(:user_id=>@user.user_id)
		@interpersonal = Interpersonal_skill.find_by(:user_id=>@user.user_id)



		if (@profile.nil?)
			@profile = Surveyprofile.new
			@profile.user_id = current_user.user_id
			@profile.save

			@language = Language.new
			@language.user_id = @user.user_id
			@language.save

			@full_time = Experiencetable.new
			@full_time.user_id = @user.user_id
			@full_time.full_time = true
			@full_time.save

			@part_time = Experiencetable.new
			@part_time.user_id = @user.user_id
			@part_time.part_time = true
			@part_time.save

			@volunteer = Experiencetable.new
			@volunteer.user_id = @user.user_id
			@volunteer.volunteer = true
			@volunteer.save

			@employ = Experiencetable.new
			@employ.user_id = @user.user_id
			@employ.employ = true
			@employ.save


			@communication = Communication_skill.new
			@communication.user_id = @user.user_id
			@communication.save

			@thinking = Thinking_skill.new
			@thinking.user_id = @user.user_id
			@thinking.save

			@self = Self_direction_skill.new
			@self.user_id = @user.user_id
			@self.new

			@accountability = Accountability.new
			@accountability.user_id = @user.user_id
			@accountability.save

			@interpersonal = Interpersonal_skill.new
			@interpersonal.user_id= @user.user_id
			@interpersonal.save
			
		end
				
	end
	def create		
		@survey = Surveyprofile.new(survey_params)
		@survey.user_id = current_user.user_id
		@survey.save
		redirect_to root_path
	end

	def add
		
	end

end
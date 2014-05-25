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

		if (@profile.nil?)
			@profile = Surveyprofile.new
			@profile.user_id = current_user.user_id
			@profile.save
		end

		if(@language.nil?)
			@language = Language.new
			@language.user_id = @user.user_id
			@language.save
		end
		
	end
	def create
		puts "MATT WAS HEREEEEE!!!!!!!!!!!!!"
		@survey = Surveyprofile.new(survey_params)
		@survey.user_id = current_user.user_id
		@survey.save
		redirect_to root_path
	end

	def add
		
	end

end
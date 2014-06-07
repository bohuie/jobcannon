class SurveysController < ApplicationController

	def index
		@user = current_user
		@survey = Survey.new
	end
	def show

		 $header1 = "Completely Fluent" 
		 $header2 = "Quite Fluent" 
		 $header3 = "Somewhat Fluent" 
		 $header4 = "Minimal Fluency" 
		 $header5 = "Not Fluent" 
		 $header6 = "I don't know" 

		 $header7 = "Very Easy" 
		 $header8 = "Easy" 
		 $header9 = "Neutral" 
		 $header10 = "Difficult" 
		 $header11 = "Very Difficult" 
		 $header12 = "I don't know what this is" 

		 $header13 = "Disagree" 
		 $header14 = "Somewhat Disagree" 
		 $header15 = "Neutral" 
		 $header16 = "Somewhat Agree"
		 $header17 = "Agree" 

		 $header13 = "Yes, I have used this" 
		 $header14 = "No, I have not used this" 
		 $header15 = "Not sure"

		 $other = "Other" 
		 $other_label = "If Other Please Specify" 
		 $continue = "Save & Continue" 
		 $submit = "Submit"
		 $previous = "Previous" 


		@user = current_user
		@survey_type = params[:type]
		@tech = params[:tech]
		@word_a = params[:word]
		@pres = params[:pres]
		@em = params[:email]
		@internet = params[:internet]
		@social = params[:social]
		@online = params[:online]
		@med = params[:media]

		if @internet.nil?
			@internet='0'
		end

		@profile = Surveyprofile.find_by(:user_id => @user.user_id)		
		@language = Language.find_by(:user_id => @user.user_id)

		@full_time = Experiencetable.find_by(:user_id => @user.user_id, :full_time => true)
		@part_time = Experiencetable.find_by(:user_id => @user.user_id, :part_time => true)
		@employ = Experiencetable.find_by(:user_id => @user.user_id, :employ => true) 
		@volunteer = Experiencetable.find_by(:user_id => @user.user_id, :volunteer => true) 
		
		@communication = CommunicationSkill.find_by(:user_id=>@user.user_id)
		@thinking = ThinkingSkill.find_by(:user_id=>@user.user_id)
		@self = SelfDirectionSkill.find_by(:user_id=>@user.user_id)
		@accountability = Accountability.find_by(:user_id=>@user.user_id)
		@interpersonal = InterpersonalSkill.find_by(:user_id=>@user.user_id)

		
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

			@communication = CommunicationSkill.new
			@communication.user_id = @user.user_id
			@communication.save

			@thinking = ThinkingSkill.new
			@thinking.user_id = @user.user_id
			@thinking.save

			@self = SelfDirectionSkill.new
			@self.user_id = @user.user_id
			@self.save

			@accountability = Accountability.new
			@accountability.user_id = @user.user_id
			@accountability.save

			@interpersonal = InterpersonalSkill.new
			@interpersonal.user_id= @user.user_id
			@interpersonal.save

			@basic = BasicComputerSkill.new
			@basic.user_id = @user.user_id
			@basic.save

			@os = OperatingSystemsUsage.new
			@os.user_id = @user.user_id
			@os.save

			@fluent = OperatingSystemsFluent.new
			@fluent.user_id = @user.user_id
			@fluent.save

			@advanced = AdvancedComputerSkill.new
			@advanced.user_id = @user.user_id
			@advanced.save

			@media = MultiMediaSkill.new
			@media.user_id = @user.user_id
			@media.save

			@tech_diff = TechnologyDifference.new
			@tech_diff.user_id = @user.user_id
			@tech_diff.save

			@word = WordProcessingSkill.new
			@word.user_id=@user.user_id
			@word.save

			@word_fluent = WordProcessingFluentcy.new
			@word_fluent.user_id = @user.user_id
			@word_fluent.save

			@spreadsheet = SpreadsheetSkill.new
			@spreadsheet.user_id = @user.user_id
			@spreadsheet.save

			@spreadsheet_fluentcy = SpreadsheetFluentcy.new
			@spreadsheet_fluentcy.user_id = @user.user_id
			@spreadsheet_fluentcy.save 

			@present = PresentingSkill.new
			@present.user_id = @user.user_id
			@present.save

			@present_fluentcy = PresentingFluentcy.new
			@present_fluentcy.user_id = @user.user_id
			@present_fluentcy.save 

			@email = EmailSkill.new
			@email.user_id = @user.user_id
			@email.save

			@email_fluentcy = EmailFluentcy.new
			@email_fluentcy.user_id = @user.user_id
			@email_fluentcy.save 

			@internetterm = InternetTerm.new
			@internetterm.user_id = @user.user_id
			@internetterm.save 

			@internettask = InternetTask.new
			@internettask.user_id = @user.user_id
			@internettask.save

			@internetconnection = InternetConnection.new
			@internetconnection.user_id = @user.user_id
			@internetconnection.save

			@browser = Browser.new
			@browser.user_id = @user.user_id
			@browser.save

			@socialmedia = SocialMediaSkill.new
			@socialmedia.user_id = @user.user_id
			@socialmedia.save

			@socialmediadesc = SocialMediaDesc.new
			@socialmediadesc.user_id = @user.user_id
			@socialmediadesc.save

			@socialmediaplat = SocialMediaPlatform.new
			@socialmediaplat.user_id = @user.user_id
			@socialmediaplat.save

			@onlinecolab = OnlineColabSkill.new
			@onlinecolab.user_id = @user.user_id
			@onlinecolab.save

			@onlinecolab_fluentcy = OnlineColabFluentcy.new
			@onlinecolab_fluentcy.user_id = @user.user_id
			@onlinecolab_fluentcy.save
		end		
	end

	def create		
		@survey = Surveyprofile.new(survey_params)
		@survey.user_id = current_user.user_id
		@survey.save
		redirect_to root_path
	end

	def back
		
		@file = params[:file]

		redirect_to root_path
	end

end
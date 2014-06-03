class SurveysController < ApplicationController

	def index
		@user = current_user
		@survey = Survey.new
	end
	def show
		@user = current_user
		@survey_type = params[:type]
		@tech = params[:tech]
		@word_a = params[:word]
		@pres = params[:pres]
		@em = params[:email]
		@internet = params[:internet]
		@social = params[:social]

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

		@basic = BasicComputerSkill.find_by(:user_id=> @user.user_id)
		@os = OperatingSystemsUsage.find_by(:user_id=> @user.user_id)
		@fluent = OperatingSystemsFluent.find_by(:user_id=> @user.user_id)

		@advanced = AdvancedComputerSkill.find_by(:user_id=> @user.user_id)	

		@media = MultiMediaSkill.find_by(:user_id=> @user.user_id)
		@tech_diff = TechnologyDifference.find_by(:user_id=> @user.user_id)

		@word = WordProcessingSkill.find_by(:user_id=> @user.user_id)
		@word_fluent = WordProcessingFluentcy.find_by(:user_id=> @user.user_id)

		@spreadsheet = SpreadsheetSkill.find_by(:user_id=> @user.user_id)
		@spreadsheet_fluentcy = SpreadsheetFluentcy.find_by(:user_id=> @user.user_id)

		@present = PresentingSkill.find_by(:user_id=> @user.user_id)
		@present_fluentcy = PresentingFluentcy.find_by(:user_id=> @user.user_id)

		@email = EmailSkill.find_by(:user_id=> @user.user_id)
		@email_fluentcy = EmailFluentcy.find_by(:user_id=> @user.user_id)

		@internetterm = InternetTerm.find_by(:user_id=> @user.user_id)
		@internettask = InternetTask.find_by(:user_id=> @user.user_id)
		@internetconnection = InternetConnection.find_by(:user_id=> @user.user_id)
		@browser = Browser.find_by(:user_id=> @user.user_id)


		@socialmedia = SocialMediaSkill.find_by(:user_id=> @user.user_id)
		@socialmediadesc = SocialMediaDesc.find_by(:user_id=> @user.user_id)
		@socialmediaplat = SocialMediaPlatform.find_by(:user_id=> @user.user_id)

		@onlinecolab = OnlineColabSkill.find_by(:user_id=> @user.user_id)
		@onlinecolab_fluentcy = OnlineColabFluentcy.find_by(:user_id=> @user.user_id)

		
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

	def add
		
	end

end
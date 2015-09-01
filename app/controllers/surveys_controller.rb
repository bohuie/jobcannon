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
		
		@communication = CommunicationSkill.find_by(:user_id=>@user.user_id)
		@thinking = ThinkingSkill.find_by(:user_id=>@user.user_id)
		@self = SelfDirectionSkill.find_by(:user_id=>@user.user_id)
		@accountability = Accountability.find_by(:user_id=>@user.user_id)
		@interpersonal = InterpersonalSkill.find_by(:user_id=>@user.user_id)

		@profile = Surveyprofile.find_by(:user_id => @user.user_id)
		@progress = Progress.find_by(:user_id=> @user_id)  
		if(@progress.nil?)
			@progress = Progress.new
			@progress.user_id = current_user.user_id
			@progress.save
		end

		
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
		@file = params[:file]
		@id = params[:div]
		puts "THIS IS THE SHOW METHOD IN THE SURVEY CONTROLLER"
		puts @file
		unless @file.nil?
			respond_to do |f|		
				f.js { render 'shared/ajax/previous.js.erb' }
			end
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
		@id = params[:div]
		puts "THIS IS THE BACK METHOD IN THE SURVEY CONTROLLER"
		puts @id
		respond_to do |f|		
			f.js { render 'shared/ajax/previous.js.erb' }
		end
	end

	def results
		@profile = getProfile()
	end

	def getProfile
		result = Hash.new;
		result['numResponses'] = Surveyprofile.count('user_id', :distinct => true);
		ages = [];
		@less15 = Surveyprofile.where('birthday > ?', Time.now - 15.years).count();
		@less17 = Surveyprofile.where('birthday > ?', Time.now - 17.years).count();
		@less19 = Surveyprofile.where('birthday > ?', Time.now - 19.years).count();
		@less21 = Surveyprofile.where('birthday > ?', Time.now - 21.years).count();
		@less23 = Surveyprofile.where('birthday > ?', Time.now - 23.years).count();
		@greater23 = Surveyprofile.where('birthday > ?', Time.now - 23.years).count();
		ages.push(@less15);
		ages.push(@less17 - @less15);
		ages.push(@less19 - @less17);
		ages.push(@less21 - @less19);
		ages.push(@less23 - @less21);
		ages.push(@greater23 - @less23);
		result['ages'] = ages.to_json;

		genders = [];
		genders.push(Surveyprofile.where(gender: 'Male').count());
		genders.push(Surveyprofile.where(gender: 'Female').count());
		genders.push(Surveyprofile.where(gender: 'Other').count());
		result['genders'] = genders.to_json;

		education = [];
		education.push(Surveyprofile.where(education: 'Grade 9').count());
		education.push(Surveyprofile.where(education: 'Grade 10').count());
		education.push(Surveyprofile.where(education: 'Grade 11').count());
		education.push(Surveyprofile.where(education: 'Grade 12').count());
		education.push(Surveyprofile.where(education: 'High School').count());
		education.push(Surveyprofile.where(education: 'Some College').count());
		education.push(Surveyprofile.where(education: 'College').count());
		education.push(Surveyprofile.where(education: 'Some University').count());
		education.push(Surveyprofile.where(education: 'Some Graduate Studies').count());
		education.push(Surveyprofile.where(education: 'Masters').count());
		education.push(Surveyprofile.where(education: 'Doctorial Degree').count());
		result['education'] = education.to_json;

		return result
	end
end
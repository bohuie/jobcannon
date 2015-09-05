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
		@profile = getProfile();
		@personality = getPersonality();
	end

	def getProfile
		result = Hash.new;
		result['numResponses'] = Surveyprofile.count('user_id', :distinct => true);

		ageLabels = ['<15', '15-16', '17-18', '19-20', '21-22', '23+'];
		result['ageLabels'] = ageLabels.to_json;
		result['ages'] = getAges().to_json;

		genderLabels = ['Male', 'Female', 'Other'];
		result['genderLabels'] = genderLabels.to_json;
		result['genders'] = getGenders(genderLabels).to_json;

		educationLabels = ['Grade 9','Grade 10','Grade 11','Grade 12',
	  	'High School','Some College','College','Some University',
	  	'Some Graduate Studies','Masters','Doctorial Degree'];
		result['educationLabels'] = educationLabels.to_json;
		result['education'] = getEducation(educationLabels).to_json;

		languageLabels = ['English', 'French', 'Spanish', 'Tagalog', 
			'Mandarin', 'Cantonese', 'Punjabi', 'Urdu', 'Tamil', 
			'Persian (Farsi)', 'Italian', 'Other'];
		languageCategories = ['Read', 'Write', 'Speak', 'Formal Instruction'];
		result['languageLabels'] = languageLabels;
		result['languageCategories'] = languageCategories;
		result['languages'] = getLanguages().to_json;
		return result
	end

	def getAges
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
		return ages;		
	end

	def getGenders(labels)
		genders = [];
		labels.each do |l|
			genders.push(Surveyprofile.where(gender: l).count());
		end	
		return genders;
	end

	def getEducation(labels)
		education = [];
		labels.each do |l|
			education.push(Surveyprofile.where(education: l).count());
		end
		return education;
	end

	def getLanguages()
		languages = [];
		english = [];
		english.push(Language.where(eng_speak: true).count());
		english.push(Language.where(eng_read: true).count());
		english.push(Language.where(eng_write: true).count());
		english.push(Language.where(eng_formal: true).count());
		french = [];
		french.push(Language.where(fren_speak: true).count());
		french.push(Language.where(fren_read: true).count());
		french.push(Language.where(fren_write: true).count());
		french.push(Language.where(fren_formal: true).count());
		spanish = [];
		spanish.push(Language.where(spnish_speak: true).count());
		spanish.push(Language.where(spnish_read: true).count());
		spanish.push(Language.where(spnish_write: true).count());
		spanish.push(Language.where(spnish_formal: true).count());
		tagalog = [];
		tagalog.push(Language.where(tagalog_speak: true).count());
		tagalog.push(Language.where(tagalog_read: true).count());
		tagalog.push(Language.where(tagalog_write: true).count());
		tagalog.push(Language.where(tagalog_formal: true).count());
		mandarin = [];
		mandarin.push(Language.where(mandarin_speak: true).count());
		mandarin.push(Language.where(mandarin_read: true).count());
		mandarin.push(Language.where(mandarin_write: true).count());
		mandarin.push(Language.where(mandarin_formal: true).count());
		cantonese = [];
		cantonese.push(Language.where(cantonese_speak: true).count());
		cantonese.push(Language.where(cantonese_read: true).count());
		cantonese.push(Language.where(cantonese_write: true).count());
		cantonese.push(Language.where(cantonese_formal: true).count());
		punjabi = [];
		punjabi.push(Language.where(punjabi_speak: true).count());
		punjabi.push(Language.where(punjabi_read: true).count());
		punjabi.push(Language.where(punjabi_write: true).count());
		punjabi.push(Language.where(punjabi_formal: true).count());
    urdu = [];
		urdu.push(Language.where(urdu_speak: true).count());
		urdu.push(Language.where(urdu_read: true).count());
		urdu.push(Language.where(urdu_write: true).count());
		urdu.push(Language.where(urdu_formal: true).count());
    tamil = [];
		tamil.push(Language.where(tamil_speak: true).count());
		tamil.push(Language.where(tamil_read: true).count());
		tamil.push(Language.where(tamil_write: true).count());
		tamil.push(Language.where(tamil_formal: true).count());
    persian = [];
		persian.push(Language.where(persian_speak: true).count());
		persian.push(Language.where(persian_read: true).count());
		persian.push(Language.where(persian_write: true).count());
		persian.push(Language.where(persian_formal: true).count());
		italian = [];
		italian.push(Language.where(italian_speak: true).count());
		italian.push(Language.where(italian_read: true).count());
		italian.push(Language.where(italian_write: true).count());
		italian.push(Language.where(italian_formal: true).count());
		other = [];
		other.push(Language.where(other_speak: true).count());
		other.push(Language.where(other_read: true).count());
		other.push(Language.where(other_write: true).count());
		other.push(Language.where(other_formal: true).count());
		languages.push(english);
		languages.push(french);
		languages.push(spanish);
		languages.push(tagalog);
		languages.push(mandarin);
		languages.push(cantonese);
		languages.push(punjabi);
		languages.push(urdu);
		languages.push(tamil);
		languages.push(persian);
		languages.push(italian);
		languages.push(other);
		return languages;
	end

	def getPersonality
		result = Hash.new;

		communicationLabels = ['Listen', 'Disagreement', 'Respect', 'Clear',
			'Beyond: Group', 'Beyond: Alone', 'Clear Opinions', 'Different Views',
			'Evidence', 'Language', 'Audience'];
		thinkingLabels = ['Ideas with Guidelines', 'Ideas without Guidelines',
		  'Prefer Group', 'Several Solutions',
			'All Solutions', 'Viewpoints', 'Sub-goals', 'Think Ahead'];
		selfLabels = ['Independent', 'Organize', 'Persevere', 'Ask Others',
			'Consider Others', 'Reflect', 'Not Worry Others', 'Not Worry Mistakes',
			'Support Unpopular', 'Not Clear Solutions', 'Try Again'];
		accountabilityLabels = ['Punctual', 'Question', 'Professional', 'Efficient',
			'Variety of Tools', 'Communicate'];
		interpersonalLabels = ['Manage Conflict', 'Listen', 'Aware', 'Consider',
			'Involved', 'Body Language'];
		categories = ['Disagree', 'Somewhat Disagree', 'Not Sure',
			'Somewhat Agree', 'Agree'];
		result['communicationLabels'] = communicationLabels.to_json;
		result['thinkingLabels'] = thinkingLabels.to_json;
		result['selfLabels'] = selfLabels.to_json;
		result['accountabilityLabels'] = accountabilityLabels.to_json;
		result['interpersonalLabels'] = interpersonalLabels.to_json;
		result['categories'] = categories.to_json;
		result['communication'] = getCommunication().to_json;
		result['thinking'] = getThinking().to_json;
		result['self'] = getSelfDirection().to_json;
		result['accountability'] = getAccountability().to_json;
		result['interpersonal'] = getInterpersonal().to_json;

		return result
	end

	def getCommunication
		communication = [];
		(1..11).each do |q|
			questionArray = []
			(1..5).each do |a|
				question = 'q'+q.to_s;
				questionArray.push(CommunicationSkill.where(''+question+' = ?', a).count());
			end
			communication.push(questionArray);
		end

		return communication;
	end

	def getThinking
		thinking = [];
		(1..8).each do |q|
			questionArray = []
			(1..5).each do |a|
				question = 'q'+q.to_s;
				questionArray.push(ThinkingSkill.where(''+question+' = ?', a).count());
			end
			thinking.push(questionArray);
		end

		return thinking;
	end

	def getSelfDirection
		direction = [];
		(1..11).each do |q|
			questionArray = []
			(1..5).each do |a|
				question = 'q'+q.to_s;
				questionArray.push(SelfDirectionSkill.where(''+question+' = ?', a).count());
			end
			direction.push(questionArray);
		end

		return direction;
	end

	def getAccountability
		accountability = [];
		(1..6).each do |q|
			questionArray = []
			(1..5).each do |a|
				question = 'q'+q.to_s;
				questionArray.push(Accountability.where(''+question+' = ?', a).count());
			end
			accountability.push(questionArray);
		end

		return accountability;
	end

	def getInterpersonal
		interpersonal = [];
		(1..6).each do |q|
			questionArray = []
			(1..5).each do |a|
				question = 'q'+q.to_s;
				questionArray.push(InterpersonalSkill.where(''+question+' = ?', a).count());
			end
			interpersonal.push(questionArray);
		end

		return interpersonal;
	end

end
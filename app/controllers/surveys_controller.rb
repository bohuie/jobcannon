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

		 $header18 = 'Yes'
		 $header19 = 'No'
		 $header20 = 'Not Sure' 

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

			@spreadsheet_fluency = SpreadsheetFluentcy.new
			@spreadsheet_fluency.user_id = @user.user_id
			@spreadsheet_fluency.save 

			@present = PresentingSkill.new
			@present.user_id = @user.user_id
			@present.save

			@present_fluency = PresentingFluentcy.new
			@present_fluency.user_id = @user.user_id
			@present_fluency.save 

			@email = EmailSkill.new
			@email.user_id = @user.user_id
			@email.save

			@email_fluency = EmailFluentcy.new
			@email_fluency.user_id = @user.user_id
			@email_fluency.save 

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

			@onlinecolab_fluency = OnlineColabFluentcy.new
			@onlinecolab_fluency.user_id = @user.user_id
			@onlinecolab_fluency.save			

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
		@technology = getTechnology();
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

	def getTechnology
		$header21 = "I don't know what this is" 
		$header22 = "I know what this is but I don't know how to use it"
		$header23 = "I know what this is and know how to use it"
		$header24 = "I am able to connect using this type of connection"
		$header25 = "I am able to configure this type of connection"
		$header26 = "I am able to trouble shoot this type of connection"

		$header27 = "I don't know what this is"
		$header28 = "I know what this is but I don't know how to use it"
		$header29 = "I know what this is and know how to use it"
		$header30 = "I know what this is and can use it a little"
		$header31 = "I know what this is and can use it somewhat"
		$header32 = "I know what this is and can use it well"
		$header33 = "I know what this is and am very skill in its use"
		 
		$header34 = "Does not describe me at all"
		$header35 = "Does not describe me"
		$header36 = "Describes me a little"
		$header37 = "Describes me"
		$header38 = "Describes me a lot" 
		result = Hash.new;
		result['basicLabels'] = ['Find', 'Start', 'Switch', 'Create File',
			'Save Hard Drive', 'Save CD', 'Save USB', 'Export', 'Exit',
			'Log Off', 'Shut Down', 'Write Email', 'Listen CD', 'Watch DVD', 
			'Mouse', 'Track Pad', 'Keyboard', 'Microphone', 'Camera', 'Scanner',
			'Webcam', 'Connect Device'].to_json;
		result['OSUsageLabels'] = ['Windows', 'Mac', 'Linux'].to_json;
		result['OSFluentLabels'] = ['Windows', 'Mac', 'Linux'].to_json;
		result['advancedLabels'] = ['Determine Installed RAM', 
			'Determine Required RAM', 'Determine OS', 'Select Software', 
			'Install Antivirus', 'Update Software'].to_json;
		result['multiMediaLabels'] = ['Create and use image',
			'Create and ue audio', 'Create and use video', 'Edit video',
			'Add graphics to video'].to_json;
		result['techDifferenceLabels'] = ['Digital Analog Differnece',
			'Interface', 'Cross-platform Font'].to_json;
		result['wordProcessingSkillLabels'] = ['Create New', 'Save', 
			'Cut, Copy, Paste', 'Change Font', 'Spell-check', 'Change Alignment',
			'Change Spacing', 'Set Margins', 'Change Orientation', 'Add Pages #s',
			'Add Header', 'Create List', 'Change Tab', 'Insert Images', 
			'Clipart', 'Create Table', 'Annotate', 'Add ToC', 'Add Section',
			'Add References'].to_json;
		result['wordProcessingFluentcyLabels'] = ['Word', 'Pages',
			'Wrtier','Other'].to_json;
		result['spreadsheetSkillLabels'] = ['Create', 'Save', 'Multiple Sheets',
			'Cut, Copy, Paste', 'Format Cells', 'Formulas', 'Create Equations', 
			'Create Charts', 'Sort', 'Filter', 'Delete/Insert Cells', 'Hide/Unhide',
			'Freeze Panes', 'Calcualte', 'Reference'].to_json;
		result['spreadsheetFluentcyLabels'] = ['Excel', 'Numbers', 'Calc',
			'Other'].to_json;
		result['presentingSkillLabels'] = ['Create', 'Save', 'Cut, Copy, Paste',
			'Design', 'Images', 'Video', 'Audio', 'Charts', 'Change Style',
			'Layout', 'Animations', 'Transitions', 'Timed', 'Music', 'Page #s',
			'Footers', 'Preview'].to_json;
		result['presentingFluentcyLabels'] = ['PowerPoint', 'Keynote',
			'Impress', 'Prezi', 'Other'].to_json;
		result['emailSkillLabels'] = ['Create Account', 'Activate Account',
			'Reset Password', 'Read', 'Reply', 'Compose', 'Send', 'Forward',
			'Reply All', 'BCC', 'Flag', 'Request Notification', 'Calendar',
			'Folders', 'Attachments', 'POP/IMAP'].to_json;
		result['emailFluentcyLabels'] = ['Outlook', 'Mail', 'Impress', 'Other'].to_json;
		result['internetTermLabels'] = ['URL', 'Domain', 'IP', 'Server',
			'Client', 'Browser', 'Router'].to_json;
		result['internetTaskLabels'] = ['Locate Website', 'Forward/Backward',
			'Refresh', 'Print', 'Links', 'Bookmark', 'Search', 'Advanced Search',
			'Boolean Search', 'Download Files', 'Download Software', 'Connect Modem',
			'Configure Modem','Connect Router',  'Configure Router', 'Connect with Cable', 
			'Unsecure Wireless'].to_json;
		result['internetConnectionLabels'] = ['Dialup', 'LAN', 'DSL', 'Cable'].to_json;
		result['browserLabels'] = ['Firefox', 'Explorer', 'Safari',
			'Chrome', 'Mozilla', 'Other'].to_json;
		result['socialMediaSkillLabels'] = ['Post', 'Buy Ads', 'Create Account',
			'Create 3rd Party', 'Maintain', 'Incorporate', 'Develop Plan', 
			'Respond to Customers', 'Develop Text', 'Develop Images', 'Develop Video',
			'Blogging', 'Engage Others', 'Acquire Followers', 'Follow', 'Organize Events',
			'Check News', 'Check Competitors', 'Ideas', 'Productivity', 
			'Collect Data', 'Social Listening Tool', 'Social Media Management'].to_json;
		result['socialMediaDescLabels'] = ['Influencer', 'Creating', 
			'See Others', 'Interacting', 'Trends'].to_json;
		result['socialMediaPlatformLabels'] = ['Facebook', 'Twitter', 'Youtube',
			'LinkedIn', 'Instagram', 'Pintrest', 'Google+', 'Postmark'].to_json;
		result['onlineColabSkillLabels'] = ['Organize Meeting', 'Attend Meeting',
			'Use Setup Tool', 'Sharing Documents', 'Screen Sharing', 'Video', 
			'Voice', 'Instant Message'].to_json;
		result['onlineColabFluentcyLabels'] = ['Skype', 'FaceTime', 'Google Voice',
			'Google Docs', 'Dropbox', 'Zoho', 'Microsoft Live', 'Doodle', 'GoToMeeting',
			'Click Meeting', 'MeetingBurner', 'WebEx'].to_json;
		easeCategories = [$header7, $header8, $header9, $header10, $header11, $header12];
		fluencyCategories = [$header1, $header2, $header3, $header4, $header5, $header6];
		confirmCategories = [$header18, $header19, $header20];
		connectionCategories = [$header21, $header22, $header23];
		browserCategories = [$header24, $header25, $header26, 
			$header27, $header28, $header29, $header30]
		socialCategories = ['Work', 'School', 'Personal', 'None'];
		describeCategories = [$header31, $header32, 
			$header33, $header34, $header35]
		result['easeCategories'] = easeCategories.to_json;
		result['fluencyCategories'] = fluencyCategories.to_json;
		result['confirmCategories'] = confirmCategories.to_json;
		result['connectionCategories'] = connectionCategories.to_json;
		result['browserCategories'] = browserCategories.to_json;
		result['socialCategories'] = socialCategories.to_json;
		result['describeCategories'] = describeCategories.to_json;
		result['basic'] = getBasicComputerSkill().to_json;
		result['OSUsage'] = getOperatingSystemsUsage().to_json;
		result['OSFluent'] = getOperatingSystemsFluent().to_json;
		result['advanced'] = getAdvancedComputerSkill().to_json;
		result['multiMedia'] = getMultiMediaSkill().to_json;
		result['techDifference'] = getTechDifference().to_json;
		result['wordProcessingSkill'] = getWordProcessingSkill().to_json;
		result['wordProcessingFluentcy'] = getWordProcessingFluentcy().to_json;
		result['spreadsheetSkill'] = getSpreadsheetSkill().to_json;
		result['spreadsheetFluentcy'] = getSpreadsheetFluentcy().to_json;
		result['presentingSkill'] = getPresentingSkill().to_json;
		result['presentingFluentcy'] = getPresentingFluentcy().to_json;
		result['emailSkill'] = getEmailSkill().to_json;
		result['emailFluentcy'] = getEmailFluentcy().to_json;
		result['internetTerm'] = getInternetTerm().to_json;
		result['internetTask'] = getInternetTask().to_json;
		result['internetConnection'] = getInternetConnection().to_json;
		result['browser'] = getBrowser().to_json;
		result['socialMediaSkill'] = getSocialMediaSkill().to_json;
		result['socialMediaDesc'] = getSocialMediaDesc().to_json;
		result['socialMediaPlatform'] = getSocialMediaPlatform().to_json;
		result['onlineColabSkill'] = getOnlineColabSkill().to_json;
		result['onlineColabFluentcy'] = getOnlineColabFluentcy().to_json;
		return result;
	end

	def getBasicComputerSkill
		basic = [];
		(1..22).each do |q|
			questionArray = []
			(1..6).each do |a|
				question = 'q'+q.to_s;
				questionArray.push(BasicComputerSkill.where(''+question+' = ?', a).count());
			end
			basic.push(questionArray);
		end

		return basic;
	end

	def getOperatingSystemsUsage
		result = [];
		labels = ['windows', 'mac', 'linux']
		(0..2).each do |q|
			questionArray = []
			(1..3).each do |a|
				question = labels[q];
				questionArray.push(OperatingSystemsUsage.where(''+question+' = ?', a).count());
			end
			result.push(questionArray);
		end

		return result;
	end

	def getOperatingSystemsFluent
		result = [];
		labels = ['windows', 'mac', 'linux']
		(0..2).each do |q|
			questionArray = []
			(1..3).each do |a|
				question = labels[q];
				questionArray.push(OperatingSystemsFluent.where(''+question+' = ?', a).count());
			end
			result.push(questionArray);
		end

		return result;
	end

	def getAdvancedComputerSkill
		result = [];
		(1..6).each do |q|
			questionArray = []
			(1..6).each do |a|
				question = 'q'+q.to_s;
				questionArray.push(AdvancedComputerSkill.where(''+question+' = ?', a).count());
			end
			result.push(questionArray);
		end

		return result;
	end

	def getMultiMediaSkill
		result = [];
		(1..5).each do |q|
			questionArray = []
			(1..6).each do |a|
				question = 'q'+q.to_s;
				questionArray.push(MultiMediaSkill.where(''+question+' = ?', a).count());
			end
			result.push(questionArray);
		end

		return result;
	end

	def getTechDifference
		result = [];
		(1..3).each do |q|
			questionArray = []
			(1..3).each do |a|
				question = 'q'+q.to_s;
				questionArray.push(TechnologyDifference.where(''+question+' = ?', a).count());
			end
			result.push(questionArray);
		end

		return result;
	end

	def getWordProcessingSkill
		result = [];
		(1..20).each do |q|
			questionArray = []
			(1..6).each do |a|
				question = 'q'+q.to_s;
				questionArray.push(WordProcessingSkill.where(''+question+' = ?', a).count());
			end
			result.push(questionArray);
		end

		return result;
	end

	def getWordProcessingFluentcy
		result = [];
		labels = ['word', 'pages', 'writer', 'magnitude_other']
		(0..3).each do |q|
			questionArray = []
			(1..6).each do |a|
				question = labels[q];
				questionArray.push(WordProcessingFluentcy.where(''+question+' = ?', a).count());
			end
			result.push(questionArray);
		end

		return result;
	end

	def getSpreadsheetSkill
		result = [];
		(1..15).each do |q|
			questionArray = []
			(1..6).each do |a|
				question = 'q'+q.to_s;
				questionArray.push(SpreadsheetSkill.where(''+question+' = ?', a).count());
			end
			result.push(questionArray);
		end

		return result;
	end

	def getSpreadsheetFluentcy
		result = [];
		labels = ['excel', 'numbers', 'calc', 'magnitude_other']
		(0..3).each do |q|
			questionArray = []
			(1..6).each do |a|
				question = labels[q];
				questionArray.push(SpreadsheetFluentcy.where(''+question+' = ?', a).count());
			end
			result.push(questionArray);
		end

		return result;
	end

	def getPresentingSkill
		result = [];
		(1..17).each do |q|
			questionArray = []
			(1..6).each do |a|
				question = 'q'+q.to_s;
				questionArray.push(PresentingSkill.where(''+question+' = ?', a).count());
			end
			result.push(questionArray);
		end

		return result;
	end

	def getPresentingFluentcy
		result = [];
		labels = ['powerpoint', 'keynote', 'impress', 'prezi', 'magnitude_other']
		(0..4).each do |q|
			questionArray = []
			(1..6).each do |a|
				question = labels[q];
				questionArray.push(PresentingFluentcy.where(''+question+' = ?', a).count());
			end
			result.push(questionArray);
		end

		return result;
	end
	
	def getEmailSkill
		result = [];
		(1..16).each do |q|
			questionArray = []
			(1..6).each do |a|
				question = 'q'+q.to_s;
				questionArray.push(EmailSkill.where(''+question+' = ?', a).count());
			end
			result.push(questionArray);
		end

		return result;
	end

	def getEmailFluentcy
		result = [];
		labels = ['outlook', 'mail', 'impress', 'magnitude_other']
		(0..3).each do |q|
			questionArray = []
			(1..6).each do |a|
				question = labels[q];
				questionArray.push(EmailFluentcy.where(''+question+' = ?', a).count());
			end
			result.push(questionArray);
		end

		return result;
	end

	def getInternetTerm
		result = [];
		(1..7).each do |q|
			questionArray = []
			(1..3).each do |a|
				question = 'q'+q.to_s;
				questionArray.push(InternetTerm.where(''+question+' = ?', a).count());
			end
			result.push(questionArray);
		end

		return result;
	end

	def getInternetTask
		result = [];
		(1..17).each do |q|
			questionArray = []
			(1..6).each do |a|
				question = 'q'+q.to_s;
				questionArray.push(InternetTask.where(''+question+' = ?', a).count());
			end
			result.push(questionArray);
		end

		return result;
	end

	def getInternetConnection
		result = [];
		(1..4).each do |q|
			questionArray = []
			(1..3).each do |a|
				question = 'q'+q.to_s;
				questionArray.push(InternetConnection.where(''+question+' = ?', a).count());
			end
			result.push(questionArray);
		end

		return result;
	end

	def getBrowser
		result = [];
		(1..6).each do |q|
			questionArray = []
			(1..7).each do |a|
				question = 'q'+q.to_s;
				questionArray.push(Browser.where(''+question+' = ?', a).count());
			end
			result.push(questionArray);
		end

		return result;
	end

	def getSocialMediaSkill
		result = [];
		(1..23).each do |q|
			questionArray = []
			(1..6).each do |a|
				question = 'q'+q.to_s;
				questionArray.push(SocialMediaSkill.where(''+question+' = ?', a).count());
			end
			result.push(questionArray);
		end

		return result;
	end

	def getSocialMediaDesc
		result = [];
		(1..5).each do |q|
			questionArray = []
			(1..5).each do |a|
				question = 'q'+q.to_s;
				questionArray.push(SocialMediaDesc.where(''+question+' = ?', a).count());
			end
			result.push(questionArray);
		end

		return result;
	end

	def getSocialMediaPlatform
		result = [];
		(1..8).each do |q|
			questionArray = []
			labels=['a','b','c','d']
			(0..3).each do |a|
				question = 'q'+q.to_s+labels[a].to_s;
				questionArray.push(SocialMediaPlatform.where(''+question+' = ?', true).count());
			end
			result.push(questionArray);
		end

		return result;
	end

	def getOnlineColabSkill
		result = [];
		(1..8).each do |q|
			questionArray = []
			(1..6).each do |a|
				question = 'q'+q.to_s;
				questionArray.push(OnlineColabSkill.where(''+question+' = ?', a).count());
			end
			result.push(questionArray);
		end

		return result;
	end

	def getOnlineColabFluentcy
		result = [];
		(1..12).each do |q|
			questionArray = []
			(1..6).each do |a|
				question = 'q'+q.to_s;
				questionArray.push(OnlineColabFluentcy.where(''+question+' = ?', a).count());
			end
			result.push(questionArray);
		end

		return result;
	end
end
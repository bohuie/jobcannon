require 'spec_helper'

describe User do
    let(:employee) { FactoryGirl.build(:user, :employee) }
    let(:employer) { FactoryGirl.build(:user, :employer) }
    let(:admin)    { FactoryGirl.build(:user, :admin) }
    let(:user)     { FactoryGirl.create(:user) }
  
  subject{employee}

  it { should be_valid }
  it { should respond_to(:username) }
  it { should respond_to(:fname) }
  it { should respond_to(:lname) }
  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }  
  it { should respond_to(:city) }
  it { should respond_to(:province) }  
  it { should respond_to(:gender) }
  it { should respond_to(:field) }
  it { should respond_to(:company_name) }
  it { should respond_to(:company_address) }
  it { should respond_to(:employer) }
  it { should respond_to(:admin) }
  it { should respond_to(:user_id) }
  it { should respond_to(:info) }
  it { should respond_to(:last_seen_at) }
  it { should respond_to(:field) }
  it { should respond_to(:sign_in_count) }

  it { should have_one (:language) }
  it { should have_one ( :surveyprofile )}
  it { should have_one ( :accountability)}
  it { should have_one ( :self_direction_skill)}
  it { should have_one ( :communication_skill)}
  it { should have_one ( :interpersonal_skill)}
  it { should have_one ( :thinking_skill)}
  it { should have_one ( :basic_computer_skill)}
  it { should have_one ( :photo)}
  it { should have_one ( :progress)}
  it { should have_one ( :operating_systems_usage)}
  it { should have_one ( :advanced_computer_skill)}
  it { should have_one ( :multi_media_skill)}
  it { should have_one ( :technology_difference)}
  it { should have_one ( :word_processing_skill)}
  it { should have_one ( :word_processing_fluentcy)}
  it { should have_one ( :presenting_skill)}
  it { should have_one ( :presenting_fluentcy)}
  it { should have_one ( :spreadsheet_skill)}
  it { should have_one ( :spreadsheet_fluentcy)}
  it { should have_one ( :email_skill)}
  it { should have_one ( :email_fluentcy)}
  it { should have_one ( :internet_term)}
  it { should have_one ( :internet_task)}
  it { should have_one ( :internet_connection)}
  it { should have_one ( :browser)}
  it { should have_one ( :social_media_skill)}
  it { should have_one ( :social_media_desc)}
  it { should have_one ( :social_media_platform)}
  it { should have_one ( :online_colab_skill)}
  it { should have_one ( :online_colab_fluentcy)}
  it { should have_one ( :internet_term)}
  it { should have_one ( :internet_task)}
  it { should have_one ( :internet_connection)}  

  it { should have_many ( :authentications)}
  it { should have_many ( :friendships)}
  it { should have_many ( :experiencetables)}
  it { should have_many ( :shopping_lists)}
  it { should have_many ( :flagged_jobs )}
  it { should have_many ( :network_searches)}
  it { should have_many ( :skills)}
  it { should have_many ( :references)}
  it { should have_many ( :postings)}
  it { should have_many ( :experiences)}

  describe "when user_id is set" do
    it "should equal user.id" do
      @user = FactoryGirl.create(:user)
      @user.user_id.should eq @user.id      
    end
  end

  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        user.email = invalid_address
        expect(user).not_to be_valid
      end
    end
  end
  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        user.email = valid_address
        expect(user).to be_valid
      end
    end
  end
  describe "when email address is already taken" do
    it "prevents duplicates" do
      user1 = create(:user, email: 'unique@email.com')
      user2 = build(:user, email: 'unique@email.com')

      user1.should be_valid
      user2.should_not be_valid
    end
  end  


  describe "when username is not present" do
    before { user.username = " " }
    it { should_not be_valid }
  end
  describe "when username address is already taken" do
    it "prevents duplicates" do
      user1 = create(:user, username: 'unique')
      user2 = build(:user, username: 'unique')

      user1.should be_valid
      user2.should_not be_valid
    end
  end

  describe "when fname is not present" do
    before { user.fname = " " }
    it { should_not be_valid }
  end
  describe "when lname is not present" do
    before { user.lname = " " }
    it { should_not be_valid }
  end
  describe "when email is not present" do
    before { user.email = " " }
    it { should_not be_valid }
  end
   describe "when password is not present" do
    before { user.password = " " }
    it { should_not be_valid }
  end
   describe "when password_confirmation is not present" do
    before { user.password_confirmation = " " }
    it { should_not be_valid }
  end
  describe "when admin is not present" do
    before { user.admin = nil }
    it { should_not be_valid }
  end
  describe "when employer is not present" do
    before { user.employer = nil }
    it { should_not be_valid }
  end
  describe "when employee is not present" do
    before { user.employer = nil }
    it { should_not be_valid }
  end

   describe "employee checking if admin " do
    it "checks admin" do
      employee.admin.should eq false
    end
  end
  describe "employee checking if employer " do
    it "checks employer" do
      employee.employer.should eq false
    end
  end
  describe "employee checking if employee " do
    it "checks employee" do
      employee.employee.should eq true
    end
  end
  describe "employee company name should be empty" do
    it "checks company name" do
      employee.company_name.should eq ""
    end
  end
  describe "employee company address should be empty" do
    it "checks company address" do
      employee.company_address.should eq ""
    end
  end
  describe "employee field should be empty" do
    it "checks field" do
      employee.field.should eq ""
    end
  end
  
  describe "employer checking if admin " do
    it "checks admin" do
      employer.admin.should eq false
    end
  end
  describe "employer checking if employer " do
    it "checks employer" do
      employer.employer.should eq true
    end
  end
  describe "employer checking if employee " do
    it "checks employee" do
      employer.employee.should eq false
    end
  end
  
  describe "employer company name should not be empty" do
    it "checks company name" do
      employer.company_name.should_not eq ""
    end
  end

  describe "employer company address should not be empty" do
    it "checks company address" do
      employer.company_address.should_not eq ""
    end
  end
  describe "employer field should not be empty" do
    it "checks field" do
      employer.field.should_not eq ""
    end
  end
  describe "admin checking if admin " do
    it "checks admin" do
      admin.admin.should eq true
    end
  end
  describe "admin checking if employer " do
    it "checks employer" do
      admin.employer.should eq false
    end
  end
  describe "admin checking if employee " do
    it "checks employee" do
      admin.employee.should eq false
    end
  end

  describe "admin company name should be empty" do
    it "checks company name" do
      admin.company_name.should eq ""
    end
  end
  describe "admin company address should be empty" do
    it "checks company address" do
      admin.company_address.should eq ""
    end
  end
  describe "admin field should be empty" do
    it "checks field" do
      admin.field.should eq ""
    end
  end

  describe "employee attributes" do
    it "should be valid" do
        employee.employer.should eq false
        employee.admin.should eq false
        employee.employee.should eq true
    end
  end

  describe "employer attributes" do
    it "should be valid" do
        employer.employer.should eq true
        employer.admin.should eq false
        employer.employee.should eq false
    end
  end

  describe "admin attributes" do
    it "should be valid" do
        admin.employer.should eq false
        admin.admin.should eq true
        admin.employee.should eq false
    end
  end

  describe "skills associations" do
    before do
      @skill = FactoryGirl.create(:skill, user_id: employee.user_id)
      @skill.save
      @skill1 = FactoryGirl.create(:skill, user_id: 5)
      @skill1.save
      employee.save
    end
    it "should be destroyed when employee is destroyed" do
      Skill.all.should include(@skill1) 
      Skill.all.should include(@skill)
      employee.skills.push(@skill)
      employee.destroy
      Skill.all.should_not include(@skill)
      Skill.all.should include(@skill1)
    end
  end

  describe "experiences associations" do
    before do
      @experience = FactoryGirl.build(:experience, user_id: employee.user_id)
      @experience.save
      @experience1 = FactoryGirl.build(:experience, user_id: 5)
      @experience1.save
      employee.save
    end
    it "should be destroyed when employee is destroyed" do
      Experience.all.should include(@experience1) 
      Experience.all.should include(@experience)
      employee.experiences.push(@experience)
      employee.destroy
      Experience.all.should_not include(@experience)
      Experience.all.should include(@experience1)
    end
  end
  describe "references associations" do
    before do
      @reference = FactoryGirl.build(:reference, user_id: employee.user_id)
      @reference.save
      @reference1 = FactoryGirl.build(:reference, user_id: 5)
      @reference1.save
      employee.save
    end
    it "should be destroyed when employee is destroyed" do
      Reference.all.should include(@reference1) 
      Reference.all.should include(@reference)
      employee.references.push(@reference)
      employee.destroy
      Reference.all.should_not include(@reference)
      Reference.all.should include(@reference1)
    end
  end
  describe "postings associations" do
    before do
      @posting = FactoryGirl.build(:posting, user_id: employer.user_id)
      @posting.save
      @posting1 = FactoryGirl.build(:posting, user_id: 5)
      @posting1.save
      employer.save
    end
    it "should be destroyed when employer is destroyed" do
      Posting.all.should include(@posting1) 
      Posting.all.should include(@posting)
      employer.postings.push(@posting)
      employer.destroy
      Posting.all.should_not include(@posting)
      Posting.all.should include(@posting1)
    end
  end

end
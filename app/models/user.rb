class User < ActiveRecord::Base

  after_create :do_setID
  has_one :language, dependent: :destroy
  has_one :surveyprofile, dependent: :destroy 
  has_one :accountability, dependent: :destroy
  has_one :self_direction_skill, dependent: :destroy
  has_one :communication_skill, dependent: :destroy
  has_one :interpersonal_skill, dependent: :destroy
  has_one :thinking_skill, dependent: :destroy
  has_one :basic_computer_skill, dependent: :destroy
  has_one :photo, dependent: :destroy
  has_one :progress, dependent: :destroy 
  has_one :operating_systems_usage, dependent: :destroy
  has_one :advanced_computer_skill, dependent: :destroy
  has_one :multi_media_skill, dependent: :destroy
  has_one :technology_difference, dependent: :destroy
  has_one :word_processing_skill, dependent: :destroy
  has_one :word_processing_fluency, dependent: :destroy
  has_one :presenting_skill, dependent: :destroy
  has_one :presenting_fluency, dependent: :destroy
  has_one :spreadsheet_skill, dependent: :destroy
  has_one :spreadsheet_fluency, dependent: :destroy
  has_one :email_skill, dependent: :destroy
  has_one :email_fluency, dependent: :destroy
  has_one :internet_term, dependent: :destroy
  has_one :internet_task, dependent: :destroy
  has_one :internet_connection, dependent: :destroy
  has_one :browser, dependent: :destroy
  has_one :social_media_skill, dependent: :destroy
  has_one :social_media_desc, dependent: :destroy
  has_one :social_media_platform, dependent: :destroy
  has_one :online_colab_skill, dependent: :destroy
  has_one :online_colab_fluency, dependent: :destroy
  has_one :internet_term, dependent: :destroy
  has_one :internet_task, dependent: :destroy
  has_one :internet_connection, dependent: :destroy

  has_many :experiencetables, dependent: :destroy
  has_many :shopping_lists, dependent: :destroy
  has_many :flagged_jobs, dependent: :destroy 
  has_many :authentications, dependent: :destroy
  has_many :friendships, dependent: :destroy
  has_many :network_searches, dependent: :destroy
  has_many :skills, dependent: :destroy
  has_many :references, dependent: :destroy
  has_many :postings, dependent: :destroy
  has_many :experiences, dependent: :destroy


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lastseenable

  validates :user_id, presence: true
  validates  :username, uniqueness: true

  validates :username, :fname, :lname, presence:  true
  
  validates_inclusion_of :employee, :employer, :admin, :in => [true, false]
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: true }

  def apply_omniauth(omniauth)
    authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'])
  end

  def password_required?
    (authentications.empty? || !password.blank?) && super
  end

  def self.findbyemail(input)
    query_obj = User.where('email like ?', "%#{input}%") unless input.blank?
  end

  def self.findbyfname(input)
    query_obj = User.where('fname like ?', "%#{input}%") unless input.blank?
  end



  private
    def do_setID
      
      newID = self.id
      self.update_attributes(:user_id => newID)
    end
end
class SocialMediaPlatform < ActiveRecord::Base
 	after_create :do_setID
 	belongs_to :user

  private
    def do_setID    
      newID = self.id
      self.update_attributes(:social_media_platform_id => newID)
    end
end
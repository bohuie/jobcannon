class Interest < ActiveRecord::Base

        belongs_to :user
        
        validates :user_id, :interest_id, presence: true

        validates :label, presence: true
 		after_create :do_setID

  private
    def do_setID
      
      newID = self.id
      self.update_attributes(:interest_id => newID)
    end
end
class Interestlabel < ActiveRecord::Base
        validates :label, presence: true
 		after_create :do_setID

  private
    def do_setID
      
      newID = self.id
      self.update_attributes(:interestlabel_id => newID)


    end
end
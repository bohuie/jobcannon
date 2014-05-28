class Experiencetable < ActiveRecord::Base
 	belongs_to :user
 	after_create :do_setID

  private
    def do_setID      
      newID = self.id     
    end
end
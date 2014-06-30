class ShoppingList < ActiveRecord::Base
 	after_create :do_setID
 	belongs_to :user
 	has_many :flagged_candidates, dependent: :destroy

  private
    def do_setID    
      newID = self.id
      self.update_attributes(:list_id => newID)
    end
end
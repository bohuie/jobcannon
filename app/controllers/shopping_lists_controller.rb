class ShoppingListsController < ApplicationController


	def create
		@shopping = ShoppingList.new(shopping_params)		
		@shopping.save		

		respond_to do |f|
          f.js 
          f.html {redirect_to root_path}
        end
		
	end 

	def update
	end 

	def destroy
	end 

	def show
	end

	def index
		@list = ShoppingList.find(params[:id])
		@candidates = FlaggedCandidate.where(:list_id=> @list.list_id)
		@user = current_user
		@all_lists = ShoppingList.where(:user_id=>@user.user_id)
		@list_count = @all_lists.count
	end

	private

	def shopping_params
		params.require(:shopping_list).permit(:posting_id,:user_id)

	end

end
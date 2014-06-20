class NetworkSearchesController < ApplicationController

  def create
    @search = NetworkSearch.new
    @search.update_attributes(search_params)
    @search.save
    respond_to do |f|
      f.html { redirect_to "/show_network" }
      f.js { render 'shared/ajax/name_search.js.erb' }
    end
  end

  private

  def search_params
        params.require(:network_search).permit(:user_id, :query)
  end

end
class PhotosController < ApplicationController


  def update
  
    @photo = Photo.find(params[:id])
    @photo.update_attributes(photo_params)
    redirect_to root_path
  end 

  private

  def photo_params
    params.require(:photo).permit(:photo)
  end

end
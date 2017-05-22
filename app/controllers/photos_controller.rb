class PhotosController < ApplicationController
  def index
    @photos = Photo.all
  end

  def new
    @lead = Lead.find_by_id(params[:lead_id])
    @photo = Photo.new
  end

  def create
    @lead = Lead.find_by_id(params[:lead_id])
    #create the images from the params
    if @lead.save
      flash[:success] = "Photos saved!"
      redirect_to lead_path(@lead)
    else
      render 'new'
    end
  end

  def destroy
    @photo = Photo.find_by(id: params[:id])
    puts @photo.image_uid
    Cloudinary::Uploader.destroy(@photo.image_uid)
    unless @photo.nil?
      @photo.destroy
      respond_to do |format|
        format.js{render 'photos/destroy.js.erb'}
      end
    end
  end

  private

  def photo_params
    params.require(:photo).permit(:image_uid)
  end
end

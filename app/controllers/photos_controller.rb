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
    @lead = Lead.find_by_id(params[:lead_id])
    images = @lead.images
    deleted_image = images.delete_at(params[:id].to_i)
    deleted_image.try(:remove!)
    @lead.remove_images! if images.empty?
    @lead.images = images
    @lead.save!
    respond_to do |format|
      format.js { render 'destroy.js.erb' }
    end
    #redirect_to lead_path(@lead)
  end

  private

  def photo_params
    params.require(:photo).permit(:image_uid)
  end
end

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
    unless params[:photo][:image].nil?
        params[:photo][:image].each do |image|
        @lead.photos << Photo.create(:title => params[:photo][:title], :image => image)
      end
    end
    if @lead.save
      flash[:success] = "Photos saved!"
      redirect_to lead_path(@lead)
    else
      render 'new'
    end
  end

  def destroy
    @photo = Photo.find_by(id: params[:id])
    @photo.destroy
    redirect_back(fallback_location: :back)
  end

  private

  def photo_params
    params.require(:photo).permit(:title, :image)
  end
end

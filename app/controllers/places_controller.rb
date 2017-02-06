include ActionView::Helpers::TextHelper

class PlacesController < ApplicationController
  # respond_to :json, :html
  before_action :set_place, only: [:show, :select_image]
  before_action :authenticate_user!, only: [:new, :create]
  before_action :check_if_admin, only: [:edit, :update, :destroy]

  def index
    @places = Place.all
    @places = @places.paginate(page: params[:page] || 1, per_page: 6).order(updated_at: :desc)
  end

  def new
    @place = current_user.places.new
  end

  def show
    # respond_with Place.find params[:id]
    @image = @place.images[@place.images.count-1].url
  rescue ActiveRecord::RecordNotFound
    flash[:danger] = 'Place does not exist!'
    redirect_to places_path
  end

  def create
    # respond_with Place.create place_params
    @place = current_user.places.new(place_params)
    if @place.save
      PlacesMailer.place_created(@place, current_user).deliver_now
      redirect_to place_path(@place)
    else
      render 'new'
    end
  end

  def destroy
    # respond_with Place.destroy params[:id]
    Place.find(params[:id]).destroy
    flash[:success] = 'Place deleted'
    redirect_to places_path
  end

  def select_image
    @images = Place.find(params[:id]).images
    @image = params[:image_param]
    render 'show'
  end


  private

    def place_params
      params.require(:place).permit(:title, :description, :price, :address, :latitude, :longitude, {images: []})
    end

    def set_place
      @place = Place.find(params[:id])
      @comments = Comment.where(place_id: @place.id)
      @comment = Comment.new
      @hash = Gmaps4rails.build_markers(@place) do |place, marker|
        marker.lat place.latitude; marker.lng place.longitude; marker.infowindow place.title
      end
    end

end

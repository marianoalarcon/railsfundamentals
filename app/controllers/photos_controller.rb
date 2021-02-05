class PhotosController < ApplicationController
  before_action :find_photo, only: [:show,:edit,:update,:destroy]
  before_action :authenticate_admin!, except: [:show, :index]
  def new
    @photo = Photo.new
  end
  def create
    @photo = Photo.create(name: params[:photo][:name],code: params[:photo][:code])
    redirect_to @photo
  end
  def show
  end

  def edit
  end
  def update
    @photo = Photo.update(name: params[:photo][:name],code: params[:photo][:code])
    redirect_to @photo
  end
  def destroy
    @photo.destroy
    redirect_to root_path
  end
  def index
    @photos = Photo.all
  end

  def find_photo
    @photo = Photo.find(params[:id])
  end
end

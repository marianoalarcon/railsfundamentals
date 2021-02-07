class PhotosController < ApplicationController
  before_action :find_photo, only: [:show,:edit,:update,:destroy]
  before_action :authenticate_admin!, except: [:show, :index]
  def new
    @photo = Photo.new
  end
  def create
    @photo = current_admin.photos.create(photo_params)
    redirect_to @photo
  end
  def show
  end

  def edit
  end
  def update
    @photo.update(photo_params)
    redirect_to @photo
  end
  def destroy
    @photo.destroy
    redirect_to root_path
  end
  def index
    @photos = Photo.all
  end

  def from_author
    @user_admin = Admin.find(params[:admin_id])
  end
  def find_photo
    @photo = Photo.find(params[:id])
  end
  #Buenas Practicas 
  def photo_params
    params.require(:photo).permit(:name,:code)
  end
end

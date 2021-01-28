class PhotosController < ApplicationController
  def new
    @photo = Photo.new
  end
  def create
    @photo = Photo.create(name: params[:photo][:name],code: params[:photo][:code])
    redirect_to @photo
  end
  def show
    @photo = Photo.find(params[:id])
  end

  def edit
    @photo = Photo.find(params[:id])
  end
  def update
    @photo = Photo.update(name: params[:photo][:name],code: params[:photo][:code])
    redirect_to @photo
  end
  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
    redirect_to root_path
  end

end

class AdminsController < ApplicationController
  def index
    @users_admins = Admin.all
  end
  def show
    @admin = Admin.find(params[:id])
  end
end

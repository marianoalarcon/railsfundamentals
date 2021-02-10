class AdminsController < ApplicationController
  before_action :authenticate_admin!, only: [:edit]
  def index
    @users_admins = Admin.all
  end
  def show
    @admin = Admin.find(params[:id])
  end
  def edit
  end
  def update
    current_admin.update(admin_params)
    redirect_back(fallback_location: root_path)
  end
  def admin_params
    params.require(:admin).permit(:avatar)
  end
end

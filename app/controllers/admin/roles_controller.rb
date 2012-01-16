class Admin::RolesController < ApplicationController
  before_filter :authenticate
  
  # Where can I move this for DRY -rr
  def authenticate
     if current_user and current_user.can? :manage, :roles
      return
    end
    flash[:alert] = "You aren't authorized to view this!"
    redirect_to root_path
  end
  
  def index
    @roles = Role.all
  end

  def new
  end

  def create
  end

  def show
    @role = Role.find(params[:id])
  end

  def edit
    @role = Role.find(params[:id])
  end

  def update
  end

  def destroy
  end

end

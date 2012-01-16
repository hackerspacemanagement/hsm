class Admin::UsersController < ApplicationController
  before_filter :can_manage_all?
  
  def index
    @users = User.all
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

end

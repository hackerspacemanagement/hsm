class Admin::SettingsController < ApplicationController
    before_filter :authenticate_user!
  
    def show
        @roles = Role.all
    end

    def create
        Settings.group_name = params[:settings][:group_name]
        Settings.new_user_role = params[:settings][:new_user_role]
        flash[:notice] = "Site configurated!"
        redirect_to admin_settings_path
    end
end

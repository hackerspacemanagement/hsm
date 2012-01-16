class Admin::SettingsController < ApplicationController
    before_filter :authenticate
  
    # Where can I move this for DRY -rr
    def authenticate
        if current_user and current_user.can? :manage, :roles
            return
        end
        flash[:alert] = "You aren't authorized to view this!"
        redirect_to root_path
    end
  
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

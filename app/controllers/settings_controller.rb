class SettingsController < ApplicationController
    def index
        @config = Settings.all
    end
    
    def create
        Settings.group_name = params[:value][:group_name]
        redirect_to settings_path
    end
end

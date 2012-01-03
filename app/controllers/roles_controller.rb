class RolesController < ApplicationController
    def index
        @roles = Role.all
    end
    
    def edit
        @role = Role.find(params[:id])
    end
    
    def remove_permission
    end
end

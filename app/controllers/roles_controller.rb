class RolesController < ApplicationController
    def index
        @roles = Role.all
    end
    
    def edit
    end
end

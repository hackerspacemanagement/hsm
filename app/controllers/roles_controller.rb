class RolesController < ApplicationController
    def index
        @roles = Role.all
    end
    
    def edit
        @role = Role.find(params[:id])
    end
    
    def remove_permission
        @role = Role.find(params[:role_id])
        
        @role.permissions.delete(Permission.find(params[:perm_id]))
        
        redirect_to edit_role_path(@role)
    end
    
    def add_permission
        @permname = params[:new_perm]
        @role = Role.find(params[:role][:id])
        
        if @permission = Permission.find_by_name(@permname) then
            @role.permissions << @permission
        else
            @permission = Permission.new :name => @permname
            if @permission.save then
                flash[:notice] = "Awesome, added the permission."
            else
                flash[:alert] = "Could not save new permission."
                redirect_to edit_role_path(@role)
            end
            
            @role.permissions << @permission
        end
        
        if @role.save then
            flash[:notice] = "Added permission to Role."
        else
            flash[:alert] = "Could not add permission to Role, error occured."
        end
        
        redirect_to edit_role_path(@role)
    end
end

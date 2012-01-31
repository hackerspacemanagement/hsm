class ToolsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]

  def index
    if params[:id]
      @user       = User.find(params[:id])
      @tools      = @user.tools
      @user_tools = true
    else
      @tools      = Tool.all
      @user_tools = nil
    end
  end

  def new
    @tool       = Tool.new
    @users      = users 
    @categories = categories
  end

  def edit
    @tool       = Tool.find(params[:id])
    @users      = users 
    @categories = categories
  end

  def create
    @tool = Tool.new(params[:tool])
    @tool.date_added = Time.now
    if @tool.save
      flash[:notice] = "Dude, you are awesome. You've added a tool."
      redirect_to tools_path
    else
      flash[:alert] = 'You broke something. :-('
      redirect_to edit_tool_path(@tool)
    end
  end

  def update
    @tool = Tool.find(params[:id])
    if @tool.update_attributes(params[:tool])
      flash[:notice] = "Your changes have been saved, good sir or madam."
      redirect_to tools_path
    else
      flash[:alert] = "Whoops, something bad happened!"
      redirect_to edit_tool_path(@tool)
    end
  end
  
  def destroy
    if tool = Tool.find(params[:id])
      name = tool.name
      if tool.destroy
        flash[:notice] = "You've deleted the #{name}."
        redirect_to tools_path
      else
        flash[:alert] = "Whoops, something bad happened!"
        redirect_to edit_tool_path(tool)
      end
    else
      flash[:alert] = "Could not find tool with id #{ params[:id] }."
    end
  end
  
  private
  
  def users
    User.all.collect { |p| [p.full_name, p.id]} << [Settings.group_name, ""]
  end
  
  def categories
    ToolCategory.all.collect {|p| [ p.name, p.id ] }
  end 

end

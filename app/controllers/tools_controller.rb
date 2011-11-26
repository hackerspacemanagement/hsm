class ToolsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  
  def index
    @tools = Tool.all
  end
  
  def new
    @tool = Tool.new
    @categories = ToolCategory.all
  end

  def edit
    @tool = Tool.find(params[:id])  
    @categories = ToolCategory.all
  end
  
  def create
    @tool = Tool.new(params[:tool])
    @tool.user_id = current_user.id
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

end

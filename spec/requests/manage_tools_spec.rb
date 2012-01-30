require 'spec_helper' 

describe 'Tool' do
  before do
    # Create some initial Tool categories
    @user          = Factory.create :user
  end
  
  describe 'Adding and Removing Tools' do
    it 'shouild be able to create new tool categories' do
      login_as @user
      visit new_tool_path
      
      click_link "Add new Category"
      
      should_be_on new_tool_category_path
      
      fill_in_fields :tool_category_name        => "Test Category",
                     :tool_category_description => "This is a test category"
      
      click_button "Create Tool category"
      
      should_be_on new_tool_path
      
      fill_in_fields :tool_name        => "Test Tool",
                     :tool_serial_id   => "1234",
                     :tool_description => "This is a test tool"
      
      page.select("Test Category", :from => "tool_tool_category_id")
      page.select(@user.full_name, :from => "tool_user_id")
      
      click_button "Create Tool"
    end
    
    it 'should be able to remove a new tool' do
      @tool = Tool.find_by_name("Test tool")
      Tool.delete(@tool)
      
      Tool.count.should == 0
    end
  end
  
  describe 'Editing tools' do
    before do
      @tool = Factory.create :tool, :name        => "Test tool",
                                    :user        => @user,
                                    :category    => @test_category,
                                    :description => "This is a test"
    end
    
    it 'should be able to edit existing tools' do
    end
  end
end
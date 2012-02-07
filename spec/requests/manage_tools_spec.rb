require 'spec_helper' 

describe 'Tool' do
  before do
    # Create some initial Tool categories
    @user          = Factory.create :user
    login_as @user
  end
  
  describe 'Adding and Removing Tools' do
    it 'should display a link to add new tools on the tools index' do
      visit tools_path
      
      page.should have_css "a[href='#{ new_tool_path }']"
    end
    
    it 'should display a link to add categories on the new tool page' do
      visit new_tool_path
      
      page.should have_css "a[href='#{ new_tool_category_path }']"
      
      click_link "Add new Category"
      
      should_be_on new_tool_category_path
    end
    
    it 'should allow users to add tool categories' do
      visit new_tool_category_path
      
      fill_in_fields :tool_category_name        => "Test Category",
                     :tool_category_description => "This is a test category"
      
      click_button "Create Tool category"
      
      should_be_on new_tool_path
    end
    
    it 'should allow users to add tools' do
      Factory.create :tool_category, :name => "Test Category"
      visit new_tool_path
      
      fill_in_fields :tool_name        => "Test Tool",
                     :tool_serial_id   => "1234",
                     :tool_description => "This is a test tool"
      
      page.select("Test Category", :from => "tool_tool_category_id")
      page.select(@user.full_name, :from => "tool_user_id")
      
      click_button "Create Tool"
    end
  end
  
  describe "deleting tools" do
    before do
      @tool = Factory :tool, :name => "Test Tool"
      @tool.save
    end
    
    it 'should have a link to remove the tool' do
      visit tools_path
      
      page.should have_css "a[href='#{ edit_tool_path(@tool) }']"
    end
    
    it 'should be able to delete tools', :js => true do
      visit edit_tool_path(@tool)
      
      page.should have_css "a[href='#{ tool_path(@tool) }']"
      click_link "Delete this tool"
      
      alert = page.driver.browser.switch_to.alert
      alert.text.should == "Are you sure?"

      alert.accept
    end
    
    it "should not allow users to delete tools that they don't own", :js => true do
      @owner_user = Factory :user, :email => "me@example.com"
      @tool.user  = @owner_user
      @tool.save
      
      visit edit_tool_path(@tool)
      click_link "Delete this tool"
      
      alert = page.driver.browser.switch_to.alert
      alert.text.should == "Are you sure?"

      alert.accept
      
      page.should have_content "You are not allowed to delete tools you don't own"
    end
  end
  
  describe 'Editing tools' do
    before do
      @tool_category = Factory :tool_category, :name => "Test Category"
      
      @tool          = Factory :tool, :name          => "Test tool",
                                      :user          => @user,
                                      :tool_category => @tool_category,
                                      :description   => "This is a test"
    end
    
    it 'should be able to edit existing tools' do
      pending "This needs to be written"
    end
  end
end

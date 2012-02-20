require 'spec_helper'

describe 'Interests' do

  before do
    let (:admin)               { Factory :user, role: required_role                                                        }
    let (:interest)            { Factory :interest,   name:        'Doing Awesome Shit',
                                                      description: 'Uhm, awesomeness!',
                                                      info_url:    'http://en.wikipedia.org/wiki/Awesome_(window_manager)' }
    let (:required_permission) { Factory :permission, name:        'Important Permission'                                  }
    let (:required_role)       { Factory :role,       name:        'Important Role',
                                                      permissions: [required_permission]                                   }
    let (:user)                { Factory :user                                                                             }
  end

  describe 'Adding interests' do

    before do
      login_as user
    end

    it 'should have a link to interests on the home page' do
      visit root_path
      page.should have_content "My Interests"

      click_link "My Interests"

      page.should_be_on interests_path( user )
    end

    it 'should have a link to add new interests from the My Interests page' do
      visit interests_path( user )

      page.should have_content "Add an Interest"

      click_link "Add an Interest"

      page.should_be_on new_interest_path
    end

    context 'interest exists' do

      it 'should automatically fill in the other forms when you fill in name', js: true do
        visit new_interest_path

        fill_in_fields :interest, name: 'Doing Awesome Shit'

        page.should have_content 'Uhm, awesomeness'
        page.should have_content '(window_manager)'
      end

      it 'should allow users to add new interests to their profile', js: true do
        visit new_interest_path

        fill_in_fields :interest, name: "Doing Awesome Shit"
        page.select("5", :from => "interest_proficiency")

        click_link "Add Interest"

        page.should have_content "Awesome! You have added an interest!"
      end

    end

    context "interest doesn't exist" do

      it 'should validate that all the inputs are filled in', js: true do
        visit new_interest_path

        fill_in_fields :interest, name: "Eating Bacon"
        page.select("5", :from => "interest_proficiency")

        click_link "Add Interest"

        page.should have_content "add some details"
      end

      it 'should allow users to save new interests', js: true do
        visit new_interest_path

        fill_in_fields :interest, name:        'Eating bacon',
                                  description: 'om nom nom nom bacons!',
                                  info_url:    'http://en.wikipedia.org/wiki/bacon'
        page.select("5", :from => "interest_proficiency")

        click_link "Add interest"

        page.should have_content "Awesome! You have added an interest!"
      end

      it 'should not allow duplicate interests to exist', js: true do
        visit new_interest_path

        fill_in_fields :interest, name:        'Doing Awesome Shit',
                                  description: 'SO HARD',
                                  info_url:    'http://en.wikipedia.org/wiki/Awe'
        page.select("5", :from => "interest_proficiency")

        click_link "Add interest"

        page.should have_content "Whoa, buddy. There's already an interest with that name. Let's use that one. :)"
        click_link "Okay"

        page.should have_content skill.description
        page.should have_content skill.info_url
      end

    end

  end

  describe 'Updating interests' do

    it 'should have a link to edit interests from the interests index' do
      pending
    end

    it 'should allow you to change your proficiency' do
      pending
    end

    it 'should allow you to delete your skill' do
      pending
    end

    context 'can_manage_interests? == true' do

      it 'should allow user to change name' do
        pending
      end

      it 'should allow user to change description' do
        pending
      end

      it 'should allow user to change info url' do
        pending
      end

      it 'should allow user to delete interest globally' do
        pending
      end

    end

    context 'can_manage_interests? == false' do

      it 'should not allow user to change name' do
        pending
      end

      it 'should not allow user to change description' do
        pending
      end

      it 'should not allow user to change info url' do
        pending
      end

      it 'should not allow user to delete interest globally' do
        pending
      end

    end

  end

end

describe 'Badges' do

  describe 'Awarding badges' do
  end

  describe 'Checking badge permissions' do
  end

end

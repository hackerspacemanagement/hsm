require 'spec_helper'

describe 'Skill Management' do

  before do
    let (:required_permission) { Factory :permission, name:        'Important Permission' }
    let (:required_role)       { Factory :role,       name:        'Important Role',
                                                      permissions: [required_permission]  }

    let (:admin)               { Factory :user, role: required_role }
    let (:user)                { Factory :user                      }
  end

  describe 'Interests' do

    before do
      let (:interest)            { Factory :interest,   name:        'Doing Awesome Shit',
                                                        description: 'Uhm, awesomeness!',
                                                        info_url:    'http://en.wikipedia.org/wiki/Awesome_(window_manager)' }
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

    let (:teacher_permission) { Factory :permission, name: 'award_major_class_badge'              }
    let (:teacher_role)       { Factory :role, name: 'teacher', permissions: [teacher_permission] }
    let (:teacher)            { Factory :user, role: teacher_role                                 }

    let (:class_admin_permission) { Factory :permission, name: 'award_all_badges'                             }
    let (:class_admin_role)       { Factory :role, name: 'class_admin', permissions: [class_admin_permission] }
    let (:class_admin)            { Factory :user, role: class_admin_role                                     }

    before do

      5.times do
        @badges << Factory( :badge )
      end

      major_class_badge = Factory :badge, name: 'major class'
      @badges << major_class_badge

    end

    describe 'Awarding badges' do

      context 'as admin ISBAT award all badges' do

        before do
          login_as admin
        end

        it 'should have a link in the Skills dropdown to add badges to users' do
          visit root_path

          click_link "Skills"
          click_link "Badges"

          page.should_be_on dashboard_badges_path
        end

        it 'should show all of the badges in the dashboard' do
          visit dashboard_badges_path

          @badges.each do |badge|
            page.should have_content badge.name
          end

        end

        it 'should have links to view each badge' do
          visit dashboard_badges_path

          @badges.each do |badge|
            page.should have_css "a[href='#{ badge_path(badge) }']"
          end

        end

        it 'should allow admin to award any badge' do
          visit badge_path @badges.first

          page.select user.full_name, :from => "award_badge_user"

          click_button "Award badge"

          user.badges.should have(1).badge
        end

        it 'should allow admin to remove a badge from a user' do
          user.badges << @badges.first

          visit badge_path @badges.first

          page.select user.full_name, :from => "remove_badge_user"

          click_button "Remove badge"

          user.badges.should have(0).badges
        end

      end

      context 'as class_admin ISBAT award all badges' do

        before do
          login_as class_admin
        end

        it 'should have a link in the Skills dropdown to add badges to users' do
          visit root_path

          click_link "Skills"
          click_link "Badges"

          page.should_be_on dashboard_badges_path
        end

        it 'should show all of the badges in the dashboard' do
          visit dashboard_badges_path

          @badges.each do |badge|
            page.should have_content badge.name
          end

        end

        it 'should have links to view each badge' do
          visit dashboard_badges_path

          @badges.each do |badge|
            page.should have_css "a[href='#{ badge_path(badge) }']"
          end

        end

        it 'should allow admin to award any badge' do
          visit badge_path @badges.first

          page.select user.full_name, :from => "award_badge_user"

          click_button "Award badge"

          user.badges.should have(1).badge
        end

        it 'should allow admin to remove a badge from a user' do
          user.badges << @badges.first

          visit badge_path @badges.first

          page.select user.full_name, :from => "remove_badge_user"

          click_button "Remove badge"

          user.badges.should have(0).badges
        end

      end

      context "as teacher ISBAT award my classes' badges" do

        before do
          login_as teacher
        end

        it 'should have a link in the Skills dropdown to add badges to users' do
          visit root_path

          click_link "Skills"
          click_link "Badges"

          page.should_be_on dashboard_badges_path
        end

        it 'should show the badges the teacher is allowed to award' do
          visit dashboard_badges_path

          @badges.each do |badge|
            page.should have_content badge.name
          end

        end

        it 'should have links to view each badge' do
          visit dashboard_badges_path

          @badges.each do |badge|
            page.should have_css "a[href='#{ badge_path(badge) }']"
          end

        end

        it 'should allow teacher to award his badges' do
          visit badge_path major_class_badge

          page.select user.full_name, :from => "award_badge_user"

          click_button "Award badge"

          user.badges.should have(1).badge
        end

        it 'should not allow teacher to award other badges to users' do
          visit badge_path @badges.first

          page.should_not have_content "Award badge"
        end

        it 'should allow teacher to remove his badges from a user' do
          user.badges << @badges.first

          visit badge_path @badges.first

          page.select user.full_name, :from => "remove_badge_user"

          click_button "Remove badge"

          user.badges.should have(0).badges
        end

        it 'should not allow teacher to remove other badges from his users' do
          # XXX
          user.badges << @badges.first

          vists badge_path @badges.first

          page.select user.full_name, :from => "remove_badge_user"

          page.should_not have_content "Remove badge"
        end

      end

    end

    describe 'Checking badge permissions' do
      pending "This probably isn't an integration test"
    end

  end

end

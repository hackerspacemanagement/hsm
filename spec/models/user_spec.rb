require 'spec_helper'

describe User do

  before do
    @user = Factory.create :user
  end
  
  it 'has a role' do
      @user.role.should be
      @user.role.name.should == 'User'
  end

  describe '#full_name' do

    it 'returns the users first and last name' do
      @user.full_name.should == "#{ @user.first_name } #{ @user.last_name}"
    end

  end

  describe '#gravatar_url' do

    it 'returns the gravatar image url for the user' do
      hash = Digest::MD5.hexdigest(@user.email.downcase.strip)
      @user.gravatar_url.should == "http://www.gravatar.com/avatar/#{ hash }?s=80"
    end

  end

end

require 'spec_helper'

describe User do

  let!(:current_user) do
    FactoryGirl.create(:user)
  end

  after do
    User.delete_all
  end

  describe "attributes" do
    it { should have_field(:email) }
    it { should have_field(:encrypted_password).of_type(String) }
    it { should have_field(:reset_password_token) }
    it { should have_field(:reset_password_sent_at).of_type(Time) }
    it { should have_field(:remember_created_at).of_type(Time) }
    it { should have_field(:sign_in_count).of_type(Integer) }
    it { should have_field(:current_sign_in_at).of_type(Time) }
    it { should have_field(:last_sign_in_at).of_type(Time) }
    it { should have_field(:current_sign_in_ip) }
    it { should have_field(:last_sign_in_ip) }
    it { should have_field(:confirmation_token) }
    it { should have_field(:confirmed_at) }
    it { should have_field(:confirmation_sent_at).of_type(Time) }
    it { should be_timestamped_document }
  end

  describe "validations" do
    it { should validate_uniqueness_of :email }
  end

  describe "associations" do
  end

  describe "scopes" do
    
  end

  describe "methods" do

    describe "#gravatar_url" do
      it "returns the gravatar of the user" do
        hash = Digest::MD5.hexdigest(current_user.email.downcase.strip)
        current_user.gravatar_url.should eql("http://www.gravatar.com/avatar/#{ hash }?s=80")
      end
    end

  end

end

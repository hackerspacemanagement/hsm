require 'spec_helper'

describe AdministrationController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'users'" do
    it "returns http success" do
      get 'users'
      response.should be_success
    end
  end

  describe "GET 'configuration'" do
    it "returns http success" do
      get 'configuration'
      response.should be_success
    end
  end

end

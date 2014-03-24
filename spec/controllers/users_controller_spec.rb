require 'spec_helper'

describe UsersController do
  before :each do
    @user = FactoryGirl.create :customer
  end
  describe "GET 'show'" do
    it "returns http success" do
      get 'show', id: @user
      response.should be_success
    end

    it 'is my page' do
      sign_in @user
      get 'show', id: @user
      assigns(:is_my_page).should be_true
    end

    it 'assign assigns the requested user as @user' do
      get 'show', id: @user
      assigns(:user).should eq(@user)
    end

    it 'render in customer layout if user is customer' do
      get 'show', id: @user
      response.should render_template('layouts/customer')
    end

    it 'render in photographer layout if user is photographer' do
      @user = FactoryGirl.create :photographer
      get 'show', id: @user
      response.should render_template('layouts/photographer')
    end

  end

end

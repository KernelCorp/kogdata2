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

    it 'render template for customer' do
      get 'show', id: @user
      response.should render_template('users/show/customer')
    end

    it 'render template for photographer' do
      @user = FactoryGirl.create :photographer
      get 'show', id: @user
      response.should render_template('users/show/photographer')
    end

  end

end

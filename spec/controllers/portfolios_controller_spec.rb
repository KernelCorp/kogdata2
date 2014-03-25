require 'spec_helper'

describe PortfoliosController do


  before(:each) do
    @photographer = FactoryGirl.create :photographer
  end


  describe "GET index" do
    it "assigns all images as @images" do
      image = @photographer.image_portfolios.create! attachment: fixture_file_upload(Rails.root.join('spec',
                                                                                           'images',
                                                                                           'test.png'),
                                                                           'image/png')
      get :index, { photographer_id: @photographer.id }
      assigns(:images).should eq([image])
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested image" do
      sign_in @photographer
      request.accept = 'application/json'
      image = @photographer.image_portfolios.create! attachment: fixture_file_upload(Rails.root.join('spec',
                                                                                           'images',
                                                                                           'test.png'),
                                                                           'image/png')
      expect {
        delete :destroy, {:id => image.to_param}
      }.to change{@photographer.reload.image_portfolios.count}.by(-1)
    end

 end

end

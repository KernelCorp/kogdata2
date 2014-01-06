require 'spec_helper'

describe ImagesController do


  before(:each) do
    @photographer = FactoryGirl.create :photographer
  end


  describe "GET index" do
    it "assigns all images as @images" do
      image = @photographer.images.create! attachment: fixture_file_upload(Rails.root.join('spec',
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
      image = @photographer.images.create! attachment: fixture_file_upload(Rails.root.join('spec',
                                                                                           'images',
                                                                                           'test.png'),
                                                                           'image/png')
      expect {
        delete :destroy, {:id => image.to_param}
      }.to change(Image, :count).by(-1)
    end
    it 'only owner can destroy image' do
      image = @photographer.images.create! attachment: fixture_file_upload(Rails.root.join('spec',
                                                                                           'images',
                                                                                          'test.png'),
                                                                          'image/png')
      expect {
        delete :destroy, {:id => image.to_param}
      }.to raise_error(CanCan::AccessDenied)
    end
 end

end

class PortfoliosController < ApplicationController
  before_filter :authenticate_user!, only: [:destroy, :create]
  before_action :set_photographer, only: [:index]

  skip_before_filter :verify_authenticity_token
  
  def create
    image = Image::Portfolio.new attachment: image_params[:file], photographer: current_user
    if image.save
      image = {
        original: image.attachment.url(:original),
        perview: image.attachment.url(:original),
        destroy: portfolio_path(image, format: :json)
      }
    end
    respond_with image, location: user_path(current_user)
  end

  def index
    @images = @photographer.image_portfolios
  end

  def destroy
    @image = current_user.image_portfolios.find params[:id]
    @image.destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end

  private

  def set_photographer
    @photographer = Photographer.find params[:photographer_id]
  end

  def image_params
    params.permit :file
  end
end

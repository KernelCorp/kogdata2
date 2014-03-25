class PortfoliosController < ApplicationController
  before_filter :authenticate_user!, only: :destroy
  before_action :set_photographer, only: [:index]

  # GET /images
  # GET /images.json
  def index
    @images = @photographer.image_portfolios
    render layout: 'photographer'
  end

  # DELETE /images/1
  # DELETE /images/1.json
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
end

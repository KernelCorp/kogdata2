class ImagesController < ApplicationController
  before_action :set_image,        only: [:destroy]
  before_action :set_photographer, only: [:index]

  # GET /images
  # GET /images.json
  def index
    @images = @photographer.images.all
  end

  # DELETE /images/1
  # DELETE /images/1.json
  def destroy
    @image.destroy
    authorize! :destroy, @image
    respond_to do |format|
      format.html { redirect_to photographer_images_url(current_user) }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image
      @image = Image.find(params[:id])
    end

    def set_photographer
      @photographer = Photographer.find params[:photographer_id]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params[:image]
    end
end

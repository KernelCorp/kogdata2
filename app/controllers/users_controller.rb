class UsersController < ApplicationController
  def show
    @user = User.find params[:id]
    render layout: (@user.is_a?(Photographer) ? 'layouts/photographer' : 'layouts/customer')
  end
end

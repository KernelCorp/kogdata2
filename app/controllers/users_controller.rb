class UsersController < ApplicationController
  def show
    @user = User.find params[:id]
    @is_my_page = current_user.eql? @user
    render layout: (@user.is_a?(Photographer) ? 'layouts/photographer' : 'layouts/customer')
  end
end

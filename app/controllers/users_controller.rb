class UsersController < ApplicationController
  def show
    @user = User.find params[:id]
    @is_my_page = current_user.eql? @user
    render "users/show/#{@user.class.name.underscore}"
  end
end

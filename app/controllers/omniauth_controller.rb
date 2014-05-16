class OmniauthController < ApplicationController

  def start
    data = env['omniauth.auth']

    vk_hash = { vk_id: data[:uid] }

    user = User.where vk_hash

    if user.size > 0
      sign_user user.first
    else
      session[:oauthorize] = vk_hash.merge name: data[:info][:first_name], surname: data[:info][:last_name]
      @user = User.new
      render 'devise/registrations/new_social'
    end
  end

  def finish
    redirect_to root_path unless session[:oauthorize]

    type = params[:user][:_type]

    user_class = %w( Customer Photographer ).include?( type ) && type.constantize
    @user = user_class.new user_params.merge( session[:oauthorize] ).merge password: SecureRandom.hex(8)

    if @user.save
      session[:oauthorize] = nil
      sign_user user
    else
      render 'devise/registrations/new_social'
    end
  end

  protected

  def sign_user( user )
    sign_in user

    redirect_to root_path
  end

  def user_params
    params.require(:user).permit :email, :terms, :_type
  end
  
end

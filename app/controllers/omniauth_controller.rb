class OmniauthController < ApplicationController

  def start
    data = env['omniauth.auth']

    vk_hash = { vk_id: data[:uid] }

    user = User.where vk_hash

    if user.size > 0
      sign_user user.first
    else
      session[:oauthorize] = vk_hash.merge name: data[:info][:first_name], surname: data[:info][:last_name]
    end
  end

  def finish
    redirect_to root_path unless session[:oauthorize]

    user_class = params[:user][:type] == 'Customer' ? Customer : Photographer
    user = user_class.create user_params.merge( session[:oauthorize] ).merge password: SecureRandom.hex(8)
    
    session[:oauthorize] = nil

    sign_user user
  end

  protected

  def sign_user( user )
    sign_in user

    redirect_to root_path
  end

  def user_params
    params.require(:user).permit :email
  end
  
end

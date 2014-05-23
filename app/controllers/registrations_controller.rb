class RegistrationsController < Devise::RegistrationsController
  def resource_class
    return super if params[:user].nil? || params[:user][:_type].nil?
    type = params[:user][:_type]
    type.constantize if %w( Customer Photographer ).include? type
  end

  protected

  def update_resource( resource, params )
    puts params
    if params[:password].blank? && params[:password_confirmation].blank?
      resource.update_without_password params.except( :email, :current_password )
    else
      resource.update_with_password params
    end
  end
end

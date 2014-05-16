class RegistrationsController < Devise::RegistrationsController
  def resource_class
    return super if params[:user].nil? || params[:user][:_type].nil?
    type = params[:user][:_type]
    type.constantize if %w( Customer Photographer ).include? type
  end
end

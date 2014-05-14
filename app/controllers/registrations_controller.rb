class RegistrationsController < Devise::RegistrationsController
  def resource_class
    return super if params[:user].nil? || params[:user][:type].nil?
    case params[:user][:type]
      when 'Customer'     then Customer
      when 'Photographer' then Photographer
    end
  end
end

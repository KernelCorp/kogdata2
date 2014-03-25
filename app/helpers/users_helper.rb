module UsersHelper
  def user_info_tag(user)
    render partial: "application/#{user.class.name.underscore}_info"
  end
end

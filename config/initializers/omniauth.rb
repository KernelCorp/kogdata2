Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?

  if Rails.env.production?
    provider :vkontakte, '3667679', 'nv4OpLwMmAL0JVznk8YR'
  else
    provider :vkontakte, '4251492', 'iOmxFio77a9DgrFNguoA'
  end
end

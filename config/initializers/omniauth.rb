Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?

  provider :vkontakte, '4251492', 'iOmxFio77a9DgrFNguoA'#, scope: 'email' 
end

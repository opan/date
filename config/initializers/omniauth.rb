Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "1582975658618850", "8081e4b7732938c3816173eeb7f93e3d", {:scope => 'user_about_me, publish_actions, manage_pages'}
end

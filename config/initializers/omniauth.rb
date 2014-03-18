OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
    #provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_SECRET']
    provider :facebook, FACEBOOK_APP_ID , FACEBOOK_SECRET, {:scope => "publish_actions, read_friendlists, friends_birthday"}
end


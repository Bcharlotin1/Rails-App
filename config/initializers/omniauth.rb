Rails.application.config.middleware.use OmniAuth::Builder do
    provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'], :skip_jwt => true
    #telling our rails application to use this middleware to 
    #the skip, is jst to skip the javascript tiken since we arent using it
  end
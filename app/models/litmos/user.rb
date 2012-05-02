class Litmos::User < ActiveResource::Base
  # Litmos::User.find(1, :params => Litmos::User::AUTH)  
  AUTH = Rails.application.config.custom['litmos']['auth']
  self.site = "https://api.litmos.com/v1.svc" 
end

require 'rest-client'
require './app/controllers/pets_controller.rb'
require 'pry'

class Token < ApplicationRecord

    def access_token_expired?
        (Time.now - self.updated_at) > 3300
    end

    def refresh_access_token
        if access_token_expired?
            body = {
                grant_type: 'client_credentials',
                client_id: ENV["client_id"],
                client_secret: ENV["client_secret"]
            }
            auth_response = RestClient.get('https://api.petfinder.com/v2/oauth2/token', body)
            auth_params = JSON.parse(auth_response)
            self.update(access_token: auth_params["access_token"])
        else
            puts "Current token has not yet expired"
            end
        end
end

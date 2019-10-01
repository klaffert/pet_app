class TokensController < ApplicationController
    def create
      @user = User.where("username ILIKE ?", params[:username]).first
      if @user.authenticate(params[:password])
        render json: {
          jwt: encode_token({id: @user.id, username: @user.username})
        }
      else
        head :not_found
      end
    end
  end
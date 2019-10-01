class UsersController < ApplicationController
  def index
  end

  def add
      @user = User.find(params[:user_id])
      @pet = Pet.find(params[:pet][:id])
      
  end

  def gallery
      @user = User.find(params[:id])
      render json: @user.pets
  end

  def destroy
      @user = User.find(params[:user_id])
      @user.pets.destroy(params[:pet])
  end

  def create
      @user = User.new(params.permit(:username, :password))
      if @user.save
          render json: {
              jwt: encode_token({id: @user.id, username: @user.username})
            }
      else
          :bad_request
      end
  end
end

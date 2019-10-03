require './app/models/token.rb'
require 'rest-client'
require 'pry'

class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :update, :destroy]

  # GET /pets
  def index
    @pets = Pet.all
    render json: @pets
  end

  def search
  petUrl = 'https://api.petfinder.com/v2/animals'

    header = {
      Authorization: "Bearer " + ENV[:access_token.to_s]
    }

    if params[:type] && params[:location] 
      petType = params[:type] 
      location = params[:location]

      petUrl = petUrl + '?type=' + petType + '&location=' + location 
     end

    response = RestClient.get(petUrl, header)
    results = JSON.parse(response)
    render json: results
    
  end

  # GET /pets/1
  def show
    @pet = Pet.find(params[:id])
    render json: @pet
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet
      @pet = Pet.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def pet_params
      params.require(:pet).permit(:type, :name, :breed, :size, :gender, :color, :age, :behavior)
    end
end

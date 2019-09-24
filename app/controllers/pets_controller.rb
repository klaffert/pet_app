require './app/models/token.rb'
require 'rest-client'
require 'pry'

class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :update, :destroy]

  # GET /pets
  def index

  end

  def search
  petUrl = 'https://api.petfinder.com/v2/animals'

    header = {
      Authorization: "Bearer " + ENV[:access_token.to_s]
    }

    if params[:type] && params[:location] && params[:distance]
      petType = params[:type] 
      location = params[:location]
      distance = params[:distance]
      petUrl = petUrl + '?type=' + petType + '&location=' + location + '&distance=' + distance
    end

    response = RestClient.get(petUrl, header)
    results = JSON.parse(response)
    render json: results
    
  end

  # GET /pets/1
  def show
    render json: @pet
  end

  # POST /pets
  def create
    @pet = Pet.new(pet_params)

    if @pet.save
      render json: @pet, status: :created, location: @pet
    else
      render json: @pet.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pets/1
  def update
    if @pet.update(pet_params)
      render json: @pet
    else
      render json: @pet.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pets/1
  def destroy
    @pet.destroy
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

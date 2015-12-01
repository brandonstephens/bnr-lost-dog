class PetsController < ApplicationController

  def index
    pets = Pet.pluck(:name).join(", ")
    render text: pets
  end

  def show
    pet = Pet.find(params[:id])
    message = "My #{pet.breed} named #{pet.name} is #{pet.color}"
    render text: message
  end

end
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

  def create
    pet = Pet.new(pet_params)

    if pet.save
      redirect_to pet_path(pet)
    else
      render text: pet.errors.full_messages, status: :unprocessable_entity
    end
  end

  private 

  def pet_params
    params.permit(:name, :breed, :color)
  end
end
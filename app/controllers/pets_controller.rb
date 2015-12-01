class PetsController < ApplicationController

  def index
    pets = Pet.pluck(:name).join(", ")
    render text: pets
  end

end
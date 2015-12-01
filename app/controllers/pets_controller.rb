class PetsController < ApplicationController

  skip_before_action :ensure_user_not_mobile, only: :index
  #before_action :prevent_remote_delete, only: :destroy

  def prevent_remote_delete
    unless request.remote_ip =~ /127\.0\.0\.1/ 
      redirect_to controller: 'application', action: 'nope'
    end
  end

  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.find(params[:id])
  end

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(pet_params)

    if @pet.save
      flash[:notice] = "Pet created successfully!"
      redirect_to pet_path(@pet)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @pet = Pet.find(params[:id])
  end

  def update
    @pet = Pet.find(params[:id])

    if @pet.update(pet_params)
      flash[:notice] = "Pet updated successfully!"
      redirect_to pet_path(@pet)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    pet = Pet.find(params[:id])
    pet.destroy
    redirect_to pets_path
  end

  private 

  def pet_params
    params.require(:pet).permit(:name, :breed, :color, :last_seen_at)
  end
end
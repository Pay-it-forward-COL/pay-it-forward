class Api::V1::FavorsController < ApplicationController
  before_action :authenticate_user!, only: :create

  def index
    @favors = Favor.all
    render json: @favors
  end

  def show
    @favor = current_user.favors.find(params[:id])
    render json: @favor
  end

  def create
    @favor = current_user.favors.new(favor_params)
    if @favor.save
      render json: @favor, status: :ok
    else
      render json: { errors: @favor.errors.as_json }, status: :bad_request
    end
  end

  private

  def favor_params
    params.require(:favor).permit(:title, :description, :latitude, :longitude, :category)
  end
end

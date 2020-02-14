class ActorsController < ApplicationController
  def show
    @actor = Actor.find(params[:id])
  end

  def index
    @actors = Actor.search(params[:search])
  end

  private
  def actor_params
    params.permit(:name, :search)
  end
end

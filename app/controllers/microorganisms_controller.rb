class MicroorganismsController < ApplicationController
  def new
  end

  def create
    Microorganism.create!(
      name: params[:name],
      code: params[:code],
      desired_pressure: params[:desired_pressure],
      desired_oxygen: params[:desired_oxygen],
      desired_temperature: params[:desired_temperature],
      desired_ph: params[:desired_ph],
    )

    redirect_to action: :new
  end

  private

  def microorganism_params
    params.permit(:name, :description)
  end
end

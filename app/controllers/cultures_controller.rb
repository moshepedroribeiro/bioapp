class CulturesController < ApplicationController
  def new
    @reactors = Reactor.all
    @microorganisms = Microorganism.all
  end

  def create
    Culture.create!(
      reactor_id: params[:reactor],
      microorganism_id: params[:microorganism],
      culture_end_date: params[:culture_end_date],
    )

    redirect_to action: :new
  end

  private

  def culture_params
    params.permit(:name, :description)
  end
end

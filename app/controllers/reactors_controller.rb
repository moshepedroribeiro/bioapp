class ReactorsController < ApplicationController
  def new

  end

  def create
    reactor = Reactor.create!(name: params[:name], code: params[:code])
    Culture.create!(reactor:, microorganism: nil, culture_end_date: Time.current)

    redirect_to action: :new
  end

  private

  def reactor_params
    params.permit(:name, :code)
  end
end

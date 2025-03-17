class ImageRepositoriesController < ApplicationController
  def index
    @reactors = Reactor.all
    params[:reactor] ||= @reactors.first.id
    @reactor = Reactor.find(params[:reactor])
  end
end

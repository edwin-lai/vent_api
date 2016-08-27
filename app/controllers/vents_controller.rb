class VentsController < ApplicationController
  def index
    render json: Vent.order(created_at: :desc)
  end

  def create
    return unless params['text']
    Vent.create(content: params['text'])
    index
  end
end

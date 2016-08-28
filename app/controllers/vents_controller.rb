class VentsController < ApplicationController
  def index
    @vents = Vent.where.not(content: nil).order(created_at: :desc)
    unless @vents.empty?
      @vents = @vents.map do |vent|
        {
          content: vent['content'],
          postTime: vent['created_at']
        }
      end
    end
    render json: @vents
  end

  def create
    return if params['text'].empty?
    @vent = Vent.new
    @vent['content'] = params['text']
    @vent.save
    index
  end
end
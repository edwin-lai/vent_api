class VentsController < ApplicationController
  def index
    @vents = Vent.where.not(content: nil).order(created_at: :desc).limit(100)
    @vents = @vents.map do |vent|
      {
        id: vent[:id],
        content: vent[:content],
        postTime: vent[:created_at],
        latitude: vent[:latitude],
        longitude: vent[:longitude],
        deviceID: vent[:device_id]
      }
    end
    render json: @vents
  end

  def create
    return if params['text'].empty?
    @vent = Vent.new
    @vent[:content] = params['text']
    @vent[:latitude] = params['latitude']
    @vent[:longitude] = params['longitude']
    @vent[:device_id] = params['deviceID']
    @vent.save
    index
  end

  def destroy
    @vent = Vent.find_by_id(params['id'])
    @vent.destroy if params['deviceID'] == @vent[:device_id]
    index
  end
end

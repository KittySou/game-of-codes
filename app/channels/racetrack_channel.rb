class RacetrackChannel < ApplicationCable::Channel
  def subscribed
    stream_for params[:id]
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
    broadcast_to(params[:id], data)
  end
end

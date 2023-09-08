class RacetrackChannel < ApplicationCable::Channel
  def subscribed
    stream_for params[:id]
    broadcast_to(params[:id], { playerId: params[:playerId], action: "appear" })
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def receive(data)
    broadcast_to(params[:id], data)
  end

  def progress(data)
    broadcast_to(params[:id], data)
  end

  def start_game(data)
    broadcast_to(params[:id], data)
  end
end

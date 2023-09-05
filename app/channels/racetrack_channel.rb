class RacetrackChannel < ApplicationCable::Channel
  def subscribed
    racetrack = Racetrack.find(params[:id])
    stream_for racetrack
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end

class Api::V1::ChallengesController < ApplicationController

  def show
    render json: ChallengeSerializer.new(Challenge.find(params[:id]))
  end
end
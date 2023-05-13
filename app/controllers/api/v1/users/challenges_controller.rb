class Api::V1::Users::ChallengesController < ApplicationController
  before_action :check_challenge, only: [:destroy]

  def destroy
    @challenge.destroy
  end

  def check_challenge
    @challenge = Challenge.find_by(user_id: params[:user_id], id: params[:id])
    if @challenge.nil?
      render json: ErrorSerializer.new("Challenge cannot be deleted", :not_found).challenge_destroy_error, status: :not_found
    end
  end
end
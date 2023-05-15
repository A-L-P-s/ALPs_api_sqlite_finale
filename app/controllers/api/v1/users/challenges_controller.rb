class Api::V1::Users::ChallengesController < ApplicationController
  before_action :check_challenge, only: [:destroy]

  def destroy
    @challenge.destroy
  end

  private
  def check_challenge
    @challenge = Challenge.find_by(user_id: params[:user_id], id: params[:id])
    if @challenge.nil?
      cant_delete_challenge
    end
  end
end
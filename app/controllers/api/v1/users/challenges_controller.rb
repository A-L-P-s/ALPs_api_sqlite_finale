class Api::V1::Users::ChallengesController < ApplicationController

  def destroy
    challenge = Challenge.find_by!(user_id: params[:user_id], id: params[:id])
    challenge.destroy
  end
end
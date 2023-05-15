class Api::V1::Users::ChallengesController < ApplicationController
  # before_action :check_challenge, only: [:destroy]

  def destroy
    @challenge = Challenge.find_by!(user_id: params[:user_id], id: params[:id])
    @challenge.destroy
  end

  # def check_challenge
  #   @challenge = Challenge.find_by(user_id: params[:user_id], id: params[:id])
  #   if @challenge.nil?
  #     render json: ErrorSerializer.new("Challenge cannot be deleted", :not_found).serializable_hash, status: :not_found
  #   end
  # end
end
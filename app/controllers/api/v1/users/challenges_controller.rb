class Api::V1::Users::ChallengesController < ApplicationController
  before_action :check_challenge, only: [:destroy]

  def show
    render json: ChallengeSerializer.new(Challenge.find(params[:id]))
  end
  
  def destroy
    @challenge.destroy
  end

  def new
    prompt_info = UnsplashFacade.new(params).prompt_data

    render json: ChallengeSerializer.new(prompt_info)
  end

  private
  def check_challenge
    @challenge = Challenge.find_by(user_id: params[:user_id], id: params[:id])
    if @challenge.nil?
      cant_delete_challenge
    end
  end
end

class Api::V1::Users::ChallengesController < ApplicationController
  before_action :check_challenge, only: [:destroy]

  def new
    prompt_info = UnsplashFacade.new(params).prompt_data
    render json: PromptSerializer.new(prompt_info)
  end

  def create
    user = User.find(params[:user_id])

    new_challenge = user.challenges.create(challenge_params)
    new_challenge.create_sentences(params[:sentences])
    updated_challenge = OpenaiFacade.check_challenge_with_ai(new_challenge)

    render json: ChallengeIdSerializer.new(updated_challenge)
  end

  def show
    render json: ChallengeSerializer.new(Challenge.find(params[:id]))
  end

  def destroy
    @challenge.destroy
  end

  private
  def challenge_params
    params.permit(user_id: params[:user_id], language: params[:language], verb: params[:verb], eng_verb: params[:eng_verb], image_url: params[:image_url], image_alt_text: params[:image_alt_text])
  end
  
  def check_challenge
    @challenge = Challenge.find_by(user_id: params[:user_id], id: params[:id])
    if @challenge.nil?
      cant_delete_challenge
    end
  end
end

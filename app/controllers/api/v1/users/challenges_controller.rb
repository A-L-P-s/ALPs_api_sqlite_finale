class Api::V1::Users::ChallengesController < ApplicationController
  before_action :check_challenge, only: [:destroy]

  def new
    prompt_info = UnsplashFacade.new(params).prompt_data
    render json: PromptSerializer.new(prompt_info)
  end

  def create
    user = User.find(params[:user_id])

    new_challenge = user.challenges.create(challenge_params)
    new_challenge.create_sentences(params[:challenge][:sentences])
    updated_challenge = OpenaiFacade.check_challenge_with_ai(new_challenge)
    
    render json: ChallengeIdSerializer.new(updated_challenge), status: :created
  end

  def show
    render json: ChallengeSerializer.new(Challenge.find(params[:id]))
  end

  def destroy
    @challenge.destroy
  end

  private

  def challenge_params
    params.permit(:user_id, :language, :verb, :eng_verb, :image_url, :image_alt_text)
  end

  def check_challenge
    @challenge = Challenge.find_by(user_id: params[:user_id], id: params[:id])
    return unless @challenge.nil?
    cant_delete_challenge
  end
end

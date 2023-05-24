class Api::V1::Users::ChallengesController < ApplicationController
  before_action :check_challenge, only: [:destroy]

  def new
    prompt_info = UnsplashFacade.new(params).prompt_data
    render json: PromptSerializer.new(prompt_info)
  end

  def create
    user = User.find(params[:user_id])
  
    ActiveRecord::Base.transaction do
      new_challenge = user.challenges.create(user_id: challenge_params[:user_id], language: challenge_params[:language], verb: challenge_params[:verb], eng_verb: challenge_params[:eng_verb], image_url: challenge_params[:image_url], image_alt_text: challenge_params[:image_alt_text])
      new_challenge.create_sentences(challenge_params[:sentences])
      updated_challenge = OpenaiFacade.check_challenge_with_ai(new_challenge)
      
      render json: ChallengeIdSerializer.new(updated_challenge), status: :created
    end
  end

  def show
    render json: ChallengeSerializer.new(Challenge.find(params[:id]))
  end

  def destroy
    @challenge.destroy
  end

  private

  def challenge_params
    params.permit(:user_id, :language, :verb, :eng_verb, :image_url, :image_alt_text, sentences: [:grammar_point, :eng_grammar_point, :user_sent])
  end

  def check_challenge
    @challenge = Challenge.find_by(user_id: params[:user_id], id: params[:id])
    return unless @challenge.nil?
    cant_delete_challenge
  end
end

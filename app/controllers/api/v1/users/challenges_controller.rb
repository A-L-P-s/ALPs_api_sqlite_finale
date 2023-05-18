class Api::V1::Users::ChallengesController < ApplicationController
  before_action :check_challenge, only: [:destroy]

  def new
    prompt_info = UnsplashFacade.new(params).prompt_data
    render json: PromptSerializer.new(prompt_info)
  end

  def create
    # Find user & create new challenge:
    user = User.find(params[:user_id])
    new_challenge = user.challenges.create(user_id: params[:user_id], language: params[:language], verb: params[:verb], eng_verb: params[:eng_verb], image_url: params[:image_url], image_alt_text: params[:image_alt_text])
  
    # Create new sentences for that challenge:
    #Huy & Mel
    # new_challenge.create_sentences

    params[:sentences].each do |sentence|
      new_challenge.sentences.create(grammar_point: sentence[:grammar_point], eng_grammar_point: sentence[:eng_grammar_point], user_sent: sentence[:user_sent])
    end
    
    # Send user sentences to AI, get response, and render json:
    updated_challenge = OpenaiFacade.check_challenge_with_ai(new_challenge)
    render json: ChallengeSerializer.new(updated_challenge)
  end

  def show
    render json: ChallengeSerializer.new(Challenge.find(params[:id]))
  end

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

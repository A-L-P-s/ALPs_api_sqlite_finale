class UnsplashFacade
  attr_reader :unsplash, :pref_lang, :user_id

  def initialize(params)
    @unsplash = UnsplashService.new
    @pref_lang = User.find(params[:user_id]).preferred_lang
    @user_id = params[:user_id]
  end

  def prompt_data
    all_verbs = Verb.verbs_by(pref_lang)
    single_verb = all_verbs.sample(1).pop

    grammars = GrammarPoint.grammar_points_by(pref_lang)
    grams = grammars.sample(2)
    image_info = random_image_and_text

    info = {
      user_id: @user_id,
      language: pref_lang,
      verb: single_verb.verb,
      eng_verb: single_verb.eng_verb,
      image_url: image_info[:url],
      image_alt_text: image_info[:alt_description],
      grammar_points: grammar_points_hash(grams)
    }
    Prompt.new(info)
    require 'pry'; binding.pry
  end

  def random_image_and_text
    info = unsplash.fetch_api
    hash = {
      url: info[0][:urls][:regular],
      alt_description: info[0][:alt_description]
    }
  end

  def grammar_points_hash(grams)
    grams.map do |gram|
      {
        grammar_point: gram.grammar_point,
        eng_grammar_point: gram.eng_grammar_point
      }
    end
  end
end

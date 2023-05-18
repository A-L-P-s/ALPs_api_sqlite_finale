class ChallengeSerializer
  include JSONAPI::Serializer
  attributes :user_id, :language, :verb, :eng_verb, :image_url, :image_alt_text 

  attributes :created_at do |object|
    object.created_at.strftime("%m/%e/%Y")
  end

  attributes :sentences do |serializer|
    serializer.sentences.map do |sentence|
      {
        id: sentence.id,
        grammar_points: sentence.grammar_point,
        eng_grammar_point: sentence.eng_grammar_point,
        user_sent: sentence.user_sent,
        ai_sent: sentence.ai_sent,
        ai_explanation: sentence.ai_explanation
      }
    end
  end
end

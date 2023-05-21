class UserSerializer
  include JSONAPI::Serializer
  attributes :name, :preferred_lang

  attributes :challenges do |serializer|
    serializer.challenges.map do |challenge|
      {
        challenge_id: challenge.id.to_s,
        language: challenge.language,
        verb: challenge.verb,
        eng_verb: challenge.eng_verb,
        image_url: challenge.image_url,
        image_alt_text: challenge.image_alt_text,
        created_at: challenge.created_at.strftime("%m/%e/%Y")
      }
    end
  end
end

class ChallengeSerializer
  include JSONAPI::Serializer
  set_type :challenge
  attributes :user_id, :language, :verb, :eng_verb, :image_url, :image_alt_text, :created_at

  attributes :sentences do |object|
    object.sentences
  end
end

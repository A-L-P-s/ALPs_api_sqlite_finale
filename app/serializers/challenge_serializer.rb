class ChallengeSerializer
  include JSONAPI::Serializer 
  set_type :challenge
  attributes :id, :user_id, :language, :verb, :eng_verb, :image_url, :image_alt_text
end
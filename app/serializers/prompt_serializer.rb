class PromptSerializer
  include JSONAPI::Serializer
  attributes :user_id, :language, :verb, :eng_verb, :image_url, :image_alt_text, :grammar_points
end

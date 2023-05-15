class UserSerializer
  include JSONAPI::Serializer
  set_type :user
  attributes :name, :preferred_lang, :challenges 
end

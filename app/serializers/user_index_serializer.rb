class UserIndexSerializer
  include FastJsonapi::ObjectSerializer
  set_type :user
  attributes :name, :preferred_lang
end
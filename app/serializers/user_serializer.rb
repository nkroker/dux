class UserSerializer
  include JSONAPI::Serializer
  attributes :username, :email, :api_key, :created_at
end

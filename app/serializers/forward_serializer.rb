class ForwardSerializer
  include JSONAPI::Serializer
  attributes :global_url, :active, :created_at
end

class UserSerializer
  include JSONAPI::Serializer
  attributes :id, :email, :username
end

# we can call the serializer using the following command: 
# render json: {
  # data: { user: UserSerializer.new(current_user).serializable_hash[:data][:attributes]}
# }

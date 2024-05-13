class ProfileSerializer
  include JSONAPI::Serializer
  attributes :employee_number, :first_name, :last_name
end

class DepartmentSerializer
  include JSONAPI::Serializer
  attributes :id, :department_name
end

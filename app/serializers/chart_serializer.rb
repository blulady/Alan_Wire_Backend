class ChartSerializer
  include JSONAPI::Serializer
  attributes :chart_title, :chart_data
end

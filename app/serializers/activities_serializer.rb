class ActivitiesSerializer < MainSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :description
end

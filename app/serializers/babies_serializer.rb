class BabiesSerializer < MainSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :age, :mother_name, :father_name, :address, :phone
end

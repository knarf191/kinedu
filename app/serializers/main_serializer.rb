class MainSerializer
  include FastJsonapi::ObjectSerializer

  def collection_attr_array # for multiple objects
    serializable_hash[:data].map {|k| k[:attributes] }
    # Hash[serializable_hash[:data].map {|k| [k[:id], k[:attributes]] }]
  end

  def data
    serializable_hash[:data][:attributes]
  end
end
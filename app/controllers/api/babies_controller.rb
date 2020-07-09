class Api::BabiesController < ApplicationController
  def index
    begin
      babies = Baby.all
      respond serializer: BabiesSerializer.new(babies).collection_attr_array, status: 200
    rescue StandardError => e
      respond serializer: e.message, status: 400
    end
  end
end

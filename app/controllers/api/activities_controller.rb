class Api::ActivitiesController < ApplicationController
  def index
    begin
      activities = Activity.all
      respond(serializer: ActivitiesSerializer.new(activities).collection_attr_array, status: 200)
    rescue StandardError => e
      respond serializer: e.message, status: 400
    end
  end
end

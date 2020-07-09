class ApplicationController < ActionController::Base
  private
  def respond(opts={})
    serialized_json = opts[:serializer] || hashify_vars
    status = opts[:status]
    serialized_json = opts[:serializer] if opts[:serializer].class == String
    respond_to do |format|
      format.json { render json: serialized_json, status: status  }
    end
  end
end

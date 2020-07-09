class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  include InstanceVarsToHash

  private
  def respond(opts={})
    layout  = opts[:layout].nil? || opts[:layout]
    view    = opts[:view] || params[:action]
    serialized_json = opts[:serializer] || hashify_vars
    status = opts[:status]
    serialized_json = opts[:serializer] if opts[:serializer].class == String
    respond_to do |format|
      format.html { render view, layout: layout }
      format.json { render json: serialized_json, status: status  }
    end
  end
end

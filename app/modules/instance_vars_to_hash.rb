module InstanceVarsToHash

  def hashify_vars
    vars = instance_variables.reject { |key| ignored_vars.include?(key) }
    vars.map.with_object({}) do |instance_var, result_hash|
      add_var_to_hash(result_hash, instance_var)
    end
  end

  def jsonify_vars
    hashify_vars.to_json
  end

  private

  def add_var_to_hash(obj, var)
    var_string = var.to_s[1..-1]
    obj[var_string] = instance_variable_get(var)
  end

  def ignored_vars # rails generated controller instance variables
    [ :@_action_has_layout,
      :@_routes,
      :@_request,
      :@_response,
      :@_lookup_context,
      :@_action_name,
      :@_response_body,
      :@marked_for_same_origin_verification,
      :@_config,
      :@_params
    ]
  end
end
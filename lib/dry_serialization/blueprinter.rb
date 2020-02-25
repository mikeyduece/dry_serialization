module DrySerialization::Blueprinter

  def serialized_resource(resource, blueprint, options = {})
    JSON.parse(blueprint.render(resource, options), symbolize_names: true)
  end
  
end
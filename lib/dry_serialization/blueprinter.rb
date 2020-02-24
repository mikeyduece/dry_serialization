require 'blueprinter'

class DrySerialization::Blueprinter

  def serialized_resource(resource, blueprint, options = {})
    blueprint.render(resource, options)
  end
end
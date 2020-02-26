module DrySerialization::FastJsonapi
  
  def serialized_resource(resource, serializer, options = {})
    if resource.is_a?(ActiveRecord::Relation) || resource.is_a?(Array)
      options[:is_collection] = true
    else
      options[:is_collection] = false
    end
    
    serializer.new(resource, options)
  end
end
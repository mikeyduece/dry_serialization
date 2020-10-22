module DrySerialization
  module Deserializable

    def deserialized_payload(base_params, object = nil)
      attrs = attributes(base_params)
      id = dig_id(base_params, object)
      attrs.merge!(id: id) if id

      build_nested_relationships(attrs, base_params)
    end

    private

    def build_nested_relationships(attrs, base_params)
      relations = relationships(base_params)
      attrs.merge!(transform_object_values(relations))
    end

    def transform_object_values(relations)
      relations.to_h.each_with_object({}) do |(key, data), acc|
        key = "#{key}_attributes" unless key.end_with?('_attributes')
        acc[key] ||= transform_relationships_to_get_attributes(data)
        transform_nested_relationships_to_get_attributes(acc[key], data)
      end
    end

    def transform_nested_relationships_to_get_attributes(parent_relation_hash, data)
      nested_relationships = data[:data].respond_to?(:key?) ? relationships(data) : nil
      return unless nested_relationships

      nested_relationships.each do |(relation, rel_data)|
        hash = { "#{relation}_attributes": transform_relationships_to_get_attributes(rel_data) }
        parent_relation_hash.merge!(hash)
      end
    end

    def transform_relationships_to_get_attributes(object)
      case object[:data]
        when Hash
          object[:attributes] || object.dig(:data, :attributes)
        when Array
          object[:data].map do |e|
            attrs = transform_relationships_to_get_attributes({ data: e })
            attrs.merge!(transform_object_values(e[:relationships]))
          end
        else
          return
      end
    end

    def dig_id(base_params, object)
      return unless object
      
      base_params.dig(:data, :id)
      send("#{object}_id")
    rescue
      nil
    end

    def attributes(base_params)
      base_params.dig(:data, :attributes)
    end

    def relationships(base_params)
      base_params.dig(:data, :relationships)
    end

  end
end
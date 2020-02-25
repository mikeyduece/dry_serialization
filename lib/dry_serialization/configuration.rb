module DrySerialization
  class Configuration
    attr_writer :serializer
    
    def initialize
      @serializer = nil
    end
    
    def serializer
      @serializer ||= :blueprinter
    end
    
  end
end
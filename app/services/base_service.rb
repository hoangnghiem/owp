class BaseService

  # Implementation should return Success/Error object
  def call
    raise NotImplementedError
  end

  class Success
    attr_reader :data
    def initialize(data)
      @data = data
    end
    
    def success?
      true
    end
  end

  class Error
    attr_reader :error
    def initialize(error)
      @error = error
    end
    
    def success?
      false
    end
  end
end


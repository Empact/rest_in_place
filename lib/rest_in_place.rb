require "rest_in_place/version"

module RestInPlace
  class Engine < Rails::Engine
    # no ruby code here!
  end
  
  class << self
    def include_root_in_json?
      if defined?(Mongoid)
        Mongoid.config.include_root_in_json
      elsif defined?(ActiveRecord)
        ActiveRecord::Base.include_root_in_json
      else
        false
      end
    end

    def id_chars
      if defined?(Mongoid)
        '[a-f0-9]'
      elsif defined?(ActiveRecord)
        '\d'
      else
        raise NotImplementedError, 'Neither ActiveRecord nor Mongoid was detected'
      end
    end
  end
end

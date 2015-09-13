module Browserino
  module Browser
    @name = nil
    @version = nil
    def self.name ua = nil
      unless ua.nil?
        browsers = Browserino::PATTERNS[:browser].keys
        until browsers.empty? || !@name.nil?
          subject = browsers.shift
          if (ua.match(Browserino::PATTERNS[:browser][subject][:name]))
            @name = subject
        end
      end
      @name
    end

    def self.version
    end
  end
end

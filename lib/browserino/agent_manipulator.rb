module Browserino
  @ua = nil

  class AgentManipulator
    def initialize(ua)
      @ua = ua
      standardize_ios!
      strip_legacy_mozilla!
      strip_fake_opera_version!
    end

    def standardize_ios!
      @ua = @ua.gsub(/ip((a|o)d|hone)/i, 'ios')
    end

    def strip_legacy_mozilla!
      @ua = @ua.gsub(/(Mozilla\/[\d\.]+)/i, '')
    end

    def strip_fake_opera_version!
      @ua = @ua.gsub(/ope?ra?(\/|\s)?9\.80/i, '')
    end

    def ua
      @ua
    end
  end
end

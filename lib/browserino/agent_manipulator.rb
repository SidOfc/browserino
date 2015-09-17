module Browserino
  @ua = nil

  class AgentManipulator
    def initialize(ua)
      p '================'
      p 'Before stripfest'
      p ua
      p '================'
      #strip fake opera version
      ua.gsub!(/ope?ra?(\/|\s)?[\d\.]+/i, '')
      #replace MAC OS X with macintosh for better and easier recognition
      ua.gsub!(/mac\s?os\s?x/i, 'macintosh')
      #strip legacy mozilla since we don't need the info
      ua.gsub!(/(Mozilla\/[\d\.]+)/i, '')
      @ua = ua.strip
      p '================'
      p 'after stripfest'
      p @ua
      p '================'
    end

    def ua
      @ua
    end
  end
end

module Browserino
  module Core
    LIES = [
      [%r{(Mozilla/[\d\.]+)}i, true],
      [/9\.80/, /opera/i],
      [%r{(?:apple)?webkit/[\d\.]+}i, /presto/i],
      [/(?:ms)?ie/i, /rv:/i],
      [/linux/i, /android/i],
      [/x11/i, /bsd/i],
      [/windows\snt/i, /windows\sphone/i]
    ].freeze
  end
end

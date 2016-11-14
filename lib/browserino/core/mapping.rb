module Browserino
  module Mapping
    def self.const?(const)
      constants(true).include?(const)
    end

    # Taken from https://en.wikipedia.org/wiki/Android_version_history
    # 15 - 09 - 2015
    ANDROID = {
      '1.0' => [10],
      '1.1' => [11],
      'Cupcake 3' => [15],
      'Cupcake 4' => [16],
      'Eclair 5' => [20],
      'Eclair 6' => [201],
      'Eclair 7' => [21],
      'Froyo 8' => [22, 221, 222, 223],
      'Gingerbread 9' => [23, 231, 232],
      'Gingerbread 10' => [233, 234, 235, 236, 237],
      'Honeycomb 11' => [30],
      'honeycomb 12' => [31],
      'Honeycomb 13' => [32, 321, 322, 323, 324, 325, 326],
      'Ice Cream Sandwich 14' => [40, 401, 402],
      'Ice Cream Sandwich 15' => [403, 404],
      'Jelly Bean 16' => [41, 411, 412],
      'Jelly Bean 17' => [42, 421, 422],
      'Jelly Bean 18' => [43, 431],
      'KitKat 19' => [44, 441, 442, 443, 444],
      'Lollipop 21' => [50, 501, 502],
      'Lollipop 22' => [51, 511],
      'Marshmallow 23' => [60, 601],
      'Nougat 24' => [70],
      'Nougat 25' => [71]
    }.freeze

    # Taken from https://nl.wikipedia.org/wiki/OS_X
    # 15 - 09 - 2015
    MACINTOSH = {
      'Cheetah' => [100],
      'Puma' => [101],
      'Jaguar' => [102],
      'Panther' => [103],
      'Tiger' => [104],
      'Leopard' => [105],
      'Snow Leopard' => [106],
      'Lion' => [107],
      'Mountain Lion' => [108],
      'Mavericks' => [109],
      'Yosemite' => [1010],
      'El Capitan' => [1011],
      'Sierra' => [1012]
    }.freeze

    # Taken from https://nl.wikipedia.org/wiki/Windows_NT
    # 15 - 09 - 2015
    WINDOWS = {
      '3.5' => [35],
      '4' => [40],
      '2000' => [50],
      'XP' => [51, 52],
      'Vista' => [60],
      '7' => [61],
      '8' => [62],
      '8.1' => [63],
      '10' => [100]
    }.freeze

    BLACKBERRY = {}.freeze
    BSD = {}.freeze
    IOS = {}.freeze
    LINUX = {}.freeze
    SOLARIS = {}.freeze
    WEBOS = {}.freeze
    WINDOWS_PHONE = {}.freeze
  end
end

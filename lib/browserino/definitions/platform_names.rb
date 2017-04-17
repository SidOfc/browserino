# frozen_string_literal: true
Browserino.define do
  platform_name :android,            for: :android,   range: '1'..'1.4.9'
  platform_name :cupcake,            for: :android,   range: '1.5'..'1.9.9'
  platform_name :eclair,             for: :android,   range: '2'..'2.1'
  platform_name :froyo,              for: :android,   range: '2.2'..'2.2.3'
  platform_name :gingerbread,        for: :android,   range: '2.2.4'..'2.3.7'
  platform_name :honeycomb,          for: :android,   range: '3'..'3.2.6'
  platform_name :ice_cream_sandwich, for: :android,   range: '4'..'4.0.4'
  platform_name :jelly_bean,         for: :android,   range: '4.1'..'4.3.1'
  platform_name :kitkat,             for: :android,   range: '4.4'..'4.4.4'
  platform_name :lollipop,           for: :android,   range: '5'..'5.1.1'
  platform_name :marshmallow,        for: :android,   range: '6'..'6.1.1'
  platform_name :nougat,             for: :android,   range: '7'..'7.1.1'

  platform_name :cheetah,            for: :macintosh, range: '10.0'..'10.0.9'
  platform_name :puma,               for: :macintosh, range: '10.1'..'10.1.9'
  platform_name :jaguar,             for: :macintosh, range: '10.2'..'10.2.9'
  platform_name :panther,            for: :macintosh, range: '10.3'..'10.3.9'
  platform_name :tiger,              for: :macintosh, range: '10.4'..'10.4.9'
  platform_name :leopard,            for: :macintosh, range: '10.5'..'10.5.9'
  platform_name :snow_leopard,       for: :macintosh, range: '10.6'..'10.6.9'
  platform_name :lion,               for: :macintosh, range: '10.7'..'10.7.9'
  platform_name :mountain_lion,      for: :macintosh, range: '10.8'..'10.8.9'
  platform_name :mavericks,          for: :macintosh, range: '10.9'..'10.9.9'
  platform_name :yosemite,           for: :macintosh, range: '10.10'..'10.10.9'
  platform_name :el_capitan,         for: :macintosh, range: '10.11'..'10.11.9'
  platform_name :sierra,             for: :macintosh, range: '10.12'..'10.12.9'

  platform_name :windows_dos,        for: :windows,   range: '3.1'..'4.0'
  platform_name :windows_2000,       for: :windows,   range: '5.0'..'5.0.9'
  platform_name :windows_xp,         for: :windows,   range: '5.1'..'5.2.9'
  platform_name :windows_vista,      for: :windows,   range: '6.0'..'6.0.9'
  platform_name :windows_7,          for: :windows,   range: '6.1'..'6.1.9'
  platform_name :windows_8,          for: :windows,   range: '6.2'..'6.3'
  platform_name :windows_10,         for: :windows,   range: '10.0'..'10.0.9'
end

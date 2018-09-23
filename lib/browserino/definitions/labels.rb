# frozen_string_literal: true

Browserino.config.define do
  # labels will be defined before a client has been initialized
  # they will not be filtered before being injected into the Client

  # labels will be matched against values of #name, #engine and #platform and
  # will create #label, #engine_label and #platform_label properties
  # respectively. These enjoy all the features that regular defined properties
  # in for instance methods enjoy, such as automatic question methods like
  # client.platform_label? :mavericks and they can also be used in
  # the method this alias is for, e.g. client.platform? :mavericks or
  # client.is? :mavericks

  label :android,            for: :android,       range: '1'..'1.4.9'
  label :cupcake,            for: :android,       range: '1.5'..'1.9.9'
  label :eclair,             for: :android,       range: '2'..'2.1'
  label :froyo,              for: :android,       range: '2.2'..'2.2.3'
  label :gingerbread,        for: :android,       range: '2.2.4'..'2.3.7'
  label :honeycomb,          for: :android,       range: '3'..'3.2.6'
  label :ice_cream_sandwich, for: :android,       range: '4'..'4.0.4'
  label :jelly_bean,         for: :android,       range: '4.1'..'4.3.1'
  label :kitkat,             for: :android,       range: '4.4'..'4.9.9'
  label :lollipop,           for: :android,       range: '5'..'5.9.9'
  label :marshmallow,        for: :android,       range: '6'..'6.9.9'
  label :nougat,             for: :android,       range: '7'..'7.9.9'
  label :oreo,               for: :android,       range: '8'..'8.9.9'
  label :pie,                for: :android,       range: '9'..'9.9.9'

  # support android up to the letter Z by following their version scheme which
  # uses versions X.0.0 up to X.9.9. the callable methods will be named like
  # android_[LETTER] where letter can be anything between 'p' and 'z' inclusive
  (:p..:z).reduce 9 do |vnum, letter|
    label "android_#{letter}".to_sym, for: :android,
                                      range: vnum.to_s.."#{vnum}.9.9"
    vnum + 1
  end

  label :cheetah,            for: :macintosh,     range: '10.0'..'10.0.9'
  label :puma,               for: :macintosh,     range: '10.1'..'10.1.9'
  label :jaguar,             for: :macintosh,     range: '10.2'..'10.2.9'
  label :panther,            for: :macintosh,     range: '10.3'..'10.3.9'
  label :tiger,              for: :macintosh,     range: '10.4'..'10.4.9'
  label :leopard,            for: :macintosh,     range: '10.5'..'10.5.9'
  label :snow_leopard,       for: :macintosh,     range: '10.6'..'10.6.9'
  label :lion,               for: :macintosh,     range: '10.7'..'10.7.9'
  label :mountain_lion,      for: :macintosh,     range: '10.8'..'10.8.9'
  label :mavericks,          for: :macintosh,     range: '10.9'..'10.9.9'
  label :yosemite,           for: :macintosh,     range: '10.10'..'10.10.9'
  label :el_capitan,         for: :macintosh,     range: '10.11'..'10.11.9'
  label :sierra,             for: :macintosh,     range: '10.12'..'10.12.9'
  label :high_sierra,        for: :macintosh,     range: '10.13'..'10.13.9'
  label :mojave,             for: :macintosh,     range: '10.14'..'10.14.9'

  label :dos,                for: :windows,       range: '3.1'..'4.0'
  label :windows98,          for: :windows,       range: '98'..'98.9.9'
  label :windows2000,        for: :windows,       range: '5.0'..'5.0.9'
  label :xp,                 for: :windows,       range: '5.1'..'5.2.9'
  label :vista,              for: :windows,       range: '6.0'..'6.0.9'
  label :windows7,           for: :windows,       range: '6.1'..'6.1.9'
  label :windows8,           for: :windows,       range: '6.2'..'6.3'
  label :windows10,          for: :windows,       range: '10.0'..'10.9.9'
  label :windows10,          for: :windows_phone, range: '10.0'..'10.9.9'
  label :outlook2016,        for: :outlook,       range: '16.0'..'16.9.9'
end

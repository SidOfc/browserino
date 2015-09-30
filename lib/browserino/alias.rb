module Browserino
  ALIAS = {
    browser_name: {
      'ie' => ['msie'],
      Browserino::UNKNOWN => ['unknown', :unknown, '', nil]
    },
    browser_version: {
      Browserino::UNKNOWN => ['unknown', :unknown, '', nil]
    },
    engine_name: {
      'webkit' => ['applewebkit'],
      Browserino::UNKNOWN => ['unknown', :unknown, '', nil]
    },
    engine_version: {
      Browserino::UNKNOWN => ['unknown', :unknown, '', nil]
    },
    system_name: {
      Browserino::UNKNOWN => ['unknown', :unknown, '', nil]
    },
    system_version: {
      Browserino::UNKNOWN => ['unknown', :unknown, '', nil]
    },
    system_architecture: {
      'x64' => ['64', 'x86_64'],
      'x32' => ['32', 'i686', 'i383', 'x86_32'],
      Browserino::UNKNOWN => ['unknown', :unknown, '', nil]
    }
  }
end

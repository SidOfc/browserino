module Browserino
  ALIAS = {
    browser_name: {
      'ie' => ['msie'],
      'unknown' => ['unknown', :unknown, '']
    },
    browser_version: {
      'unknown' => ['unknown', :unknown, '']
    },
    engine_name: {
      'webkit' => ['applewebkit'],
      'unknown' => ['unknown', :unknown, '']
    },
    engine_version: {
      'unknown' => ['unknown', :unknown, '']
    },
    system_name: {
      'unknown' => ['unknown', :unknown, '']
    },
    system_version: {
      'unknown' => ['unknown', :unknown, '']
    },
    system_architecture: {
      'x64' => ['64', 'x86_64'],
      'x32' => ['32', 'i686', 'i383'],
      'unknown' => ['unknown', :unknown, '', nil]
    }
  }
end

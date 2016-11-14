module Browserino
  module Core
    ALIAS = {
      name: { 'ie' => /msie/ },
      engine_name: { 'webkit' => /applewebkit/ },
      system_name: {
        'solaris' => /s(?:unos|olaris)/,
        'linux' => /ubuntu|x11/,
        'windows_phone' => /windows\sphone/,
        'ios' => /ip(?:[ao]d|hone)/,
        'webos' => /w(?:eb)?os/
      },
      console_name: {
        'nintendo_ds' => /nintendo\s\d?ds/,
        'wii' => /wiiu?/
      },
      system_architecture: {
        'x64' => /(?:x86_|amd|wow)?64/,
        'x32' => /(?:(?:x86_)?32|i[36]8[36])/
      }
    }.freeze
  end
end

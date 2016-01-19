module Browserino
  ALIAS = {
    browser_name: { 'ie' => /msie/ },
    engine_name: { 'webkit' => /applewebkit/ },
    system_name: {
      'linux' => /ubuntu|x11/,
      'windows_phone' => /windows\sphone/,
      'ios' => /ip(?:[ao]d|hone)/
    },
    system_architecture: {
      'x64' => /(?:x86_|amd|wow)?64/,
      'x32' => /(?:(?:x86_)?32|i[36]8[36])/
    }
  }
end

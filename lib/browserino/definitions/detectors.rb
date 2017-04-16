Browserino.define do
  smart_detect :version,        with: ':name/([\d\._]+)',   flags: [:i]
  smart_detect :engine_version, with: ':engine/([\d\._]+)', flags: [:i]
end

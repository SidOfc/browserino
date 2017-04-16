Browserino.define do
  smart_detect :version,        with: ':name/([\d\.]+)',        flags: [:i]
  smart_detect :engine_version, with: ':engine/([\d\.]+)', flags: [:i]
end

# frozen_string_literal: true

Browserino.config.define do
  # when a property like :locale cannot be found and
  # Browserino.parse is called with a headers hash in addition to the ua,
  # prop_missing method allows you to define a fallback block which
  # receives all gathered props so far and the headers as arguments.
  # the return value of this block will then be used as value for that property.

  # prop_missing calls are executed in order of definition,
  # this allows you to leverage properties found in prior prop_missing calls
  # as seen with :locales and :locale below
  prop_missing :locales do |http_headers|
    http_headers[:accept_language]
      .to_s.scan(/(\w{2}(?:[_\-]\w{2})?)(?:;q=([\d.]+))?/i)
      .map { |(locale, quality)| [locale, (quality || 1).to_f] }
      .sort_by { |a| -a[1] }
      .map(&:first)
  end

  prop_missing :locale do |_http_headers, props|
    props[:locales].first
  end
end

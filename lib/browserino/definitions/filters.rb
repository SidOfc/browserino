# frozen_string_literal: true
Browserino.define do
  # after an identity is found, it's values are filtered in two stages
  # first, filters will parse all statically defined values (e.g.) no regexp
  # or block within matchers, after that, smart matcher patterns will be
  # conditionally added and parsed with the previously collected values and
  # then also filtered

  # this is a global filter, multiple can be defined and they will all run
  # before any named filters
  filter do |value|
    case value
    when TrueClass, FalseClass, NilClass, Proc then value
    when %r{\A[\d_\.]+\z}i then value.to_s.strip.tr('_', '.')
    else value.to_s.downcase.strip.gsub(%r{[\s-]+}i, '_').to_sym
    end
  end

  # this is a named filter, it defines the same filter for 3 properties
  # a named filter can only be defined once and will be overwritten when
  # redefined
  filter :version, :engine_version, :platform_version do |value|
    Browserino::Version.new value
  end

  filter :platform do |value|
    value = :ios     if %r{ip(?:[ao]d|hone)}.match? value
    value = :webos   if %r{w(?:eb)?os}.match? value
    value = :linux   if %r{ubuntu|x11}.match? value
    value = :solaris if %r{s(?:unos|olaris)}.match? value
    value
  end

  filter :architecture do |value|
    value = :x64 if value && %r{(?:x86_|amd|wow)?64|i686}i.match?(value)
    value = :x32 if value && value != :x64
    value
  end

  filter :mobile do |value|
    !value.to_s.strip.empty?
  end
end

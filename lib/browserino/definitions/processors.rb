# frozen_string_literal: true
Browserino.define do
  # fter an identity is found, it's values are processed in two stages
  # first, processors will parse all statically defined values (e.g.) no regexp
  # or block within matchers, after that, smart matcher patterns will be
  # conditionally added and parsed with the previously collected values and
  # then also processed

  # this is a global processor, multiple can be defined and they will all run
  # before any named processors
  process do |value|
    case value
    when TrueClass, FalseClass, NilClass, Proc then value
    when %r{\A[\d_\.]+\z}i then value.to_s.strip.tr('_', '.')
    else value.to_s.downcase.strip.gsub(%r{[\s-]+}i, '_').to_sym
    end
  end

  # this is a named processor, it defines the same processor for 3 properties
  # a named processor can only be defined once and will be overwritten when
  # redefined
  process :version, :engine_version, :platform_version do |version|
    Browserino::Client::Version.new version
  end

  process :platform do |platform|
    platform = :ios     if %r{ip(?:[ao]d|hone)}.match? platform
    platform = :webos   if %r{w(?:eb)?os}.match? platform
    platform = :linux   if %r{ubuntu|x11}.match? platform
    platform = :solaris if %r{s(?:unos|olaris)}.match? platform
    platform
  end

  process :architecture do |arch|
    arch = :x64 if arch && %r{(?:x86_|amd|wow)?64|i686}i.match?(arch)
    arch = :x32 if arch && arch != :x64
    arch
  end
end
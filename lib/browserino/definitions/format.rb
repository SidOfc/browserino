# frozen_string_literal: true
Browserino.define do
  format_all do |value|
    case value
    when TrueClass, FalseClass, NilClass then value
    when %r{^[\d_\.]+$}i then value.to_s.strip.tr('_', '.')
    else value.to_s.downcase.strip.gsub(%r{[\s-]+}i, '_').to_sym
    end
  end

  formatter :system_name do |system_name|
    system_name = :ios     if %r{ip(?:[ao]d|hone)}.match? system_name
    system_name = :webos   if %r{w(?:eb)?os}.match? system_name
    system_name = :linux   if %r{ubuntu|x11}.match? system_name
    system_name = :solaris if %r{s(?:unos|olaris)}.match? system_name
    system_name
  end

  formatter :system_arch do |x|
    x = :x64 if x && %r{(?:x86_|amd|wow)?64|i686}i.match?(x)
    x = :x32 if x && x != :x64
    x
  end

  formatter :version, :engine_version, :system_version do |version|
    (version && version.to_s.split('_').join('.')) || version
  end
end

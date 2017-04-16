# frozen_string_literal: true
Browserino.define do
  format_all do |value|
    case value
    when TrueClass, FalseClass, NilClass, Proc then value
    when %r{\A[\d_\.]+\z}i then value.to_s.strip.tr('_', '.')
    else value.to_s.downcase.strip.gsub(%r{[\s-]+}i, '_').to_sym
    end
  end

  formatter :version, :engine_version, :system_version do |version|
    Browserino::Agent::Version.new version
  end

  formatter :system_name do |system_name|
    system_name = :ios     if %r{ip(?:[ao]d|hone)}.match? system_name
    system_name = :webos   if %r{w(?:eb)?os}.match? system_name
    system_name = :linux   if %r{ubuntu|x11}.match? system_name
    system_name = :solaris if %r{s(?:unos|olaris)}.match? system_name
    system_name
  end

  formatter :system_arch do |arch|
    arch = :x64 if arch && %r{(?:x86_|amd|wow)?64|i686}i.match?(arch)
    arch = :x32 if arch && arch != :x64
    arch
  end
end

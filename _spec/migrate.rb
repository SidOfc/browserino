require 'pry'
require 'yaml'
require_relative 'user_agents'
require_relative 'user_agents_browsers'

short  = UserAgents::Browsers
consts = short.constants(true) - [:USE_FOR_UNKNOWN]
out = []
consts.each do |const|
  out += short.const_get(const).values.map do |hsh|
    hsh.map do |ua, data|
      data.each do |key, value|
        value = value.shift if value.is_a? Array
        data[key] = case value
                    when TrueClass, FalseClass, NilClass then value
                    when %r{^[\d_\.]+$}i then value.to_s.strip.tr('_', '.')
                    else value.to_s.downcase.strip.gsub(%r{[\s-]+}i, '_').to_sym
                    end
      end

      data[:system_name] = :ios     if %r{ip(?:[ao]d|hone)}.match? data[:system_name].to_s
      data[:system_name] = :webos   if %r{w(?:eb)?os}.match? data[:system_name].to_s
      data[:system_name] = :linux   if %r{ubuntu|x11}.match? data[:system_name].to_s
      data[:system_name] = :solaris if %r{s(?:unos|olaris)}.match? data[:system_name].to_s

      data[:architecture] = :x64 if data[:architecture] && %r{(?:x86_|amd|wow)?64|i686}i.match?(data[:architecture])
      data[:architecture] = :x32 if data[:architecture] && data[:architecture] != :x64

      { user_agent: ua, name: data[:name], engine: data[:engine_name],
        engine_version: data[:engine_version], system_name: data[:system_name],
        system_version: data[:system_version], locale: data[:locale],
        architecture: data[:system_architecture] }
    end
  end.flatten
end

yaml = { browsers: out }.to_yaml

puts yaml

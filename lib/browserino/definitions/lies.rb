# frozen_string_literal: true
Browserino.define do
  before_parse do |s|
    s.gsub! %r{applewebkit}i, 'webkit'
    s.gsub! %r{(Mozilla/[\d\.]+)}i, ''

    s.gsub!(%r{chrome|safari}i, '').gsub!('OPR', 'opera') if %r{OPR}.match? s
    s.gsub! %r{9\.80}, '' if %r{opera}i.match? s
    s.gsub! %r{webkit/}i, '' if %r{presto}i.match? s
    s.gsub! %r{(?:ms)?ie}i, '' if %r{rv:}i.match? s
    s.gsub! %r{android|linux}i, '' if %r{tizen}i.match? s
    s.gsub! %r{linux}i, '' if %r{android|s(?:unos|olaris)|w(?:eb)?os}i.match? s
    s.gsub! %r{x11}i, '' if %r{bsd|s(?:unos|olaris)}i.match? s
    s.gsub! %r{windows\snt}i, '' if %r{windows\sphone}i.match? s
    s.gsub! %r{rv:}i, '' if %r{servo}i.match? s
  end
end

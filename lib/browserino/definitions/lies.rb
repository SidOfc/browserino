# frozen_string_literal: true
Browserino.define do
  # executes before parsing the user agent, 's' in this case is the actual
  # user agent string in full glory. Do manipulations as you wish, I'm
  # using it to successfully strip lies from the user agent and to sometimes
  # simplify a word e.g. 'AppleWebKit' => 'webkit'

  # the string does not have to be returned as it will not be assigned to the
  # result of this block, use destructive(!) methods instead

  # I decided to implement this to reduce the complexity and length of the
  # user agent in order to allow for faster matching of identities
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

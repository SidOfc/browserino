# frozen_string_literal: true
Browserino.config.define do
  # aliasses will be defined after a Client has been initialized
  # only the aliasses matching the Client will be defined
  alias_for :firefox,    :ff
  alias_for :windows,    :win
  alias_for :macintosh,  :mac, :osx, :macos
  alias_for :blackberry, :bb
  alias_for :ie,         :internet_explorer
  alias_for :facebook,   :fb
  alias_for :duckduckgo, :ddg
end

# frozen_string_literal: true

Browserino.config.define do
  # aliasses will be defined after a Client has been initialized
  # only the aliasses matching the Client will be defined
  alias_for :firefox,         :ff
  alias_for :windows,         :win
  alias_for :windows7,        :win7
  alias_for :windows8,        :win8
  alias_for :windows10,       :win10
  alias_for :macintosh,       :mac, :osx, :macos
  alias_for :blackberry,      :bb
  alias_for :ie,              :internet_explorer
  alias_for :facebook,        :fb
  alias_for :duckduckgo,      :ddg
  alias_for :chromeos,        :cros
  alias_for :nintendobrowser, :netfrontbrowser
  alias_for :ipd,             :alertsite
  alias_for :qupzilla,        :falkon

  # backwards compat with android_(p..z) labels
  alias_for :pie,             :android_p
end

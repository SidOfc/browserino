# frozen_string_literal: true

# automatically set type to :validator for each defined matcher
# additionally, set text to true to each of the matchers automatically
Browserino.config.validators do
  match %r{cse\shtml\svalidator}i, name: :cse_html_validator
  match %r{p3p\svalidator}i,       name: :p3p_validator
  match %r{wdg_validator}i,        name: :wdg_validator
  match %r{w3c_validator}i,        name: :w3c_validator
  match %r{htmlparser}i,           name: :htmlparser
  match %r{csscheck}i,             name: :csscheck
  match %r{cynthia}i,              name: :cynthia

  match %r{w3c_css_validator}i,    name: :w3c_css_validator,
                                   version: %r{validator_jfouffa/([\d\.]+)}i
end

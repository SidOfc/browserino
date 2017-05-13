# frozen_string_literal: true

# automatically set type to :validator for each defined matcher
# additionally, set text to true to each of the matchers automatically
Browserino.config.validators do
  match %r{xenu\slink\ssleuth}i,   name: :xenu_link_sleuth
  match %r{screaming\sfrog\sseo}i, name: :screaming_frog_seo_spider
  match %r{rel\slink\schecker}i,   name: :rel_link_checker_lite
  match %r{a1\swebsite\sanalyze}i, name: :a1_website_analyzer
  match %r{w3c_multipage_valida}i, name: :w3c_multipage_validator
  match %r{cse\shtml\svalidator}i, name: :cse_html_validator
  match %r{p3p\svalidator}i,       name: :p3p_validator
  match %r{w3c-checklink}i,        name: :w3c_checklink
  match %r{w3c_i18n-checker}i,     name: :w3c_i18n_checker
  match %r{w3c_unicorn}i,          name: :w3c_unicorn
  match %r{w3c-mobileok}i,         name: :w3c_mobileok
  match %r{wdg_validator}i,        name: :wdg_validator
  match %r{w3c_validator}i,        name: :w3c_validator
  match %r{fplinkchecker}i,        name: :fplinkchecker
  match %r{linkchecker}i,          name: :linkchecker
  match %r{linkwalker}i,           name: :linkwalker
  match %r{linkexaminer}i,         name: :linkexaminer
  match %r{feedvalidator}i,        name: :feedvalidator
  match %r{htmlparser}i,           name: :htmlparser
  match %r{csscheck}i,             name: :csscheck
  match %r{checkbot}i,             name: :checkbot
  match %r{cynthia}i,              name: :cynthia

  match %r{validator\.nu}i,        name: :validator_nu,
                                   version: %r{idator\.nu/([\d\.]+)}i

  match %r{htmlchecker}i,          name: :anw_htmlchecker,
                                   version: %r{htmlchecker/([\d\.]+)}i

  match %r{w3c_css_validator}i,    name: :w3c_css_validator,
                                   version: %r{validator_jfouffa/([\d\.]+)}i
end

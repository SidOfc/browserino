# frozen_string_literal: true

Browserino.config.define do
  # Aside from the logic going on in this file, the order in which things are
  # written is important! If you would move the :midori matcher below the
  # :safari matcher and you would run rspec, you would see failures due to
  # the change in order. The order can be changed - no problem,
  # as long as the tests keep running

  # a set of global matchers that will use formatted properties found earlier
  # they will also be applied to every matcher unless that matcher has it's own
  # (or inherited a property through like) property set up for
  # the defined smart matcher
  smart_match :version,        with: ':name[\s/]?v?([\d\._]+)', flags: [:i]
  smart_match :engine_version, with: ':engine[\s/]?([\d\._]+)', flags: [:i]

  # a simple set of global matchers that will be merged and scanned
  # with a specific matcher when the final client object is created
  match do
    locale           %r{(?<!nintendo)[;\s(](?!nt)([a-z]{2}(?:[-_][a-z]{2})?)\-?[;)/](?!\d)}i
    architecture     %r{((?:(?:x|x86_|amd|wow|win)64)|i[36]86|arm)}i

    # set locales prop which will be populated with accept-language header
    # locales sorted by quality when Browserino.parse receives
    # a hash of http headers as second argument
    locales          []

    smarttv          %r{(?:smart[\-\s]|hbb|apple\s|google|g)(tv)}i

    tablet           %r{(ipad|transformer|slider|a\d+f;|tablet|lenovo
                        |\s\w+tab\s)}xi

    mobile           %r{(bolt|nokia|samsung(?!b)|mobi(?:le)?|i?p(?:[ao]d|hone)
                        |android|bb\d+|blackberry|iemobile|fennec|bada|meego
                        |tizen|vodafone|kindle|kf\w\w|palmos|huawei|moto|lumia
                        |oneplus|fxos|nexus|opera\sm(?:ob|in)i|zte|htc(?!\-))}xi

    platform         %r{.*(wiiu?|nintendo\sds|playstation|windows\sphone|windows
                        |kf\w\w|mac(?:intosh|\sos\sx)|android|ip(?:[ao]d|hone)
                        |blackberry|linux|ubuntu|beos|unix|bsd|s(?:unos|olaris)
                        |tizen|xbox|amigaos|w(?:eb)?os|(?<!mi)cros|bada|palmos
                        |kindle|symbiano?s?|sailfish|meego|darwin|syllable|fxos
                        |(?<!en)risc|rim\stablet\sos|haiku|morphos|debian)}xi

    platform_version %r{(?:windows(?:\sphone(?:\sos)?)?|nt|android|linux/?|fxos
                        |mac\sos\sx(?:\s\w+\s)?|(?:cpu\s|ip(?:[ao]d|hone)\s)os
                        |blackberry|bb|s(?:unos|olaris)/?|w(?:eb)?os/|tizen
                        |risc\s*|amigaos/?|cros\s[\w-]+|ows\sxp|darwin|palmos
                        |bada/?|symbianos/?|rim\stablet\sos)\s?([\d\._]+)}xi

    device           %r{(alcatel|all(?:tell|view)|htc|kindle|kf\w\w|apple\s?tv
                        |iphone|ipad|a\d+f;|archos|transformer|slider|me\d+x|zte
                        |blackberry|\d+dl|venue|desire|oneplus|lenovo|lumia|moto
                        |huawei\b|motorola|nokia|nexus|\b\w+tab\b|lg[-l]
                        |(?<!p)hp)}xi
  end
end

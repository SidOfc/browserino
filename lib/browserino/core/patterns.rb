module Browserino
  module Core
    PATTERNS = {
      browser: {
        vivaldi: {
          name: /(?<name>vivaldi)/i,
          version: %r{vivaldi/(?<version>[\d\.]+)}i
        },

        ucbrowser: {
          name: /(?<name>ucbrowser)/i,
          version: %r{ucbrowser/?(?<version>[\d\.]+)}i
        },

        bolt: {
          name: /(?<name>bolt)/i,
          version: %r{bolt/(?<version>[\d\.]+)}i
        },

        opera_mini: {
          name: /(?<name>ope?ra?\smini)/i,
          version: %r{(?:ope?ra?\smini)/(?<version>[\d\.]+)}i
        },

        opera: {
          name: /(?<name>ope?ra?)/i,
          version: %r{(?:ope?ra?|version)[/\s](?<version>[\d\.]+)}i
        },

        maxthon: {
          name: /(?<name>maxthon)/i,
          version: %r{maxthon[\s/](?<version>[\d\.]+)}i
        },

        edge: {
          name: /(?<name>edge)/i,
          version: %r{edge/(?<version>[\d\.]+)}i
        },

        ie: {
          name: /(?<name>msie|trident)/i,
          version: /(?:(?:ms)?ie\s|rv:)(?<version>[\d\.]+)/i
        },

        seamonkey: {
          name: /(?<name>seamonkey)/i,
          version: %r{seamonkey/(?<version>[\d\.]+)}i
        },

        firefox: {
          name: /(?<name>(?:fire|water)(?:fox|bird)
                 |ice(?:weasel|cat)|netscape)/xi,
          version: %r{(?:(?:fire|water)(?:fox|bird)|ice(?:weasel|cat)
                      |netscape)/?(?<version>[\d\.]+)}xi
        },

        chrome: {
          name: /(?<name>chrome?(ium|plus)?)/i,
          version: %r{chrome?(?:ium|plus)?/(?<version>[\d\.]+)}i
        },

        safari: {
          name: /(?<name>safari)/i,
          version: %r{(?:version|safari)/(?<version>[\d\.]+)}i
        }
      },

      bot: {
        googlebot: { name: /(?<name>googlebot)/i },
        yahoo_slurp: { name: /(?<name>yahoo\!\sslurp)/i },
        msnbot: { name: /(?<name>msnbot)/i },
        bingbot: { name: /(?<name>bingbot)/i },
        baiduspider: { name: /(?<name>baiduspider)/i },
        yandexbot: { name: /(?<name>yandexbot)/i },
        sosospider: { name: /(?<name>sosospider)/i },
        exabot: { name: /(?<name>exabot)/i },
        sogou_spider: { name: /(?<name>sogou\s?spider)/i },
        nutch: { name: /(?<name>nutch)/i },
        scrapy: { name: /(?<name>scrapy)/i },
        dataparksearch: { name: /(?<name>dataparksearch)/i },
        beslistbot: { name: /(?<name>beslistbot)/i }
      },

      engine: {
        name: /(?<name>((apple)?webkit|presto|gecko|trident))/i,
        version: %r{(?:(?:apple)?webkit|presto|rv:|trident)
                    [/\s]?(?<version>[\d\.]+)}xi
      },

      operating_system: {
        name: /(?<name>windows(?:\sphone(?:\sos)?)?|macintosh|android
                |ip(?:[ao]d|hone)|blackberry|linux|ubuntu|x11|bsd)/xi,
        version: %r{(?:windows(?:\sphone(?:\sos)?)?|nt|mac\sos\sx|android
                    |(cpu\s|ip([ao]d|hone)\s)os|blackberry.*?version/|bb)
                    \s?(?<version>[\d\._]+)}xi,
        architecture: /(?<architecture>((?:x|x86_|amd|wow)64)|i(3|6)86)/i,
        mobile: /bolt|nokia|samsung|mobi(?:le)?|android|i?p(?:[ao]d|hone)|bb\d+
                |blackberry|iemobile|fennec|bada|meego|vodafone
                |t\-mobile|opera\sm(?:ob|in)i/xi,
        locale: /\s(?<locale>\w{2}(?:\-\w{2})?)[;\)]/
      }
    }.freeze
  end
end

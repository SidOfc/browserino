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
          name: /opera(?!ti(?:on|ng))|opr/i,
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
                 |ice(?:weasel|cat)|netscape|superswan)/xi,
          version: %r{(?:(?:fire|water)(?:fox|bird)|ice(?:weasel|cat)
                      |netscape|superswan)/?(?<version>[\d\.]+)}xi
        },

        brave: {
          name: /(?<name>brave)/i,
          version: %r{brave/(?<version>[\d\.]+)}i
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
        google: { name: /(?<name>googlebot)/i },
        yahoo_slurp: { name: /(?<name>yahoo\!\sslurp)/i },
        msn: { name: /(?<name>msnbot)/i },
        bing: { name: /(?<name>bingbot)/i },
        baiduspider: { name: /(?<name>baiduspider)/i },
        yandex: { name: /(?<name>yandexbot)/i },
        sosospider: { name: /(?<name>sosospider)/i },
        exa: { name: /(?<name>exabot)/i },
        sogou_spider: { name: /(?<name>sogou\s?spider)/i },
        nutch: { name: /(?<name>nutch)/i },
        scrapy: { name: /(?<name>scrapy)/i },
        dataparksearch: { name: /(?<name>dataparksearch)/i },
        holmes: { name: /(?<name>holmes)/i },
        ask: { name: /(?<name>ask)\sjeeves/i },
        duckduckgo: { name: /(?<name>duckduckgo)/i },
        beslist: { name: /(?<name>beslistbot)/i },
        facebook: { name: /(?<name>face(?:bookexternalhit|bot))/i },
        twitter: { name: /(?<name>twitterbot)/i },
        linkedin: { name: /(?<name>linkedinbot)/i },
        instagram: { name: /(?<name>instagram)/i },
        pinterest: { name: /(?<name>pinterest)/i },
        tumblr: { name: /(?<name>tumblr)/i }
      },

      engine: {
        name: /(?<name>((apple)?webkit|presto|gecko|trident))/i,
        version: %r{(?:(?:apple)?webkit|presto|rv:|trident)
                    [/\s]?(?<version>[\d\.]+)}xi
      },

      operating_system: {
        name: /(?<name>windows(?:\sphone(?:\sos)?)?|macintosh|android
                |ip(?:[ao]d|hone)|blackberry|linux|ubuntu|x11|bsd
                |s(?:unos|olaris))/xi,
        version: %r{(?:windows(?:\sphone(?:\sos)?)?|nt|mac\sos\sx|android
                    |(cpu\s|ip([ao]d|hone)\s)os|blackberry.*?version/|bb
                    |s(?:unos|olaris)/?)\s?(?<version>[\d\._]+)}xi,
        architecture: /(?<architecture>((?:x|x86_|amd|wow)64)|i(3|6)86)/i,
        mobile: /bolt|nokia|samsung|mobi(?:le)?|android|i?p(?:[ao]d|hone)|bb\d+
                |blackberry|iemobile|fennec|bada|meego|vodafone
                |t\-mobile|opera\sm(?:ob|in)i/xi,
        locale: /\s(?<locale>\w{2}(?:\-\w{2})?)[;\)]/
      }
    }.freeze
  end
end

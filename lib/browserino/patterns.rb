module Browserino
  PATTERNS = {
    browser: {
      vivaldi: {
        name: /(?<name>vivaldi)/i,
        version: /vivaldi\/(?<version>[\d\.]+)/i
      },

      ucbrowser: {
        name: /(?<name>ucbrowser)/i,
        version: /ucbrowser\/?(?<version>[\d\.]+)/i
      },

      bolt: {
        name: /(?<name>bolt)/i,
        version: /bolt\/(?<version>[\d\.]+)/i
      },

      opera_mini: {
        name: /(?<name>ope?ra?\smini)/i,
        version: /(?:ope?ra?\smini)\/(?<version>[\d\.]+)/i
      },

      opera: {
        name: /(?<name>ope?ra?)/i,
        version: /(?:ope?ra?|version)(\/|\s)(?<version>[\d\.]+)/i
      },

      maxthon: {
        name: /(?<name>maxthon)/i,
        version: /maxthon(?:\s|\/)(?<version>[\d\.]+)/i
      },

      edge: {
        name: /(?<name>edge)/i,
        version: /(?:edge\/)(?<version>[\d\.]+)/i
      },

      ie: {
        name: /(?<name>msie|trident)/i,
        version: /(?:(?:ms)?ie\s|rv\:)(?<version>[\d\.]+)/i
      },

      seamonkey: {
        name: /(?<name>seamonkey)/i,
        version: /seamonkey\/(?<version>[\d\.]+)/i
      },

      firefox: {
        name: /(?<name>(?:fire|water)(?:fox|bird)|ice(?:weasel|cat)|netscape)/i,
        version: /(?:(?:fire|water)(?:fox|bird)|ice(?:weasel|cat)|netscape)[\/]?(?<version>[\d\.]+)/i
      },

      chrome: {
        name: /(?<name>chrome?(ium|plus)?)/i,
        version: /chrome?(?:ium|plus)?\/(?<version>[\d\.]+)/i
      },

      safari: {
        name: /(?<name>safari)/i,
        version: /(?:version|safari)\/(?<version>[\d\.]+)/i
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
      version: /(?:(?:apple)?webkit|presto|rv:|trident)[\/\s]?(?<version>[\d\.]+)/i
    },

    operating_system: {
      name: /(?<name>windows(?:\sphone(?:\sos)?)?|macintosh|android|ip(?:[ao]d|hone)|blackberry|linux|ubuntu|x11|bsd)/i,
      version: /(?:windows(?:\sphone(?:\sos)?)?|nt|mac\sos\sx|android|(cpu\s|i)os|blackberry.*?version\/|bb)\s?(?<version>[\d\._]+)/i,
      architecture: /(?<architecture>((?:x|x86_|amd|wow)64)|i(3|6)86)/i,
      mobile: /bolt|nokia|samsung|mobi(?:le)?|android|i?p(?:[ao]d|hone)|bb\d+|blackberry|iemobile|fennec|bada|meego|vodafone|t\-mobile|opera\sm(?:ob|in)i/i,
      locale: /\s(?<locale>\w{2}(?:\-\w{2})?)[;\)]/
    }
  }
end

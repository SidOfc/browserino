module Browserino
  PATTERNS = {
    browser: {
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
        version: /(?:edge\/)(?<version>[\d\.b]+)/i
      },

      ie: {
        name: /(?<name>msie|trident)/i,
        version: /(?:(?:ms)?ie\s|rv\:)(?<version>[\d\.b]+)/i
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

    engine: {
      name: /(?<name>((apple)?webkit|gecko|trident|presto))/i,
      version: /(?:(?:apple)?webkit|rv:|trident|presto)[\/\s]?(?<version>[\d\.]+)/i
    },

    operating_system: {
      name: /(?<name>windows|macintosh|android|ios|blackberry|linux|ubuntu|x11)/i,
      version: /(?:nt|mac\sos\sx|android|(cpu\s|i)os|blackberry)\s(?<version>[\d\._]+)/i,
      architecture: /(?<architecture>((?:x|x86_|amd|wow)64)|i(3|6)86)/i
    }
  }
end

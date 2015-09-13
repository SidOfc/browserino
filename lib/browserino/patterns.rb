# See this as a giant CSS selector.
# It will iterate through hashes recursively.
# If the :name is set in e.g. :browser then it will be global for all browsers.
# However if in :browser there is a hash called :opera with a :name
# then that will override the global setting.
# This basically follows the 'Cascading Style Sheet' flow

module Browserino
  PATTERNS = {
    browser: {
      opera: {
        name: /(?<name>ope?ra?)/i,
        version: /(ope?ra?|version)(\/|\s)(?<version>[\d\.]+)/i
      },

      maxthon: {
        name: /(?<name> maxthon)/i,
        version: /maxthon(\s|\/)(?<version> [\d\.]+)/i
      },

      ie: {
        name: /(?<name> msie|trident)/i,
        version: /(msie\s|rv\:)(?<version> [\d\.b]+)/i
      },

      firefox: {
        name: /(?<name> (fire|water)(fox|bird)|ice(weasel|cat)|netscape)/i,
        version: /(fire|water)(fox|bird)|ice(weasel|cat)|netscape(?<version> [\d\.]+)/i
      },

      chrome: {
        name: /(?<name> chrome?(ium|plus)?)/i,
        version: /chrome?(ium|plus)?\/(?<version> [\d\.]+)/i
      },

      safari: {
        name: /(?<name> safari)/i,
        version: /(version|safari)\/(?<version> [\d\.]+)/i
      }
    },

    engine: {
      name: /(?<name> ((apple)?webkit|gecko|trident|presto))/i,
      version: /((apple)?webkit|gecko|trident|presto)(?<version> [\d\.]+)/i
    },

    operating_system: {
      name: /(?<name> windows|macintosh|linux)/i,
      version: /(nt|mac\sos\sx)\s(?<version> [\d\._]+)/i,
      architecture: /(?<architecture> (x?(86_)?64)|i(3|6)86)/i
    }
  }
end

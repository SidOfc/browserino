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
        name: /(<name> ope?ra?)/,
        version: /(ope?ra?|version)(<version>\/|\s)([\d\.]+)/
      },

      ie: {
        name: /(<name> msie|trident)/,
        version: /(msie\s|rv\:)(<version> [\d\.b]+)/
      },

      maxthon: {
        name: /(<name> maxthon)/,
        version: /maxthon(\s|\/)(<version> [\d\.]+)/
      },

      firefox: {
        name: /(<name> (fire|water)(fox|bird)|ice(weasel|cat)|netscape)/,
        version: /(fire|water)(fox|bird)|ice(weasel|cat)|netscape(<version> [\d\.]+)/
      },

      chrome: {
        name: /(<name> chrome?(ium|plus)?)/,
        version: /chrome?(ium|plus)?\/(<version> [\d\.]+)/
      },

      safari: {
        name: /(<name> safari)/,
        version: /(version|safari)\/(<version> [\d\.]+)/
      }
    },

    engine: {
      name: /(<name> ((apple)?webkit|gecko|trident|presto))/,
      version: /((apple)?webkit|gecko|trident|presto)(<version> [\d\.]+)/
    },

    operating_system: {
      name: /(<name> windows|macintosh|linux)/,
      version: /(nt|mac\sos\sx)\s(<version> [\d\._]+)/,
      architecture: /(<architecture> (x?(86_)?64)|i(3|6)86)/
    }
  }
end

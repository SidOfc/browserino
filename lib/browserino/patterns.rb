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
        name: /ope?ra?/,
        version: /(ope?ra?|version)(\/|\s)([\d\.]+)/
      },

      ie: {
        name: /msie|trident/,
        version: /(msie\s|rv\:)([\d\.b]+)/
      },

      maxthon: {
        name: /maxthon/,
        version: /maxthon(\s|\/)([\d\.]+)/
      },

      firefox: {
        name: /(fire|water)(fox|bird)|ice(weasel|cat)|netscape/,
        version: /(fire|water)(fox|bird)|ice(weasel|cat)|netscape([\d\.]+)/
      },

      chrome: {
        name: /chrome?(ium|plus)?/,
        version: /chrome?(ium|plus)?\/([\d\.]+)/
      },

      safari: {
        name: /safari/,
        version: /(version|safari)\/([\d\.]+)/
      }
    },

    engine: {
      name: /((apple)?webkit|gecko|trident|presto)/,
      version: /((apple)?webkit|gecko|trident|presto)([\d\.]+)/
    },

    operating_system: {
      name: /windows|macintosh|linux/,
      version: /(nt|mac\sos\sx)\s([\d\._]+)/,
      architecture: /(x?(86_)?64)|i(3|6)86/
    }
  }
end

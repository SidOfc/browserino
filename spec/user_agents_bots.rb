module UserAgents
  module Bots
    GOOGLEBOT = {
      'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)' => {
        bot_name: 'googlebot',
        bot?: true,
        known?: true
      },
      'Googlebot/2.1 (+http://www.googlebot.com/bot.html)' => {
        bot_name: 'googlebot',
        bot?: true,
        known?: true
      }
    }
    YAHOO_SLURP = {
      'Mozilla/5.0 (compatible; Yahoo! Slurp; http://help.yahoo.com/help/us/ysearch/slurp)' => {
        bot_name: 'yahoo slurp',
        bot?: true,
        known?: true
      }
    }
    MSNBOT = {
      'msnbot/2.1' => {
        bot_name: 'msnbot',
        bot?: true,
        known?: true
      },
      'msnbot/1.1 (+http://search.msn.com/msnbot.htm)' => {
        bot_name: 'msnbot',
        bot?: true,
        known?: true
      }
    }
    BINGBOT = {
      'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)' => {
        bot_name: 'bingbot',
        bot?: true,
        known?: true
      }
    }
  end
end

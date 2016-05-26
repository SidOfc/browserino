module UserAgents
  module Bots
    GOOGLE = {
      'Mozilla/5.0 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)' => {
        bot_name: 'google',
        bot?: true,
        known?: true
      },
      'Googlebot/2.1 (+http://www.googlebot.com/bot.html)' => {
        bot_name: 'google',
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
    MSN = {
      'msnbot/2.1' => {
        bot_name: 'msn',
        bot?: true,
        known?: true
      },
      'msnbot/1.1 (+http://search.msn.com/msnbot.htm)' => {
        bot_name: 'msn',
        bot?: true,
        known?: true
      }
    }
    BING = {
      'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)' => {
        bot_name: 'bing',
        bot?: true,
        known?: true
      }
    }
    BAIDUSPIDER = {
      'Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)' => {
        bot_name: 'baiduspider',
        bot?: true,
        known?: true
      },
      'Baiduspider+(+http://www.baidu.com/search/spider_jp.html)' => {
        bot_name: 'baiduspider',
        bot?: true,
        known?: true
      }
    }
    YANDEX = {
      'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)' => {
        bot_name: 'yandex',
        bot?: true,
        known?: true
      }
    }
    SOSOSPIDER = {
      'Sosospider+(+http://help.soso.com/webspider.htm)' => {
        bot_name: 'sosospider',
        bot?: true,
        known?: true
      }
    }
    EXA = {
      'Exabot/2.0' => {
        bot_name: 'exa',
        bot?: true,
        known?: true
      }
    }
    SOGOU_SPIDER = {
      'sogou spider' => {
        bot_name: 'sogou spider',
        bot?: true,
        known?: true
      }
    }
    NUTCH = {
      'NutchCVS/0.8-dev (Nutch; http://lucene.apache.org/nutch/bot.html; nutch-agent@lucene.apache.org)' => {
        bot_name: 'nutch',
        bot?: true,
        known?: true
      }
    }
    SCRAPY = {
      'Scrapy/2.0 (+http://scrapy.org)' => {
        bot_name: 'scrapy',
        bot?: true,
        known?: true
      }
    }
    DATAPARKSEARCH = {
      'DataparkSearch/4.37-23012006 ( http://www.dataparksearch.org/)' => {
        bot_name: 'dataparksearch',
        bot?: true,
        known?: true
      },
      'DataparkSearch/4.35-02122005 ( http://www.dataparksearch.org/)' => {
        bot_name: 'dataparksearch',
        bot?: true,
        known?: true
      }
    }
    BESLIST = {
      'Mozilla/5.0 (compatible; BeslistBot; nl; BeslistBot 1.0; http://www.beslist.nl/' => {
        bot_name: 'beslist',
        bot?: true,
        known?: true
      }
    }
    FACEBOOK = {
      'facebookexternalhit/1.1 (+http://www.facebook.com/externalhit_uatext.php)' => {
        bot_name: 'facebook',
        bot?: true,
        known?: true,
        fb?: true
      },

      'facebot' => {
        bot_name: 'facebook',
        bot?: true,
        known?: true,
        fb?: true
      }
    }
    TWITTER = {
      'twitterbot' => {
        bot_name: 'twitter',
        bot?: true,
        known?: true
      }
    }
    LINKEDIN = {
      'linkedinbot' => {
        bot_name: 'linkedin',
        bot?: true,
        known?: true
      }
    }
    INSTAGRAM = {
      'Instagram 4.2.5 (iPad3,6; iPhone OS 7_0_6; en_US; en) AppleWebKit/420+' => {
        bot_name: 'instagram',
        bot?: true,
        known?: true
      },

      'Instagram 6.0.1 (iPad3,4; iPhone OS 7_0_3; en_AU; en-GB) AppleWebKit/420+' => {
        bot_name: 'instagram',
        bot?: true,
        known?: true
      }
    }
    PINTEREST = {
      'Pinterest/1.0 +http://pinterest.com' => {
        bot_name: 'pinterest',
        bot?: true,
        known?: true
      }
    }
    TUMBLR = {
      'Tumblr/117 CFNetwork/609.1.4 Darwin/13.0.0' => {
        bot_name: 'tumblr',
        bot?: true,
        known?: true
      }
    }
    HOLMES = {
      'holmes/3.12.4 (http://morfeo.centrum.cz/bot)' => {
        bot_name: 'holmes',
        bot?: true,
        known?: true
      }
    }
    ASK = {
      'Mozilla/2.0 (compatible; Ask Jeeves/Teoma)' => {
        bot_name: 'ask',
        bot?: true,
        known?: true
      }
    }
    DUCKDUCKGO = {
      'DuckDuckBot/1.0; (+http://duckduckgo.com/duckduckbot.html)' => {
        bot_name: 'duckduckgo',
        bot?: true,
        known?: true
      }
    }
  end
end

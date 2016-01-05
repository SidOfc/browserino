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
    YANDEXBOT = {
      'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)' => {
        bot_name: 'yandexbot',
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
    EXABOT = {
      'Exabot/2.0' => {
        bot_name: 'exabot',
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
    BESLISTBOT = {
      'Mozilla/5.0 (compatible; BeslistBot; nl; BeslistBot 1.0; http://www.beslist.nl/' => {
        bot_name: 'beslistbot',
        bot?: true,
        known?: true
      }
    }
  end
end

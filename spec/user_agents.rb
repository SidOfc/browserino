module UserAgents
  USE_FOR_UNKNOWN = nil
  OPERA = {
    mac: {
      'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.73 Safari/537.36 OPR/34.0.2036.25' => {
        browser_name: 'Opera',
        browser_version: '34.0.2036.25',
        engine_name: 'Webkit',
        engine_version: '537.36',
        system_name: ['macintosh', 'El Capitan'],
        system_version: '10.11.2',
        system_architecture: USE_FOR_UNKNOWN,
        x64?: false,
        x32?: false,
        mobile?: false,
        known?: true
      },
      'Opera/9.80 (Macintosh; Intel Mac OS X 10.6.8; U; fr) Presto/2.9.168 Version/11.52' => {
        browser_name: 'Opera',
        browser_version: '11.52',
        engine_name: 'Presto',
        engine_version: '2.9.168',
        system_name: ['macintosh', 'snow leopard'],
        system_version: '10.6.8',
        system_architecture: USE_FOR_UNKNOWN,
        x64?: false,
        x32?: false,
        mobile?: false,
        known?: true
      },
      'Opera/9.80 (Macintosh; Intel Mac OS X; U; nl) Presto/2.6.30 Version/10.61' => {
        browser_name: 'Opera',
        browser_version: '10.61',
        engine_name: 'Presto',
        engine_version: '2.6.30',
        system_name: ['macintosh', USE_FOR_UNKNOWN],
        system_version: USE_FOR_UNKNOWN,
        system_architecture: USE_FOR_UNKNOWN,
        x64?: false,
        x32?: false,
        mobile?: false,
        known?: true
      }
    },
    win: {
      'Opera/9.80 (Windows NT 6.0) Presto/2.12.388 Version/12.14' => {
        browser_name: 'Opera',
        browser_version: '12.14',
        engine_name: 'Presto',
        engine_version: '2.12.388',
        system_name: ['windows', 'vista'],
        system_version: '6.0',
        system_architecture: USE_FOR_UNKNOWN,
        x64?: false,
        x32?: false,
        mobile?: false,
        known?: true
      },
      'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; de) Opera 11.51' => {
        browser_name: 'Opera',
        browser_version: '11.51',
        engine_name: USE_FOR_UNKNOWN,
        engine_version: USE_FOR_UNKNOWN,
        system_name: ['windows', '7'],
        system_version: '6.1',
        system_architecture: USE_FOR_UNKNOWN,
        x64?: false,
        x32?: false,
        mobile?: false,
        known?: true
      }
    },
    linux: {
      'Opera/9.80 (X11; Linux i686; Ubuntu/14.10) Presto/2.12.388 Version/12.16' => {
        browser_name: 'Opera',
        browser_version: '12.16',
        engine_name: 'Presto',
        engine_version: '2.12.388',
        system_name: ['linux', USE_FOR_UNKNOWN],
        system_version: USE_FOR_UNKNOWN,
        system_architecture: 'x32',
        x64?: false,
        x32?: true,
        mobile?: false,
        known?: true
      },
      'Opera/9.80 (X11; Linux x86_64; U; fr) Presto/2.9.168 Version/11.50' => {
        browser_name: 'Opera',
        browser_version: '11.50',
        engine_name: 'Presto',
        engine_version: '2.9.168',
        system_name: ['linux', USE_FOR_UNKNOWN],
        system_version: USE_FOR_UNKNOWN,
        system_architecture: 'x64',
        x64?: true,
        x32?: false,
        mobile?: false,
        known?: true
      }
    }
  }
  OPERA_MINI = {
    mac: {
      'Opera/9.80 (iPad; Opera Mini/7.1.32694/27.1407; U; en) Presto/2.8.119 Version/11.10' => {
        browser_name: 'Opera Mini',
        browser_version: '7.1.32694',
        engine_name: 'Presto',
        engine_version: '2.8.119',
        system_name: ['ios', USE_FOR_UNKNOWN],
        system_version: USE_FOR_UNKNOWN,
        system_architecture: USE_FOR_UNKNOWN,
        x64?: false,
        x32?: false,
        mobile?: true,
        known?: true
      },
      'Opera/9.80 (iPhone; Opera Mini/7.1.32694/27.1407; U; en) Presto/2.8.119 Version/11.10' => {
        browser_name: 'Opera Mini',
        browser_version: '7.1.32694',
        engine_name: 'Presto',
        engine_version: '2.8.119',
        system_name: ['ios', USE_FOR_UNKNOWN],
        system_version: USE_FOR_UNKNOWN,
        system_architecture: USE_FOR_UNKNOWN,
        x64?: false,
        x32?: false,
        mobile?: true,
        known?: true
      }
    },
    win: {
      'Opera/9.80 (Windows NT 5.1; U; Opera/9.80 (J2ME/MIDP; Opera Mini/5.0.18635/1030; U; en) Presto/2.4.15; ru) Presto/2.8.99 Version/11.10' => {
        browser_name: 'Opera Mini',
        browser_version: '5.0.18635',
        engine_name: 'Presto',
        engine_version: '2.4.15',
        system_name: ['windows', 'XP'],
        system_version: '5.1',
        system_architecture: USE_FOR_UNKNOWN,
        x64?: false,
        x32?: false,
        mobile?: true,
        known?: true
      }
    },
    android: {
      'Opera/9.80 (Android; Opera Mini/7.6.35766/35.5706; U; en) Presto/2.8.119 Version/11.10' => {
        browser_name: 'Opera Mini',
        browser_version: '7.6.35766',
        engine_name: 'Presto',
        engine_version: '2.8.119',
        system_name: ['Android', USE_FOR_UNKNOWN],
        system_version: USE_FOR_UNKNOWN,
        system_architecture: USE_FOR_UNKNOWN,
        x64?: false,
        x32?: false,
        mobile?: true,
        known?: true
      }
    },
    blackberry: {
      'Opera/9.80 (J2ME/MIDP; Opera Mini/9 (Compatible; MSIE:9.0; BlackBerry9700; AppleWebKit/24.746; U; en) Presto/2.5.25 Version/10.54' => {
        browser_name: 'Opera Mini',
        browser_version: '9',
        engine_name: 'Presto',
        engine_version: '2.5.25',
        system_name: ['blackberry', '9700'],
        system_version: '9700',
        system_architecture: USE_FOR_UNKNOWN,
        x64?: false,
        x32?: false,
        mobile?: true,
        known?: true
      }
    }
  }
  UCBROWSER = {
    android: {
      'Mozilla/5.0 (Linux; U; Android 4.1.2; en-us; SM-T210R Build/JZO54K) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Safari/534.30 UCBrowser/2.3.2.300' => {
        browser_name: 'ucbrowser',
        browser_version: '2.3.2.300',
        engine_name: 'Webkit',
        engine_version: '534.30',
        system_name: ['Android', 'Jelly Bean 16'],
        system_version: '4.1.2',
        system_architecture: USE_FOR_UNKNOWN,
        x64?: false,
        x32?: false,
        mobile?: true,
        known?: true
      }
    },
    win: {
      'NokiaX2-02/2.0 (11.79) Profile/MIDP-2.1 Configuration/CLDC-1.1 Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2;.NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; InfoPath.2) UCBrowser8.4.0.159/70/352' => {
        browser_name: 'ucbrowser',
        browser_version: '8.4.0.159',
        engine_name: 'trident',
        engine_version: '4.0',
        system_name: ['Windows', '7'],
        system_version: '6.1',
        system_architecture: USE_FOR_UNKNOWN,
        x64?: false,
        x32?: false,
        mobile?: true,
        known?: true
      }
    }
  }
  BOLT = {
    win: {
      'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; BOLT/2.340) AppleWebKit/530+ (KHTML, like Gecko) Version/4.0 Safari/530.17 UNTRUSTED/1.0 3gpp-gba' => {
        browser_name: 'Bolt',
        browser_version: '2.340',
        engine_name: 'Webkit',
        engine_version: '530',
        system_name: ['windows', 'XP'],
        system_version: '5.1',
        system_architecture: USE_FOR_UNKNOWN,
        x64?: false,
        x32?: false,
        mobile?: true,
        known?: true
      },
      'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; BOLT/2.800) AppleWebKit/534.6 (KHTML, like Gecko) Version/5.0 Safari/534.6.3' => {
        browser_name: 'Bolt',
        browser_version: '2.800',
        engine_name: 'Webkit',
        engine_version: '534.6',
        system_name: ['windows', 'XP'],
        system_version: '5.1',
        system_architecture: USE_FOR_UNKNOWN,
        x64?: false,
        x32?: false,
        mobile?: true,
        known?: true
      }
    }
  }
  IE = {
    mac: {
      'Mozilla/5.0 (compatible; MSIE 10.0; Macintosh; Intel Mac OS X 10_7_3; Trident/6.0)' => {
        browser_name: 'ie',
        browser_version: '10.0',
        engine_name: 'Trident',
        engine_version: '6.0',
        system_name: ['macintosh', 'lion'],
        system_version: '10.7.3',
        system_architecture: USE_FOR_UNKNOWN,
        x64?: false,
        x32?: false,
        mobile?: false,
        known?: true
      }
    },
    win: {
      'Mozilla/5.0 (compatible, MSIE 11, Windows NT 6.3; Trident/7.0; rv:11.0) like Gecko' => {
        browser_name: 'ie',
        browser_version: '11',
        engine_name: 'Trident',
        engine_version: '7.0',
        system_name: ['windows', '8.1'],
        system_version: '6.3',
        system_architecture: USE_FOR_UNKNOWN,
        x64?: false,
        x32?: false,
        mobile?: false,
        known?: true
      },
      'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; AS; rv:11.0) like Gecko' => {
        browser_name: 'ie',
        browser_version: '11.0',
        engine_name: 'Trident',
        engine_version: '7.0',
        system_name: ['windows', '7'],
        system_version: '6.1',
        system_architecture: 'x64',
        x64?: true,
        x32?: false,
        mobile?: false,
        known?: true
      },
      'Mozilla/5.0 (compatible; MSIE 10.6; Windows NT 6.1; Trident/5.0; InfoPath.2; SLCC1; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; .NET CLR 2.0.50727) 3gpp-gba UNTRUSTED/1.0' => {
        browser_name: 'ie',
        browser_version: '10.6',
        engine_name: 'Trident',
        engine_version: '5.0',
        system_name: ['windows', '7'],
        system_version: '6.1',
        system_architecture: USE_FOR_UNKNOWN,
        x64?: false,
        x32?: false,
        mobile?: false,
        known?: true
      }
    }
  }
  EDGE = {
    win: {
      'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36 Edge/12.246' => {
        browser_name: 'Edge',
        browser_version: '12.246',
        engine_name: 'Webkit',
        engine_version: '537.36',
        system_name: ['windows', '10'],
        system_version: '10.0',
        system_architecture: 'x64',
        x64?: true,
        x32?: false,
        mobile?: false,
        known?: true
      }
    }
  }
  MAXTHON = {
    mac: [],
    win: {
      'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/532.4 (KHTML, like Gecko) Maxthon/3.0.6.27 Safari/532.4' => {
        browser_name: 'Maxthon',
        browser_version: '3.0.6.27',
        engine_name: 'webkit',
        engine_version: '532.4',
        system_name: ['windows', '7'],
        system_version: '6.1',
        system_architecture: USE_FOR_UNKNOWN,
        x64?: false,
        x32?: false,
        mobile?: false,
        known?: true
      },
      'Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US) AppleWebKit/533.1 (KHTML, like Gecko) Maxthon/3.0.8.2 Safari/533.1' => {
        browser_name: 'Maxthon',
        browser_version: '3.0.8.2',
        engine_name: 'webkit',
        engine_version: '533.1',
        system_name: ['windows', 'vista'],
        system_version: '6.0',
        system_architecture: USE_FOR_UNKNOWN,
        x64?: false,
        x32?: false,
        mobile?: false,
        known?: true
      },
      'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/4.0; WOW64; Trident/5.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; Zune 4.0; InfoPath.3; MS-RTC LM 8; .NET4.0C; .NET4.0E; Maxthon 2.0)' => {
        browser_name: 'Maxthon',
        browser_version: '2.0',
        engine_name: 'Trident',
        engine_version: '4.0',
        system_name: ['windows', '7'],
        system_version: '6.1',
        system_architecture: 'x64',
        x64?: true,
        x32?: false,
        mobile?: false,
        known?: true
      }
    }
  }
  FIREFOX = {
    mac: {
      'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:43.0) Gecko/20100101 Firefox/43.0' => {
        browser_name: 'Firefox',
        browser_version: '43.0',
        engine_name: 'Gecko',
        engine_version: '43.0',
        system_name: ['macintosh', 'El Capitan'],
        system_version: '10.11',
        system_architecture: USE_FOR_UNKNOWN,
        x64?: false,
        x32?: false,
        mobile?: false,
        known?: true
      },
      'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10; rv:33.0) Gecko/20100101 Firefox/33.0' => {
        browser_name: 'Firefox',
        browser_version: '33.0',
        engine_name: 'Gecko',
        engine_version: '33.0',
        system_name: ['macintosh', 'yosemite'],
        system_version: '10.10',
        system_architecture: USE_FOR_UNKNOWN,
        x64?: false,
        x32?: false,
        mobile?: false,
        known?: true
      },
      'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6; rv:25.0) Gecko/20100101 Firefox/25.0' => {
        browser_name: 'Firefox',
        browser_version: '25.0',
        engine_name: 'Gecko',
        engine_version: '25.0',
        system_name: ['macintosh', 'snow leopard'],
        system_version: '10.6',
        system_architecture: USE_FOR_UNKNOWN,
        x64?: false,
        x32?: false,
        mobile?: false,
        known?: true
      }
    },
    win: {
      'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:40.0) Gecko/20100101 Firefox/40.1' => {
        browser_name: 'Firefox',
        browser_version: '40.1',
        engine_name: 'Gecko',
        engine_version: '40.0',
        system_name: ['windows', '7'],
        system_version: '6.1',
        system_architecture: 'x64',
        x64?: true,
        x32?: false,
        mobile?: false,
        known?: true
      },
      'Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.0' => {
        browser_name: 'Firefox',
        browser_version: '36.0',
        engine_name: 'Gecko',
        engine_version: '36.0',
        system_name: ['windows', '8.1'],
        system_version: '6.3',
        system_architecture: USE_FOR_UNKNOWN,
        x64?: false,
        x32?: false,
        mobile?: false,
        known?: true
      },
      'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20130401 Firefox/31.0' => {
        browser_name: 'Firefox',
        browser_version: '31.0',
        engine_name: 'Gecko',
        engine_version: '31.0',
        system_name: ['windows', '7'],
        system_version: '6.1',
        system_architecture: 'x64',
        x64?: true,
        x32?: false,
        mobile?: false,
        known?: true
      }
    },
    linux: {
      'Mozilla/5.0 (X11; Linux x86_64; rv:28.0) Gecko/20100101 Firefox/28.0' => {
        browser_name: 'Firefox',
        browser_version: '28.0',
        engine_name: 'Gecko',
        engine_version: '28.0',
        system_name: ['linux', USE_FOR_UNKNOWN],
        system_version: USE_FOR_UNKNOWN,
        system_architecture: 'x64',
        x64?: true,
        x32?: false,
        mobile?: false,
        known?: true
      },
      'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:24.0) Gecko/20100101 Firefox/24.0' => {
        browser_name: 'Firefox',
        browser_version: '24.0',
        engine_name: 'Gecko',
        engine_version: '24.0',
        system_name: ['linux', USE_FOR_UNKNOWN],
        system_version: USE_FOR_UNKNOWN,
        system_architecture: 'x64',
        x64?: true,
        x32?: false,
        mobile?: false,
        known?: true
      },
      'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:21.0) Gecko/20130331 Firefox/21.0' => {
        browser_name: 'Firefox',
        browser_version: '21.0',
        engine_name: 'Gecko',
        engine_version: '21.0',
        system_name: ['linux', USE_FOR_UNKNOWN],
        system_version: USE_FOR_UNKNOWN,
        system_architecture: 'x64',
        x64?: true,
        x32?: false,
        mobile?: false,
        known?: true
      },
      'Mozilla/5.0 (X11; OpenBSD amd64; rv:28.0) Gecko/20100101 Firefox/28.0' => {
        browser_name: 'Firefox',
        browser_version: '28.0',
        engine_name: 'Gecko',
        engine_version: '28.0',
        system_name: ['linux', USE_FOR_UNKNOWN],
        system_version: USE_FOR_UNKNOWN,
        system_architecture: 'x64',
        x64?: true,
        x32?: false,
        mobile?: false,
        known?: true
      }
    }
  }
  CHROME = {
    mac: {
      'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36' => {
        browser_name: 'Chrome',
        browser_version: '47.0.2526.106',
        engine_name: 'webkit',
        engine_version: '537.36',
        system_name: ['macintosh', 'El Capitan'],
        system_version: '10.11.2',
        system_architecture: USE_FOR_UNKNOWN,
        x64?: false,
        x32?: false,
        mobile?: false,
        known?: true
      },
      'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36' => {
        browser_name: 'Chrome',
        browser_version: '37.0.2062.124',
        engine_name: 'webkit',
        engine_version: '537.36',
        system_name: ['macintosh', 'yosemite'],
        system_version: '10.10.1',
        system_architecture: USE_FOR_UNKNOWN,
        x64?: false,
        x32?: false,
        mobile?: false,
        known?: true
      },
      'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1944.0 Safari/537.36' => {
        browser_name: 'Chrome',
        browser_version: '36.0.1944.0',
        engine_name: 'webkit',
        engine_version: '537.36',
        system_name: ['macintosh', 'mavericks'],
        system_version: '10.9.2',
        system_architecture: USE_FOR_UNKNOWN,
        x64?: false,
        x32?: false,
        mobile?: false,
        known?: true
      },
      'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.93 Safari/537.36' => {
        browser_name: 'Chrome',
        browser_version: '27.0.1453.93',
        engine_name: 'webkit',
        engine_version: '537.36',
        system_name: ['macintosh', 'Mountain Lion'],
        system_version: '10.8.3',
        system_architecture: USE_FOR_UNKNOWN,
        x64?: false,
        x32?: false,
        mobile?: false,
        known?: true
      }
    },
    win: {
      'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36' => {
        browser_name: 'Chrome',
        browser_version: '41.0.2228.0',
        engine_name: 'webkit',
        engine_version: '537.36',
        system_name: ['windows', '7'],
        system_version: '6.1',
        system_architecture: USE_FOR_UNKNOWN,
        x64?: false,
        x32?: false,
        mobile?: false,
        known?: true
      },
      'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1623.0 Safari/537.36' => {
        browser_name: 'Chrome',
        browser_version: '31.0.1623.0',
        engine_name: 'webkit',
        engine_version: '537.36',
        system_name: ['windows', '7'],
        system_version: '6.1',
        system_architecture: 'x64',
        x64?: true,
        x32?: false,
        mobile?: false,
        known?: true
      },
      'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1464.0 Safari/537.36' => {
        browser_name: 'Chrome',
        browser_version: '28.0.1464.0',
        engine_name: 'webkit',
        engine_version: '537.36',
        system_name: ['windows', '8'],
        system_version: '6.2',
        system_architecture: USE_FOR_UNKNOWN,
        x64?: false,
        x32?: false,
        mobile?: false,
        known?: true
      }
    },
    linux: {
      'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.517 Safari/537.36' => {
        browser_name: 'Chrome',
        browser_version: '33.0.1750.517',
        engine_name: 'webkit',
        engine_version: '537.36',
        system_name: ['linux', USE_FOR_UNKNOWN],
        system_version: USE_FOR_UNKNOWN,
        system_architecture: 'x64',
        x64?: true,
        x32?: false,
        mobile?: false,
        known?: true
      },
      'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.137 Safari/4E423F' => {
        browser_name: 'Chrome',
        browser_version: '34.0.1847.137',
        engine_name: 'webkit',
        engine_version: '537.36',
        system_name: ['linux', USE_FOR_UNKNOWN],
        system_version: USE_FOR_UNKNOWN,
        system_architecture: 'x64',
        x64?: true,
        x32?: false,
        mobile?: false,
        known?: true
      },
      'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2227.0 Safari/537.36' => {
        browser_name: 'Chrome',
        browser_version: '41.0.2227.0',
        engine_name: 'webkit',
        engine_version: '537.36',
        system_name: ['linux', USE_FOR_UNKNOWN],
        system_version: USE_FOR_UNKNOWN,
        system_architecture: 'x64',
        x64?: true,
        x32?: false,
        mobile?: false,
        known?: true
      },
      'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/536.5 (KHTML, like Gecko) Chrome/19.0.1084.9 Safari/536.5' => {
        browser_name: 'Chrome',
        browser_version: '19.0.1084.9',
        engine_name: 'webkit',
        engine_version: '536.5',
        system_name: ['linux', USE_FOR_UNKNOWN],
        system_version: USE_FOR_UNKNOWN,
        system_architecture: 'x64',
        x64?: true,
        x32?: false,
        mobile?: false,
        known?: true
      }
    }
  }
  SAFARI = {
    mac: {
      'User-Agent	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_2) AppleWebKit/601.3.9 (KHTML, like Gecko) Version/9.0.2 Safari/601.3.9' => {
        browser_name: 'Safari',
        browser_version: '9.0.2',
        engine_name: 'webkit',
        engine_version: '601.3.9',
        system_name: ['macintosh', 'El Capitan'],
        system_version: '10.11.2',
        system_architecture: USE_FOR_UNKNOWN,
        x64?: false,
        x32?: false,
        mobile?: false,
        known?: true
      },
      'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_3) AppleWebKit/537.75.14 (KHTML, like Gecko) Version/7.0.3 Safari/7046A194A' => {
        browser_name: 'Safari',
        browser_version: '7.0.3',
        engine_name: 'webkit',
        engine_version: '537.75.14',
        system_name: ['macintosh', 'mavericks'],
        system_version: '10.9.3',
        system_architecture: USE_FOR_UNKNOWN,
        x64?: false,
        x32?: false,
        mobile?: false,
        known?: true
      },
      'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/537.13+ (KHTML, like Gecko) Version/5.1.7 Safari/534.57.2' => {
        browser_name: 'Safari',
        browser_version: '5.1.7',
        engine_name: 'webkit',
        engine_version: '537.13',
        system_name: ['macintosh', 'snow leopard'],
        system_version: '10.6.8',
        system_architecture: USE_FOR_UNKNOWN,
        x64?: false,
        x32?: false,
        mobile?: false,
        known?: true
      }
    },
    win: {
      'Mozilla/5.0 (Windows; U; Windows NT 6.1; tr-TR) AppleWebKit/533.20.25 (KHTML, like Gecko) Version/5.0.4 Safari/533.20.27' => {
        browser_name: 'Safari',
        browser_version: '5.0.4',
        engine_name: 'webkit',
        engine_version: '533.20.25',
        system_name: ['windows', '7'],
        system_version: '6.1',
        system_architecture: USE_FOR_UNKNOWN,
        x64?: false,
        x32?: false,
        mobile?: false,
        known?: true
      },
      'Mozilla/5.0 (Windows; U; Windows NT 6.1; de-DE) AppleWebKit/533.20.25 (KHTML, like Gecko) Version/5.0.3 Safari/533.19.4' => {
        browser_name: 'Safari',
        browser_version: '5.0.3',
        engine_name: 'webkit',
        engine_version: '533.20.25',
        system_name: ['windows', '7'],
        system_version: '6.1',
        system_architecture: USE_FOR_UNKNOWN,
        x64?: false,
        x32?: false,
        mobile?: false,
        known?: true
      },
      'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/533.18.1 (KHTML, like Gecko) Version/5.0 Safari/533.16' => {
        browser_name: 'Safari',
        browser_version: '5.0',
        engine_name: 'webkit',
        engine_version: '533.18.1',
        system_name: ['windows', '7'],
        system_version: '6.1',
        system_architecture: USE_FOR_UNKNOWN,
        x64?: false,
        x32?: false,
        mobile?: false,
        known?: true
      }
    },
    blackberry: {
      'Mozilla/5.0 (BlackBerry; U; BlackBerry 9800; en-US) AppleWebKit/534.8+ (KHTML, like Gecko) Version/6.0.0.450 Mobile Safari/534.8+' => {
        browser_name: 'Safari',
        browser_version: '6.0.0.450',
        engine_name: 'webkit',
        engine_version: '534.8',
        system_name: ['blackberry', '9800'],
        system_version: '9800',
        system_architecture: USE_FOR_UNKNOWN,
        x64?: false,
        x32?: false,
        mobile?: true,
        known?: true
      },
      'Mozilla/5.0 (BlackBerry; U; BlackBerry 9900; en) AppleWebKit/534.11+ (KHTML, like Gecko) Version/7.1.0.346 Mobile Safari/534.11+' => {
        browser_name: 'Safari',
        browser_version: '7.1.0.346',
        engine_name: 'webkit',
        engine_version: '534.11',
        system_name: ['blackberry', '9900'],
        system_version: '9900',
        system_architecture: USE_FOR_UNKNOWN,
        x64?: false,
        x32?: false,
        mobile?: true,
        known?: true
      },
      'Mozilla/5.0 (BlackBerry; U; BlackBerry 9860; en-US) AppleWebKit/534.11+ (KHTML, like Gecko) Version/7.0.0.254 Mobile Safari/534.11+' => {
        browser_name: 'Safari',
        browser_version: '7.0.0.254',
        engine_name: 'webkit',
        engine_version: '534.11',
        system_name: ['blackberry', '9860'],
        system_version: '9860',
        system_architecture: USE_FOR_UNKNOWN,
        x64?: false,
        x32?: false,
        mobile?: true,
        known?: true
      },
      'Mozilla/5.0 (BlackBerry; U; BlackBerry 9800; it) AppleWebKit/534.8+ (KHTML, like Gecko) Version/6.0.0.668 Mobile Safari/534.8+' => {
        browser_name: 'Safari',
        browser_version: '6.0.0.668',
        engine_name: 'webkit',
        engine_version: '534.8',
        system_name: ['blackberry', '9800'],
        system_version: '9800',
        system_architecture: USE_FOR_UNKNOWN,
        x64?: false,
        x32?: false,
        mobile?: true,
        known?: true
      },
      'Mozilla/5.0 (BlackBerry; U; BlackBerry 9700; pt) AppleWebKit/534.8+ (KHTML, like Gecko) Version/6.0.0.546 Mobile Safari/534.8+' => {
        browser_name: 'Safari',
        browser_version: '6.0.0.546',
        engine_name: 'webkit',
        engine_version: '534.8',
        system_name: ['blackberry', '9700'],
        system_version: '9700',
        system_architecture: USE_FOR_UNKNOWN,
        x64?: false,
        x32?: false,
        mobile?: true,
        known?: true
      }
    }
  }
end

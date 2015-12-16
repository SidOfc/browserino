module UserAgents
  #without this opera doesn't get tested (first constant seems to come out as an array)
  Z = {},
  OPERA = {
    mac: {
      'Opera/9.80 (Macintosh; Intel Mac OS X 10.6.8; U; fr) Presto/2.9.168 Version/11.52' => {
        browser_name: 'Opera',
        browser_version: '11.52',
        engine_name: 'Presto',
        engine_version: '2.9.168',
        system_name: ['macintosh', 'snow leopard'],
        system_version: '10.6.8',
        system_architecture: USE_FOR_UNKNOWN
      },
      'Opera/9.80 (Macintosh; Intel Mac OS X; U; nl) Presto/2.6.30 Version/10.61' => {
        browser_name: 'Opera',
        browser_version: '10.61',
        engine_name: 'Presto',
        engine_version: '2.6.30',
        system_name: ['macintosh', USE_FOR_UNKNOWN],
        system_version: USE_FOR_UNKNOWN,
        system_architecture: USE_FOR_UNKNOWN
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
        system_architecture: USE_FOR_UNKNOWN
      },
      'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; de) Opera 11.51' => {
        browser_name: 'Opera',
        browser_version: '11.51',
        engine_name: USE_FOR_UNKNOWN,
        engine_version: USE_FOR_UNKNOWN,
        system_name: ['windows', '7'],
        system_version: '6.1',
        system_architecture: USE_FOR_UNKNOWN
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
        system_architecture: 'x32'
      },
      'Opera/9.80 (X11; Linux x86_64; U; fr) Presto/2.9.168 Version/11.50' => {
        browser_name: 'Opera',
        browser_version: '11.50',
        engine_name: 'Presto',
        engine_version: '2.9.168',
        system_name: ['linux', USE_FOR_UNKNOWN],
        system_version: USE_FOR_UNKNOWN,
        system_architecture: 'x64'
      }
    }
  },
  IE = {
    mac: {
      'Mozilla/5.0 (compatible; MSIE 10.0; Macintosh; Intel Mac OS X 10_7_3; Trident/6.0)' => {
        browser_name: 'ie',
        browser_version: '10.0',
        engine_name: 'Trident',
        engine_version: '6.0',
        system_name: ['macintosh', 'lion'],
        system_version: '10.7.3',
        system_architecture: USE_FOR_UNKNOWN
      }
    },
    win: {
      'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; AS; rv:11.0) like Gecko' => {
        browser_name: 'ie',
        browser_version: '11.0',
        engine_name: 'Trident',
        engine_version: '7.0',
        system_name: ['windows', '7'],
        system_version: '6.1',
        system_architecture: 'x64'
      },
      'Mozilla/5.0 (compatible; MSIE 10.6; Windows NT 6.1; Trident/5.0; InfoPath.2; SLCC1; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; .NET CLR 2.0.50727) 3gpp-gba UNTRUSTED/1.0' => {
        browser_name: 'ie',
        browser_version: '10.6',
        engine_name: 'Trident',
        engine_version: '5.0',
        system_name: ['windows', '7'],
        system_version: '6.1',
        system_architecture: USE_FOR_UNKNOWN
      }
    },
    linux: {}
  },
  MAXTHON = {
    mac: [],
    win: {
      'Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US) AppleWebKit/533.1 (KHTML, like Gecko) Maxthon/3.0.8.2 Safari/533.1' => {
        browser_name: 'Maxthon',
        browser_version: '3.0.8.2',
        engine_name: 'webkit',
        engine_version: '533.1',
        system_name: ['windows', 'vista'],
        system_version: '6.0',
        system_architecture: USE_FOR_UNKNOWN
      },
      'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/4.0; WOW64; Trident/5.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; Zune 4.0; InfoPath.3; MS-RTC LM 8; .NET4.0C; .NET4.0E; Maxthon 2.0)' => {
        browser_name: 'Maxthon',
        browser_version: '2.0',
        engine_name: 'Trident',
        engine_version: '4.0',
        system_name: ['windows', '7'],
        system_version: '6.1',
        system_architecture: 'x64'
      }
    },
    linux: {}
  },
  FIREFOX = {
    mac: {
      'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10; rv:33.0) Gecko/20100101 Firefox/33.0' => {
        browser_name: 'Firefox',
        browser_version: '33.0',
        engine_name: 'Gecko',
        engine_version: '33.0',
        system_name: ['macintosh', 'yosemite'],
        system_version: '10.10',
        system_architecture: USE_FOR_UNKNOWN
      },
      'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6; rv:25.0) Gecko/20100101 Firefox/25.0' => {
        browser_name: 'Firefox',
        browser_version: '25.0',
        engine_name: 'Gecko',
        engine_version: '25.0',
        system_name: ['macintosh', 'snow leopard'],
        system_version: '10.6',
        system_architecture: USE_FOR_UNKNOWN
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
        system_architecture: 'x64'
      },
      'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20130401 Firefox/31.0' => {
        browser_name: 'Firefox',
        browser_version: '31.0',
        engine_name: 'Gecko',
        engine_version: '31.0',
        system_name: ['windows', '7'],
        system_version: '6.1',
        system_architecture: 'x64'
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
        system_architecture: 'x64'
      },
      'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:24.0) Gecko/20100101 Firefox/24.0' => {
        browser_name: 'Firefox',
        browser_version: '24.0',
        engine_name: 'Gecko',
        engine_version: '24.0',
        system_name: ['linux', USE_FOR_UNKNOWN],
        system_version: USE_FOR_UNKNOWN,
        system_architecture: 'x64'
      }
    }
  },
  CHROME = {
    mac: {
      'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36' => {
        browser_name: 'Chrome',
        browser_version: '37.0.2062.124',
        engine_name: 'webkit',
        engine_version: '537.36',
        system_name: ['macintosh', 'yosemite'],
        system_version: '10.10.1',
        system_architecture: USE_FOR_UNKNOWN
      },
      'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1944.0 Safari/537.36' => {
        browser_name: 'Chrome',
        browser_version: '36.0.1944.0',
        engine_name: 'webkit',
        engine_version: '537.36',
        system_name: ['macintosh', 'mavericks'],
        system_version: '10.9.2',
        system_architecture: USE_FOR_UNKNOWN
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
        system_architecture: USE_FOR_UNKNOWN
      },
      'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1623.0 Safari/537.36' => {
        browser_name: 'Chrome',
        browser_version: '31.0.1623.0',
        engine_name: 'webkit',
        engine_version: '537.36',
        system_name: ['windows', '7'],
        system_version: '6.1',
        system_architecture: 'x64'
      }
    },
    linux: {
      'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.137 Safari/4E423F' => {
        browser_name: 'Chrome',
        browser_version: '34.0.1847.137',
        engine_name: 'webkit',
        engine_version: '537.36',
        system_name: ['linux', USE_FOR_UNKNOWN],
        system_version: USE_FOR_UNKNOWN,
        system_architecture: 'x64'
      },
      'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2227.0 Safari/537.36' => {
        browser_name: 'Chrome',
        browser_version: '41.0.2227.0',
        engine_name: 'webkit',
        engine_version: '537.36',
        system_name: ['linux', USE_FOR_UNKNOWN],
        system_version: USE_FOR_UNKNOWN,
        system_architecture: 'x64'
      }
    }
  },
  SAFARI = {
    mac: {
      'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_3) AppleWebKit/537.75.14 (KHTML, like Gecko) Version/7.0.3 Safari/7046A194A' => {
        browser_name: 'Safari',
        browser_version: '7.0.3',
        engine_name: 'webkit',
        engine_version: '537.75.14',
        system_name: ['macintosh', 'mavericks'],
        system_version: '10.9.3',
        system_architecture: USE_FOR_UNKNOWN
      },
      'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/537.13+ (KHTML, like Gecko) Version/5.1.7 Safari/534.57.2' => {
        browser_name: 'Safari',
        browser_version: '5.1.7',
        engine_name: 'webkit',
        engine_version: '537.13',
        system_name: ['macintosh', 'snow leopard'],
        system_version: '10.6.8',
        system_architecture: USE_FOR_UNKNOWN
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
        system_architecture: USE_FOR_UNKNOWN
      },
      'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/533.18.1 (KHTML, like Gecko) Version/5.0 Safari/533.16' => {
        browser_name: 'Safari',
        browser_version: '5.0',
        engine_name: 'webkit',
        engine_version: '533.18.1',
        system_name: ['windows', '7'],
        system_version: '6.1',
        system_architecture: USE_FOR_UNKNOWN
      }
    },
    linux: {}
  }
end

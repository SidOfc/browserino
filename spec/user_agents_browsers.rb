module UserAgents
  module Browsers
    COLIBRI = {
      mac: {
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_1) AppleWebKit/537.36 (KHTML, like Gecko) Colibri/1.0.0-beta.9 Chrome/52.0.2743.82 Electron/1.3.13 Safari/537.36' => {
          name: 'colibri',
          browser_version: '1.0.0',
          engine_name: 'webkit',
          engine_version: '537.36',
          system_name: ['macintosh', 'sierra'],
          system_version: '10.12.1',
          system_architecture: USE_FOR_UNKNOWN,
          locale: USE_FOR_UNKNOWN,
          x64?: false,
          x32?: false,
          mobile?: false,
          to_s: 'colibri colibri1 webkit webkit537 macintosh'
        }
      }
    }

    SAMSUNGBROWSER = {
      tizen: {
        'Mozilla/5.0 (SMART-TV; Linux; Tizen 2.3) AppleWebkit/538.1 (KHTML, like Gecko) SamsungBrowser/1.0 Safari/538.1' => {
          name: 'SamsungBrowser',
          browser_version: '1.0',
          engine_name: 'Webkit',
          engine_version: '538.1',
          system_name: ['tizen', '2.3'],
          system_version: '2.3',
          system_architecture: USE_FOR_UNKNOWN,
          locale: USE_FOR_UNKNOWN,
          x64?: false,
          x32?: false,
          mobile?: false,
          to_s: 'samsungbrowser samsungbrowser1 webkit webkit538 tizen'
        }
      }
    }
    WEBOSBROWSER = {
      webos: {
        'Mozilla/5.0 (webOS/1.3; U; en-US) AppleWebKit/525.27.1 (KHTML, like Gecko) Version/1.0 Safari/525.27.1 Desktop/1.0' => {
          name: 'WebOSbrowser',
          browser_version: USE_FOR_UNKNOWN,
          engine_name: 'Webkit',
          engine_version: '525.27.1',
          system_name: ['webos', '1.3'],
          system_version: '1.3',
          system_architecture: USE_FOR_UNKNOWN,
          locale: 'en-us',
          x64?: false,
          x32?: false,
          mobile?: false,
          to_s: 'webosbrowser webkit webkit525 webos'
        },
        'Mozilla/5.0 (hp-tablet; Linux; hpwOS/3.0.2; U; de-DE) AppleWebKit/534.6 (KHTML, like Gecko) wOSBrowser/234.40.1 Safari/534.6 TouchPad/1.0' => {
          name: 'WebOSbrowser',
          browser_version: '234.40.1',
          engine_name: 'Webkit',
          engine_version: '534.6',
          system_name: ['webos', '3.0'],
          system_version: '3.0.2',
          system_architecture: USE_FOR_UNKNOWN,
          locale: 'de-de',
          x64?: false,
          x32?: false,
          mobile?: true,
          to_s: 'webosbrowser webosbrowser234 webkit webkit534 webos'
        }
      }
    }
    VIVALDI = {
      mac: {
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.80 Safari/537.36 Vivaldi/1.0.344.37' => {
          name: 'Vivaldi',
          browser_version: '1.0.344.37',
          engine_name: 'Webkit',
          engine_version: '537.36',
          system_name: ['macintosh', 'El Capitan'],
          system_version: '10.11.2',
          system_architecture: USE_FOR_UNKNOWN,
          locale: USE_FOR_UNKNOWN,
          x64?: false,
          x32?: false,
          mobile?: false,
          to_s: 'vivaldi vivaldi1 webkit webkit537 macintosh'
        }
      },
      win: {
        'Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36 Vivaldi/1.0.288.3' => {
          name: 'Vivaldi',
          browser_version: '1.0.288.3',
          engine_name: 'Webkit',
          engine_version: '537.36',
          system_name: ['windows', '10'],
          system_version: '10.0',
          system_architecture: 'x64',
          locale: USE_FOR_UNKNOWN,
          x64?: true,
          x32?: false,
          mobile?: false,
          to_s: 'vivaldi vivaldi1 webkit webkit537 windows x64'
        },
        'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.89 Vivaldi/1.0.83.38 Safari/537.36' => {
          name: 'Vivaldi',
          browser_version: '1.0.83.38',
          engine_name: 'Webkit',
          engine_version: '537.36',
          system_name: ['windows', '7'],
          system_version: '6.1',
          system_architecture: 'x64',
          locale: USE_FOR_UNKNOWN,
          x64?: true,
          x32?: false,
          mobile?: false,
          to_s: 'vivaldi vivaldi1 webkit webkit537 windows x64'
        },
        'Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36 Vivaldi/1.0.129.2' => {
          name: 'Vivaldi',
          browser_version: '1.0.129.2',
          engine_name: 'Webkit',
          engine_version: '537.36',
          system_name: ['windows', '8.1'],
          system_version: '6.3',
          system_architecture: 'x64',
          locale: USE_FOR_UNKNOWN,
          x64?: true,
          x32?: false,
          mobile?: false,
          to_s: 'vivaldi vivaldi1 webkit webkit537 windows x64'
        }
      },
      linux: {
        'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.105 Safari/537.36 Vivaldi/1.0.162.2' => {
          name: 'Vivaldi',
          browser_version: '1.0.162.2',
          engine_name: 'Webkit',
          engine_version: '537.36',
          system_name: ['Linux', USE_FOR_UNKNOWN],
          system_version: USE_FOR_UNKNOWN,
          system_architecture: 'x64',
          locale: USE_FOR_UNKNOWN,
          x64?: true,
          x32?: false,
          mobile?: false,
          to_s: 'vivaldi vivaldi1 webkit webkit537 linux x64'
        }
      }
    }
    OPERA = {
      mac: {
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.73 Safari/537.36 OPR/34.0.2036.25' => {
          name: 'Opera',
          browser_version: '34.0.2036.25',
          engine_name: 'Webkit',
          engine_version: '537.36',
          system_name: ['macintosh', 'El Capitan'],
          system_version: '10.11.2',
          system_architecture: USE_FOR_UNKNOWN,
          locale: USE_FOR_UNKNOWN,
          x64?: false,
          x32?: false,
          mobile?: false,
          to_s: 'opera opera34 webkit webkit537 macintosh'
        },
        'Opera/9.80 (Macintosh; Intel Mac OS X 10.6.8; U; fr) Presto/2.9.168 Version/11.52' => {
          name: 'Opera',
          browser_version: '11.52',
          engine_name: 'Presto',
          engine_version: '2.9.168',
          system_name: ['macintosh', 'snow leopard'],
          system_version: '10.6.8',
          system_architecture: USE_FOR_UNKNOWN,
          locale: 'fr',
          x64?: false,
          x32?: false,
          mobile?: false,
          to_s: 'opera opera11 presto presto2 macintosh'
        },
        'Opera/9.80 (Macintosh; Intel Mac OS X; U; nl) Presto/2.6.30 Version/10.61' => {
          name: 'Opera',
          browser_version: '10.61',
          engine_name: 'Presto',
          engine_version: '2.6.30',
          system_name: ['macintosh', USE_FOR_UNKNOWN],
          system_version: USE_FOR_UNKNOWN,
          system_architecture: USE_FOR_UNKNOWN,
          locale: 'nl',
          x64?: false,
          x32?: false,
          mobile?: false,
          to_s: 'opera opera10 presto presto2 macintosh'
        }
      },
      win: {
        'Opera/9.80 (Windows NT 6.0) Presto/2.12.388 Version/12.14' => {
          name: 'Opera',
          browser_version: '12.14',
          engine_name: 'Presto',
          engine_version: '2.12.388',
          system_name: ['windows', 'vista'],
          system_version: '6.0',
          system_architecture: USE_FOR_UNKNOWN,
          locale: USE_FOR_UNKNOWN,
          x64?: false,
          x32?: false,
          mobile?: false,
          to_s: 'opera opera12 presto presto2 windows'
        },
        'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; de) Opera 11.51' => {
          name: 'Opera',
          browser_version: '11.51',
          engine_name: USE_FOR_UNKNOWN,
          engine_version: USE_FOR_UNKNOWN,
          system_name: ['windows', '7'],
          system_version: '6.1',
          system_architecture: USE_FOR_UNKNOWN,
          locale: 'de',
          x64?: false,
          x32?: false,
          mobile?: false,
          to_s: 'opera opera11 windows'
        }
      },
      linux: {
        'Opera/9.80 (X11; Linux i686; Ubuntu/14.10) Presto/2.12.388 Version/12.16' => {
          name: 'Opera',
          browser_version: '12.16',
          engine_name: 'Presto',
          engine_version: '2.12.388',
          system_name: ['linux', USE_FOR_UNKNOWN],
          system_version: USE_FOR_UNKNOWN,
          system_architecture: 'x32',
          locale: USE_FOR_UNKNOWN,
          x64?: false,
          x32?: true,
          mobile?: false,
          to_s: 'opera opera12 presto presto2 linux x32'
        },
        'Opera/9.80 (X11; Linux x86_64; U; fr) Presto/2.9.168 Version/11.50' => {
          name: 'Opera',
          browser_version: '11.50',
          engine_name: 'Presto',
          engine_version: '2.9.168',
          system_name: ['linux', USE_FOR_UNKNOWN],
          system_version: USE_FOR_UNKNOWN,
          system_architecture: 'x64',
          locale: 'fr',
          x64?: true,
          x32?: false,
          mobile?: false,
          to_s: 'opera opera11 presto presto2 linux x64'
        }
      },
      bsd: {
        'Opera/9.63 (X11; FreeBSD 7.1-RELEASE i386; U; en) Presto/2.1.1' => {
          name: 'Opera',
          browser_version: '9.63',
          engine_name: 'Presto',
          engine_version: '2.1.1',
          system_name: ['bsd', USE_FOR_UNKNOWN],
          system_version: USE_FOR_UNKNOWN,
          system_architecture: 'x32',
          locale: 'en',
          x64?: false,
          x32?: true,
          mobile?: false,
          to_s: 'opera opera9 presto presto2 bsd x32'
        },
        'Opera/9.22 (X11; OpenBSD i386; U; en)' => {
          name: 'Opera',
          browser_version: '9.22',
          engine_name: USE_FOR_UNKNOWN,
          engine_version: USE_FOR_UNKNOWN,
          system_name: ['bsd', USE_FOR_UNKNOWN],
          system_version: USE_FOR_UNKNOWN,
          system_architecture: 'x32',
          locale: 'en',
          x64?: false,
          x32?: true,
          mobile?: false,
          to_s: 'opera opera9 bsd x32'
        }
      }
    }
    OPERA_MINI = {
      tizen: {
        'Opera/9.80 (Tizen; Opera Mini/7.6.9/35.7827; U; en) Presto/2.8.119 Version/11.10' => {
          name: 'Opera Mini',
          browser_version: '7.6.9',
          engine_name: 'Presto',
          engine_version: '2.8.119',
          system_name: ['Tizen', USE_FOR_UNKNOWN],
          system_version: USE_FOR_UNKNOWN,
          system_architecture: USE_FOR_UNKNOWN,
          locale: 'en',
          x64?: false,
          x32?: false,
          mobile?: true,
          to_s: 'opera-mini opera-mini7 presto presto2 tizen'
        }
      },
      ios: {
        'Opera/9.80 (iPad; Opera Mini/7.1.32694/27.1407; U; en) Presto/2.8.119 Version/11.10' => {
          name: 'Opera Mini',
          browser_version: '7.1.32694',
          engine_name: 'Presto',
          engine_version: '2.8.119',
          system_name: ['ios', USE_FOR_UNKNOWN],
          system_version: USE_FOR_UNKNOWN,
          system_architecture: USE_FOR_UNKNOWN,
          locale: 'en',
          x64?: false,
          x32?: false,
          mobile?: true,
          to_s: 'opera-mini opera-mini7 presto presto2 ios'
        },
        'Opera/9.80 (iPhone; Opera Mini/7.1.32694/27.1407; U; en) Presto/2.8.119 Version/11.10' => {
          name: 'Opera Mini',
          browser_version: '7.1.32694',
          engine_name: 'Presto',
          engine_version: '2.8.119',
          system_name: ['ios', USE_FOR_UNKNOWN],
          system_version: USE_FOR_UNKNOWN,
          system_architecture: USE_FOR_UNKNOWN,
          locale: 'en',
          x64?: false,
          x32?: false,
          mobile?: true,
          to_s: 'opera-mini opera-mini7 presto presto2 ios'
        }
      },
      win: {
        'Opera/9.80 (Windows NT 5.1; U; Opera/9.80 (J2ME/MIDP; Opera Mini/5.0.18635/1030; U; en) Presto/2.4.15; ru) Presto/2.8.99 Version/11.10' => {
          name: 'Opera Mini',
          browser_version: '5.0.18635',
          engine_name: 'Presto',
          engine_version: '2.4.15',
          system_name: ['windows', 'XP'],
          system_version: '5.1',
          system_architecture: USE_FOR_UNKNOWN,
          locale: 'en',
          x64?: false,
          x32?: false,
          mobile?: true,
          to_s: 'opera-mini opera-mini5 presto presto2 windows'
        }
      },
      android: {
        'Opera/9.80 (Android; Opera Mini/7.6.35766/35.5706; U; en) Presto/2.8.119 Version/11.10' => {
          name: 'Opera Mini',
          browser_version: '7.6.35766',
          engine_name: 'Presto',
          engine_version: '2.8.119',
          system_name: ['Android', USE_FOR_UNKNOWN],
          system_version: USE_FOR_UNKNOWN,
          system_architecture: USE_FOR_UNKNOWN,
          locale: 'en',
          x64?: false,
          x32?: false,
          mobile?: true,
          to_s: 'opera-mini opera-mini7 presto presto2 android'
        }
      },
      blackberry: {
        'Opera/9.80 (J2ME/MIDP; Opera Mini/9 (Compatible; MSIE:9.0; BlackBerry9700; AppleWebKit/24.746; U; en) Presto/2.5.25 Version/10.54' => {
          name: 'Opera Mini',
          browser_version: '9',
          engine_name: 'Presto',
          engine_version: '2.5.25',
          system_name: ['blackberry', '10.54'],
          system_version: '10.54',
          system_architecture: USE_FOR_UNKNOWN,
          locale: 'en',
          x64?: false,
          x32?: false,
          mobile?: true,
          to_s: 'opera-mini opera-mini9 presto presto2 blackberry'
        }
      }
    }
    UCBROWSER = {
      tizen: {
        'Mozilla/5.0 (Linux; U; Android 4.4.4; en-US; Tizen Phone with ACL Build/KTU84Q) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 UCBrowser/10.8.8.730 U3/0.8.0 Mobile Safari/534.30' => {
          name: 'ucbrowser',
          browser_version: '10.8.8.730',
          engine_name: 'webkit',
          engine_version: '534.30',
          system_name: ['Tizen', USE_FOR_UNKNOWN],
          system_version: USE_FOR_UNKNOWN,
          locale: 'en-us',
          x64?: false,
          x32?: false,
          mobile?: true,
          to_s: 'ucbrowser ucbrowser10 webkit webkit534 tizen'
        }
      },
      android: {
        'Mozilla/5.0 (Linux; U; Android 4.1.2; en-us; SM-T210R Build/JZO54K) AppleWebKit/534.30 (KHTML, like Gecko) Version/4.0 Safari/534.30 UCBrowser/2.3.2.300' => {
          name: 'ucbrowser',
          browser_version: '2.3.2.300',
          engine_name: 'Webkit',
          engine_version: '534.30',
          system_name: ['Android', 'Jelly Bean 16'],
          system_version: '4.1.2',
          system_architecture: USE_FOR_UNKNOWN,
          locale: 'en-us',
          x64?: false,
          x32?: false,
          mobile?: true,
          to_s: 'ucbrowser ucbrowser2 webkit webkit534 android'
        }
      },
      win: {
        'NokiaX2-02/2.0 (11.79) Profile/MIDP-2.1 Configuration/CLDC-1.1 Mozilla/4.0 (compatible; MSIE 8.0; Windows NT 6.1; Trident/4.0; SLCC2;.NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; InfoPath.2) UCBrowser8.4.0.159/70/352' => {
          name: 'ucbrowser',
          browser_version: '8.4.0.159',
          engine_name: 'trident',
          engine_version: '4.0',
          system_name: ['Windows', '7'],
          system_version: '6.1',
          system_architecture: USE_FOR_UNKNOWN,
          locale: USE_FOR_UNKNOWN,
          x64?: false,
          x32?: false,
          mobile?: true,
          to_s: 'ucbrowser ucbrowser8 trident trident4 windows'
        }
      }
    }
    BOLT = {
      win: {
        'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; BOLT/2.340) AppleWebKit/530+ (KHTML, like Gecko) Version/4.0 Safari/530.17 UNTRUSTED/1.0 3gpp-gba' => {
          name: 'Bolt',
          browser_version: '2.340',
          engine_name: 'Webkit',
          engine_version: '530',
          system_name: ['windows', 'XP'],
          system_version: '5.1',
          system_architecture: USE_FOR_UNKNOWN,
          locale: 'en-us',
          x64?: false,
          x32?: false,
          mobile?: true,
          to_s: 'bolt bolt2 webkit webkit530 windows'
        },
        'Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; BOLT/2.800) AppleWebKit/534.6 (KHTML, like Gecko) Version/5.0 Safari/534.6.3' => {
          name: 'Bolt',
          browser_version: '2.800',
          engine_name: 'Webkit',
          engine_version: '534.6',
          system_name: ['windows', 'XP'],
          system_version: '5.1',
          system_architecture: USE_FOR_UNKNOWN,
          locale: 'en-us',
          x64?: false,
          x32?: false,
          mobile?: true,
          to_s: 'bolt bolt2 webkit webkit534 windows'
        }
      }
    }
    IE = {
      mac: {
        'Mozilla/5.0 (compatible; MSIE 10.0; Macintosh; Intel Mac OS X 10_7_3; Trident/6.0)' => {
          name: 'ie',
          browser_version: '10.0',
          engine_name: 'Trident',
          engine_version: '6.0',
          system_name: ['macintosh', 'lion'],
          system_version: '10.7.3',
          system_architecture: USE_FOR_UNKNOWN,
          locale: USE_FOR_UNKNOWN,
          x64?: false,
          x32?: false,
          mobile?: false,
          compat?: false,
          to_s: 'ie ie10 trident trident6 macintosh'
        }
      },
      win: {
        'Mozilla/5.0 (compatible, MSIE 11, Windows NT 6.3; Trident/7.0; rv:11.0) like Gecko' => {
          name: 'ie',
          browser_version: '11.0',
          engine_name: 'Trident',
          engine_version: '7.0',
          system_name: ['windows', '8.1'],
          system_version: '6.3',
          system_architecture: USE_FOR_UNKNOWN,
          locale: USE_FOR_UNKNOWN,
          x64?: false,
          x32?: false,
          mobile?: false,
          compat?: false,
          to_s: 'ie ie11 trident trident7 windows'
        },
        'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; AS; rv:11.0) like Gecko' => {
          name: 'ie',
          browser_version: '11.0',
          engine_name: 'Trident',
          engine_version: '7.0',
          system_name: ['windows', '7'],
          system_version: '6.1',
          system_architecture: 'x64',
          locale: 'as',
          x64?: true,
          x32?: false,
          mobile?: false,
          compat?: false,
          to_s: 'ie ie11 trident trident7 windows x64'
        },
        'Mozilla/5.0 (compatible; MSIE 10.6; Windows NT 6.1; Trident/5.0; InfoPath.2; SLCC1; .NET CLR 3.0.4506.2152; .NET CLR 3.5.30729; .NET CLR 2.0.50727) 3gpp-gba UNTRUSTED/1.0' => {
          name: 'ie',
          browser_version: {real: '9.0', compat: '10.6'},
          engine_name: 'Trident',
          engine_version: '5.0',
          system_name: ['windows', '7'],
          system_version: '6.1',
          system_architecture: USE_FOR_UNKNOWN,
          locale: USE_FOR_UNKNOWN,
          x64?: false,
          x32?: false,
          mobile?: false,
          compat?: true,
          to_s: 'ie ie9 trident trident5 windows'
        }
      },
      windows_phone: {
        'Mozilla/5.0 (compatible; MSIE 9.0; Windows Phone OS 7.5; Trident/5.0; IEMobile/9.0)' => {
          name: 'ie',
          browser_version: '9.0',
          engine_name: 'Trident',
          engine_version: '5.0',
          system_name: ['windows_phone', '7.5'],
          system_version: '7.5',
          system_architecture: USE_FOR_UNKNOWN,
          locale: USE_FOR_UNKNOWN,
          x64?: false,
          x32?: false,
          mobile?: true,
          compat?: false,
          to_s: 'ie ie9 trident trident5 windows-phone'
        },
        'Mozilla/5.0 (compatible; MSIE 10.0; Windows Phone 8.0; Trident/6.0; IEMobile/10.0; ARM; Touch; NOKIA; Lumia 920)' => {
          name: 'ie',
          browser_version: '10.0',
          engine_name: 'Trident',
          engine_version: '6.0',
          system_name: ['windows_phone', '8.0'],
          system_version: '8.0',
          system_architecture: USE_FOR_UNKNOWN,
          locale: USE_FOR_UNKNOWN,
          x64?: false,
          x32?: false,
          mobile?: true,
          compat?: false,
          to_s: 'ie ie10 trident trident6 windows-phone'
        },
        'Mozilla/4.0 (compatible; MSIE 7.0; Windows Phone OS 7.0; Trident/3.1; IEMobile/7.0; LG; GW910)' => {
          name: 'ie',
          browser_version: {real: '7.1', compat: '7.0'},
          engine_name: 'Trident',
          engine_version: '3.1',
          system_name: ['windows_phone', '7.0'],
          system_version: '7.0',
          system_architecture: USE_FOR_UNKNOWN,
          locale: 'lg',
          x64?: false,
          x32?: false,
          mobile?: true,
          compat?: true,
          to_s: 'ie ie7 trident trident3 windows-phone'
        },
        'Mozilla/4.0 (Compatible; MSIE 6.0; Windows NT 5.1 T-01A_6.5; Windows Phone 6.5)' => {
          name: 'ie',
          browser_version: '6.0',
          engine_name: 'trident',
          engine_version: USE_FOR_UNKNOWN,
          system_name: ['windows_phone', '6.5'],
          system_version: '6.5',
          system_architecture: USE_FOR_UNKNOWN,
          locale: USE_FOR_UNKNOWN,
          x64?: false,
          x32?: false,
          mobile?: true,
          compat?: false,
          to_s: 'ie ie6 trident windows-phone'
        }
      }
    }
    EDGE = {
      win: {
        'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36 Edge/12.246' => {
          name: 'edge',
          browser_version: '12.246',
          engine_name: 'edgehtml',
          engine_version: '12',
          system_name: ['windows', '10'],
          system_version: '10.0',
          system_architecture: 'x64',
          locale: USE_FOR_UNKNOWN,
          x64?: true,
          x32?: false,
          mobile?: false,
          to_s: 'edge edge12 edgehtml edgehtml12 windows x64'
        }
      }
    }
    MAXTHON = {
      win: {
        'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/532.4 (KHTML, like Gecko) Maxthon/3.0.6.27 Safari/532.4' => {
          name: 'Maxthon',
          browser_version: '3.0.6.27',
          engine_name: 'webkit',
          engine_version: '532.4',
          system_name: ['windows', '7'],
          system_version: '6.1',
          system_architecture: USE_FOR_UNKNOWN,
          locale: 'en-us',
          x64?: false,
          x32?: false,
          mobile?: false,
          to_s: 'maxthon maxthon3 webkit webkit532 windows'
        },
        'Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US) AppleWebKit/533.1 (KHTML, like Gecko) Maxthon/3.0.8.2 Safari/533.1' => {
          name: 'Maxthon',
          browser_version: '3.0.8.2',
          engine_name: 'webkit',
          engine_version: '533.1',
          system_name: ['windows', 'vista'],
          system_version: '6.0',
          system_architecture: USE_FOR_UNKNOWN,
          locale: 'en-us',
          x64?: false,
          x32?: false,
          mobile?: false,
          to_s: 'maxthon maxthon3 webkit webkit533 windows'
        },
        'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/4.0; WOW64; Trident/5.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; Zune 4.0; InfoPath.3; MS-RTC LM 8; .NET4.0C; .NET4.0E; Maxthon 2.0)' => {
          name: 'Maxthon',
          browser_version: '2.0',
          engine_name: 'Trident',
          engine_version: '4.0',
          system_name: ['windows', '7'],
          system_version: '6.1',
          system_architecture: 'x64',
          locale: USE_FOR_UNKNOWN,
          x64?: true,
          x32?: false,
          mobile?: false,
          to_s: 'maxthon maxthon2 trident trident4 windows x64'
        }
      }
    }
    SEAMONKEY = {
      win: {
        'Mozilla/5.0 (Windows NT 5.2; RW; rv:7.0a1) Gecko/20091211 SeaMonkey/9.23a1pre' => {
          name: 'SeaMonkey',
          browser_version: '9.23',
          engine_name: 'Gecko',
          engine_version: '7.0',
          system_name: ['windows', 'xp'],
          system_version: '5.2',
          system_architecture: USE_FOR_UNKNOWN,
          locale: 'rw',
          x64?: false,
          x32?: false,
          mobile?: false,
          to_s: 'seamonkey seamonkey9 gecko gecko7 windows'
        },
        'Mozilla/5.0 (Windows; U; Windows NT 6.2; WOW64; rv:1.8.0.7) Gecko/20110321 MultiZilla/4.33.2.6a SeaMonkey/8.6.55' => {
          name: 'SeaMonkey',
          browser_version: '8.6.55',
          engine_name: 'Gecko',
          engine_version: '1.8.0.7',
          system_name: ['windows', '8'],
          system_version: '6.2',
          system_architecture: 'x64',
          locale: USE_FOR_UNKNOWN,
          x64?: true,
          x32?: false,
          mobile?: false,
          to_s: 'seamonkey seamonkey8 gecko gecko1 windows x64'
        }
      },
      linux: {
        'Mozilla/5.0 (X11; U; Linux i686; ru; rv:33.2.3.12) Gecko/20120201 SeaMonkey/8.2.8' => {
          name: 'SeaMonkey',
          browser_version: '8.2.8',
          engine_name: 'Gecko',
          engine_version: '33.2.3.12',
          system_name: ['linux', USE_FOR_UNKNOWN],
          system_version: USE_FOR_UNKNOWN,
          system_architecture: 'x32',
          locale: 'ru',
          x64?: false,
          x32?: true,
          mobile?: false,
          to_s: 'seamonkey seamonkey8 gecko gecko33 linux x32'
        },
        'Mozilla/5.0 (X11; Linux x86_64; rv:12.0) Gecko/20120501 Firefox/12.0 SeaMonkey/2.9.1 Lightning/1.4' => {
          name: 'SeaMonkey',
          browser_version: '2.9.1',
          engine_name: 'Gecko',
          engine_version: '12.0',
          system_name: ['linux', USE_FOR_UNKNOWN],
          system_version: USE_FOR_UNKNOWN,
          system_architecture: 'x64',
          locale: USE_FOR_UNKNOWN,
          x64?: true,
          x32?: false,
          mobile?: false,
          to_s: 'seamonkey seamonkey2 gecko gecko12 linux x64'
        }
      }
    }
    SERVO = {
      android: {
        'Mozilla/5.0 (Android; Mobile; rv:37.0) Servo/1.0 Firefox/37.0' => {
          name: 'Servo',
          browser_version: '1.0',
          engine_name: USE_FOR_UNKNOWN,
          engine_version: '37.0',
          system_name: ['android', USE_FOR_UNKNOWN],
          system_version: USE_FOR_UNKNOWN,
          system_architecture: USE_FOR_UNKNOWN,
          locale: USE_FOR_UNKNOWN,
          x64?: false,
          x32?: false,
          mobile?: true,
          to_s: 'servo servo1 android'
        }
      }
    }
    FIREFOX = {
      mac: {
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:43.0) Gecko/20100101 Firefox/43.0' => {
          name: 'Firefox',
          browser_version: '43.0',
          engine_name: 'Gecko',
          engine_version: '43.0',
          system_name: ['macintosh', 'El Capitan'],
          system_version: '10.11',
          system_architecture: USE_FOR_UNKNOWN,
          locale: USE_FOR_UNKNOWN,
          x64?: false,
          x32?: false,
          mobile?: false,
          to_s: 'firefox firefox43 gecko gecko43 macintosh',
        },
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10; rv:33.0) Gecko/20100101 Firefox/33.0' => {
          name: 'Firefox',
          browser_version: '33.0',
          engine_name: 'Gecko',
          engine_version: '33.0',
          system_name: ['macintosh', 'yosemite'],
          system_version: '10.10',
          system_architecture: USE_FOR_UNKNOWN,
          locale: USE_FOR_UNKNOWN,
          x64?: false,
          x32?: false,
          mobile?: false,
          to_s: 'firefox firefox33 gecko gecko33 macintosh'
        },
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6; rv:25.0) Gecko/20100101 Firefox/25.0' => {
          name: 'Firefox',
          browser_version: '25.0',
          engine_name: 'Gecko',
          engine_version: '25.0',
          system_name: ['macintosh', 'snow leopard'],
          system_version: '10.6',
          system_architecture: USE_FOR_UNKNOWN,
          locale: USE_FOR_UNKNOWN,
          x64?: false,
          x32?: false,
          mobile?: false,
          to_s: 'firefox firefox25 gecko gecko25 macintosh'
        }
      },
      win: {
        'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:40.0) Gecko/20100101 Firefox/40.1' => {
          name: 'Firefox',
          browser_version: '40.1',
          engine_name: 'Gecko',
          engine_version: '40.0',
          system_name: ['windows', '7'],
          system_version: '6.1',
          system_architecture: 'x64',
          locale: USE_FOR_UNKNOWN,
          x64?: true,
          x32?: false,
          mobile?: false,
          to_s: 'firefox firefox40 gecko gecko40 windows x64'
        },
        'Mozilla/5.0 (Windows NT 6.3; rv:36.0) Gecko/20100101 Firefox/36.0' => {
          name: 'Firefox',
          browser_version: '36.0',
          engine_name: 'Gecko',
          engine_version: '36.0',
          system_name: ['windows', '8.1'],
          system_version: '6.3',
          system_architecture: USE_FOR_UNKNOWN,
          locale: USE_FOR_UNKNOWN,
          x64?: false,
          x32?: false,
          mobile?: false,
          to_s: 'firefox firefox36 gecko gecko36 windows'
        },
        'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:31.0) Gecko/20130401 Firefox/31.0' => {
          name: 'Firefox',
          browser_version: '31.0',
          engine_name: 'Gecko',
          engine_version: '31.0',
          system_name: ['windows', '7'],
          system_version: '6.1',
          system_architecture: 'x64',
          locale: USE_FOR_UNKNOWN,
          x64?: true,
          x32?: false,
          mobile?: false,
          to_s: 'firefox firefox31 gecko gecko31 windows x64'
        }
      },
      linux: {
        'Mozilla/5.0 (X11; Linux x86_64; rv:28.0) Gecko/20100101 Firefox/28.0' => {
          name: 'Firefox',
          browser_version: '28.0',
          engine_name: 'Gecko',
          engine_version: '28.0',
          system_name: ['linux', USE_FOR_UNKNOWN],
          system_version: USE_FOR_UNKNOWN,
          system_architecture: 'x64',
          locale: USE_FOR_UNKNOWN,
          x64?: true,
          x32?: false,
          mobile?: false,
          to_s: 'firefox firefox28 gecko gecko28 linux x64'
        },
        'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:24.0) Gecko/20100101 Firefox/24.0' => {
          name: 'Firefox',
          browser_version: '24.0',
          engine_name: 'Gecko',
          engine_version: '24.0',
          system_name: ['linux', USE_FOR_UNKNOWN],
          system_version: USE_FOR_UNKNOWN,
          system_architecture: 'x64',
          locale: USE_FOR_UNKNOWN,
          x64?: true,
          x32?: false,
          mobile?: false,
          to_s: 'firefox firefox24 gecko gecko24 linux x64'
        },
        'Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:21.0) Gecko/20130331 Firefox/21.0' => {
          name: 'Firefox',
          browser_version: '21.0',
          engine_name: 'Gecko',
          engine_version: '21.0',
          system_name: ['linux', USE_FOR_UNKNOWN],
          system_version: USE_FOR_UNKNOWN,
          system_architecture: 'x64',
          locale: USE_FOR_UNKNOWN,
          x64?: true,
          x32?: false,
          mobile?: false,
          to_s: 'firefox firefox21 gecko gecko21 linux x64'
        }
      },
      bsd: {
        'Mozilla/5.0 (X11; OpenBSD amd64; rv:28.0) Gecko/20100101 Firefox/28.0' => {
          name: 'Firefox',
          browser_version: '28.0',
          engine_name: 'Gecko',
          engine_version: '28.0',
          system_name: ['bsd', USE_FOR_UNKNOWN],
          system_version: USE_FOR_UNKNOWN,
          system_architecture: 'x64',
          locale: USE_FOR_UNKNOWN,
          x64?: true,
          x32?: false,
          mobile?: false,
          to_s: 'firefox firefox28 gecko gecko28 bsd x64'
        },
        'Mozilla/5.0 (X11; NetBSD amd64; rv:16.0) Gecko/20121102 Firefox/16.0' => {
          name: 'Firefox',
          browser_version: '16.0',
          engine_name: 'Gecko',
          engine_version: '16.0',
          system_name: ['bsd', USE_FOR_UNKNOWN],
          system_version: USE_FOR_UNKNOWN,
          system_architecture: 'x64',
          locale: USE_FOR_UNKNOWN,
          x64?: true,
          x32?: false,
          mobile?: false,
          to_s: 'firefox firefox16 gecko gecko16 bsd x64'
        },
        'Mozilla/5.0 (X11; FreeBSD amd64; rv:5.0) Gecko/20100101 Firefox/5.0' => {
          name: 'Firefox',
          browser_version: '5.0',
          engine_name: 'Gecko',
          engine_version: '5.0',
          system_name: ['bsd', USE_FOR_UNKNOWN],
          system_version: USE_FOR_UNKNOWN,
          system_architecture: 'x64',
          locale: USE_FOR_UNKNOWN,
          x64?: true,
          x32?: false,
          mobile?: false,
          to_s: 'firefox firefox5 gecko gecko5 bsd x64'
        },
        'Mozilla/5.0 (X11; U; FreeBSD i386; de-CH; rv:1.9.2.8) Gecko/20100729 Firefox/3.6.8' => {
          name: 'Firefox',
          browser_version: '3.6.8',
          engine_name: 'Gecko',
          engine_version: '1.9.2.8',
          system_name: ['bsd', USE_FOR_UNKNOWN],
          system_version: USE_FOR_UNKNOWN,
          system_architecture: 'x32',
          locale: 'de-ch',
          x64?: false,
          x32?: true,
          mobile?: false,
          to_s: 'firefox firefox3 gecko gecko1 bsd x32'
        }
      },
      solaris: {
        'Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.9.1.8) Gecko/20100215 Solaris/10.1 (GNU) Superswan/3.5.8 (Byte/me)' => {
          name: 'Firefox',
          browser_version: '3.5.8',
          engine_name: 'Gecko',
          engine_version: '1.9.1.8',
          system_name: ['solaris', '10.1'],
          system_version: '10.1',
          system_architecture: 'x64',
          locale: 'en-us',
          x64?: true,
          x32?: false,
          mobile?: false,
          to_s: 'firefox firefox3 gecko gecko1 solaris x64'
        },
        # Currently, it's not possible to test just by a useragent
        'SUNPlex 4.1 (Trusted Solaris 8 Operating Environment; Solaris 8 OE; Sun Fire 15K)' => {
          name: USE_FOR_UNKNOWN,
          browser_version: USE_FOR_UNKNOWN,
          engine_name: USE_FOR_UNKNOWN,
          engine_version: USE_FOR_UNKNOWN,
          system_name: ['solaris', '8'],
          system_version: '8',
          system_architecture: USE_FOR_UNKNOWN,
          locale: 'oe',
          x64?: false,
          x32?: false,
          mobile?: false,
          to_s: 'solaris'
        }
      }
    }
    BRAVE = {
      mac: {
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_2) AppleWebKit/537.36 (KHTML, like Gecko) brave/0.7.7 Chrome/47.0.2526.73 Electron/0.36.2 Safari/537.36' => {
          name: 'Brave',
          browser_version: '0.7.7',
          engine_name: 'webkit',
          engine_version: '537.36',
          system_name: ['macintosh', 'el capitan'],
          system_version: '10.11.2',
          system_architecture: USE_FOR_UNKNOWN,
          locale: USE_FOR_UNKNOWN,
          x64?: false,
          x32?: false,
          mobile?: false,
          to_s: 'brave brave0 webkit webkit537 macintosh'
        }
      }
    }
    CHROME = {
      mac: {
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36' => {
          name: 'Chrome',
          browser_version: '47.0.2526.106',
          engine_name: 'webkit',
          engine_version: '537.36',
          system_name: ['macintosh', 'El Capitan'],
          system_version: '10.11.2',
          system_architecture: USE_FOR_UNKNOWN,
          locale: USE_FOR_UNKNOWN,
          x64?: false,
          x32?: false,
          mobile?: false,
          to_s: 'chrome chrome47 webkit webkit537 macintosh'
        },
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2062.124 Safari/537.36' => {
          name: 'Chrome',
          browser_version: '37.0.2062.124',
          engine_name: 'webkit',
          engine_version: '537.36',
          system_name: ['macintosh', 'yosemite'],
          system_version: '10.10.1',
          system_architecture: USE_FOR_UNKNOWN,
          locale: USE_FOR_UNKNOWN,
          x64?: false,
          x32?: false,
          mobile?: false,
          to_s: 'chrome chrome37 webkit webkit537 macintosh'
        },
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1944.0 Safari/537.36' => {
          name: 'Chrome',
          browser_version: '36.0.1944.0',
          engine_name: 'webkit',
          engine_version: '537.36',
          system_name: ['macintosh', 'mavericks'],
          system_version: '10.9.2',
          system_architecture: USE_FOR_UNKNOWN,
          locale: USE_FOR_UNKNOWN,
          x64?: false,
          x32?: false,
          mobile?: false,
          to_s: 'chrome chrome36 webkit webkit537 macintosh'
        },
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_8_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.93 Safari/537.36' => {
          name: 'Chrome',
          browser_version: '27.0.1453.93',
          engine_name: 'webkit',
          engine_version: '537.36',
          system_name: ['macintosh', 'Mountain Lion'],
          system_version: '10.8.3',
          system_architecture: USE_FOR_UNKNOWN,
          locale: USE_FOR_UNKNOWN,
          x64?: false,
          x32?: false,
          mobile?: false,
          to_s: 'chrome chrome27 webkit webkit537 macintosh'
        }
      },
      win: {
        'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2228.0 Safari/537.36' => {
          name: 'Chrome',
          browser_version: '41.0.2228.0',
          engine_name: 'webkit',
          engine_version: '537.36',
          system_name: ['windows', '7'],
          system_version: '6.1',
          system_architecture: USE_FOR_UNKNOWN,
          locale: USE_FOR_UNKNOWN,
          x64?: false,
          x32?: false,
          mobile?: false,
          to_s: 'chrome chrome41 webkit webkit537 windows'
        },
        'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/31.0.1623.0 Safari/537.36' => {
          name: 'Chrome',
          browser_version: '31.0.1623.0',
          engine_name: 'webkit',
          engine_version: '537.36',
          system_name: ['windows', '7'],
          system_version: '6.1',
          system_architecture: 'x64',
          locale: USE_FOR_UNKNOWN,
          x64?: true,
          x32?: false,
          mobile?: false,
          to_s: 'chrome chrome31 webkit webkit537 windows x64'
        },
        'Mozilla/5.0 (Windows NT 6.2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1464.0 Safari/537.36' => {
          name: 'Chrome',
          browser_version: '28.0.1464.0',
          engine_name: 'webkit',
          engine_version: '537.36',
          system_name: ['windows', '8'],
          system_version: '6.2',
          system_architecture: USE_FOR_UNKNOWN,
          locale: USE_FOR_UNKNOWN,
          x64?: false,
          x32?: false,
          mobile?: false,
          to_s: 'chrome chrome28 webkit webkit537 windows'
        }
      },
      linux: {
        'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.517 Safari/537.36' => {
          name: 'Chrome',
          browser_version: '33.0.1750.517',
          engine_name: 'webkit',
          engine_version: '537.36',
          system_name: ['linux', USE_FOR_UNKNOWN],
          system_version: USE_FOR_UNKNOWN,
          system_architecture: 'x64',
          locale: USE_FOR_UNKNOWN,
          x64?: true,
          x32?: false,
          mobile?: false,
          to_s: 'chrome chrome33 webkit webkit537 linux x64'
        },
        'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/34.0.1847.137 Safari/4E423F' => {
          name: 'Chrome',
          browser_version: '34.0.1847.137',
          engine_name: 'webkit',
          engine_version: '537.36',
          system_name: ['linux', USE_FOR_UNKNOWN],
          system_version: USE_FOR_UNKNOWN,
          system_architecture: 'x64',
          locale: USE_FOR_UNKNOWN,
          x64?: true,
          x32?: false,
          mobile?: false,
          to_s: 'chrome chrome34 webkit webkit537 linux x64'
        },
        'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2227.0 Safari/537.36' => {
          name: 'Chrome',
          browser_version: '41.0.2227.0',
          engine_name: 'webkit',
          engine_version: '537.36',
          system_name: ['linux', USE_FOR_UNKNOWN],
          system_version: USE_FOR_UNKNOWN,
          system_architecture: 'x64',
          locale: USE_FOR_UNKNOWN,
          x64?: true,
          x32?: false,
          mobile?: false,
          to_s: 'chrome chrome41 webkit webkit537 linux x64'
        },
        'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/536.5 (KHTML, like Gecko) Chrome/19.0.1084.9 Safari/536.5' => {
          name: 'Chrome',
          browser_version: '19.0.1084.9',
          engine_name: 'webkit',
          engine_version: '536.5',
          system_name: ['linux', USE_FOR_UNKNOWN],
          system_version: USE_FOR_UNKNOWN,
          system_architecture: 'x64',
          locale: USE_FOR_UNKNOWN,
          x64?: true,
          x32?: false,
          mobile?: false,
          to_s: 'chrome chrome19 webkit webkit536 linux x64'
        }
      },
      bsd: {
        'Mozilla/5.0 (X11; OpenBSD i386) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/36.0.1985.125 Safari/537.36' => {
          name: 'Chrome',
          browser_version: '36.0.1985.125',
          engine_name: 'webkit',
          engine_version: '537.36',
          system_name: ['bsd', USE_FOR_UNKNOWN],
          system_version: USE_FOR_UNKNOWN,
          system_architecture: 'x32',
          locale: USE_FOR_UNKNOWN,
          x64?: false,
          x32?: true,
          mobile?: false,
          to_s: 'chrome chrome36 webkit webkit537 bsd x32'
        },
        'Mozilla/5.0 (X11; NetBSD) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/27.0.1453.116 Safari/537.36' => {
          name: 'Chrome',
          browser_version: '27.0.1453.116',
          engine_name: 'webkit',
          engine_version: '537.36',
          system_name: ['bsd', USE_FOR_UNKNOWN],
          system_version: USE_FOR_UNKNOWN,
          system_architecture: USE_FOR_UNKNOWN,
          locale: USE_FOR_UNKNOWN,
          x64?: false,
          x32?: false,
          mobile?: false,
          to_s: 'chrome chrome27 webkit webkit537 bsd'
        }
      },
      android: {
        'Mozilla/5.0 (Linux; Android 7.0; LG-H910 Build/NRD90C) AppleWebKit/537.26 (KHTML, like Gecko) Chrome/51.0.2704.90 Mobile Safari/537.36' => {
          name: 'Chrome',
          browser_version: '51.0.2704.90',
          engine_name: 'webkit',
          engine_version: '537.26',
          system_name: ['Android', 'Nougat 24'],
          system_version: '7.0',
          system_architecture: USE_FOR_UNKNOWN,
          x64?: false,
          x32?: false,
          mobile?: true,
          to_s: 'chrome chrome51 webkit webkit537 android'
        }
      }
    }
    SAFARI = {
      tizen: {
        'Mozilla/5.0 (Linux; Tizen 2.2; SAMSUNG SM-Z9005) AppleWebKit/537.3 (KHTML, like Gecko) Version/2.2 like Android 4.1; Mobile Safari/537.3' => {
          name: 'Safari',
          browser_version: '2.2',
          engine_name: 'webkit',
          engine_version: '537.3',
          system_name: ['tizen', '2.2'],
          system_version: '2.2',
          system_architecture: USE_FOR_UNKNOWN,
          locale: USE_FOR_UNKNOWN,
          x64?: false,
          x32?: false,
          mobile?: true,
          to_s: 'safari safari2 webkit webkit537 tizen'
        }
      },
      mac: {
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_2) AppleWebKit/601.3.9 (KHTML, like Gecko) Version/9.0.2 Safari/601.3.9' => {
          name: 'Safari',
          browser_version: '9.0.2',
          engine_name: 'webkit',
          engine_version: '601.3.9',
          system_name: ['macintosh', 'El Capitan'],
          system_version: '10.11.2',
          system_architecture: USE_FOR_UNKNOWN,
          locale: USE_FOR_UNKNOWN,
          x64?: false,
          x32?: false,
          mobile?: false,
          to_s: 'safari safari9 webkit webkit601 macintosh'
        },
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_3) AppleWebKit/537.75.14 (KHTML, like Gecko) Version/7.0.3 Safari/7046A194A' => {
          name: 'Safari',
          browser_version: '7.0.3',
          engine_name: 'webkit',
          engine_version: '537.75.14',
          system_name: ['macintosh', 'mavericks'],
          system_version: '10.9.3',
          system_architecture: USE_FOR_UNKNOWN,
          locale: USE_FOR_UNKNOWN,
          x64?: false,
          x32?: false,
          mobile?: false,
          to_s: 'safari safari7 webkit webkit537 macintosh'
        },
        'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_6_8) AppleWebKit/537.13+ (KHTML, like Gecko) Version/5.1.7 Safari/534.57.2' => {
          name: 'Safari',
          browser_version: '5.1.7',
          engine_name: 'webkit',
          engine_version: '537.13',
          system_name: ['macintosh', 'snow leopard'],
          system_version: '10.6.8',
          system_architecture: USE_FOR_UNKNOWN,
          locale: USE_FOR_UNKNOWN,
          x64?: false,
          x32?: false,
          mobile?: false,
          to_s: 'safari safari5 webkit webkit537 macintosh'
        }
      },
      win: {
        'Mozilla/5.0 (Windows; U; Windows NT 6.1; tr-TR) AppleWebKit/533.20.25 (KHTML, like Gecko) Version/5.0.4 Safari/533.20.27' => {
          name: 'Safari',
          browser_version: '5.0.4',
          engine_name: 'webkit',
          engine_version: '533.20.25',
          system_name: ['windows', '7'],
          system_version: '6.1',
          system_architecture: USE_FOR_UNKNOWN,
          locale: 'tr-tr',
          x64?: false,
          x32?: false,
          mobile?: false,
          to_s: 'safari safari5 webkit webkit533 windows'
        },
        'Mozilla/5.0 (Windows; U; Windows NT 6.1; de-DE) AppleWebKit/533.20.25 (KHTML, like Gecko) Version/5.0.3 Safari/533.19.4' => {
          name: 'Safari',
          browser_version: '5.0.3',
          engine_name: 'webkit',
          engine_version: '533.20.25',
          system_name: ['windows', '7'],
          system_version: '6.1',
          system_architecture: USE_FOR_UNKNOWN,
          locale: 'de-de',
          x64?: false,
          x32?: false,
          mobile?: false,
          to_s: 'safari safari5 webkit webkit533 windows'
        },
        'Mozilla/5.0 (Windows; U; Windows NT 6.1; en-US) AppleWebKit/533.18.1 (KHTML, like Gecko) Version/5.0 Safari/533.16' => {
          name: 'Safari',
          browser_version: '5.0',
          engine_name: 'webkit',
          engine_version: '533.18.1',
          system_name: ['windows', '7'],
          system_version: '6.1',
          system_architecture: USE_FOR_UNKNOWN,
          locale: 'en-us',
          x64?: false,
          x32?: false,
          mobile?: false,
          to_s: 'safari safari5 webkit webkit533 windows'
        }
      },
      blackberry: {
        'Mozilla/5.0 (BlackBerry; U; BlackBerry 9800; en-US) AppleWebKit/534.8+ (KHTML, like Gecko) Version/6.0.0.450 Mobile Safari/534.8+' => {
          name: 'Safari',
          browser_version: '6.0.0.450',
          engine_name: 'webkit',
          engine_version: '534.8',
          system_name: ['blackberry', '6.0'],
          system_version: '6.0.0.450',
          system_architecture: USE_FOR_UNKNOWN,
          locale: 'en-us',
          x64?: false,
          x32?: false,
          mobile?: true,
          to_s: 'safari safari6 webkit webkit534 blackberry'
        },
        'Mozilla/5.0 (BlackBerry; U; BlackBerry 9900; en) AppleWebKit/534.11+ (KHTML, like Gecko) Version/7.1.0.346 Mobile Safari/534.11+' => {
          name: 'Safari',
          browser_version: '7.1.0.346',
          engine_name: 'webkit',
          engine_version: '534.11',
          system_name: ['blackberry', '7.1'],
          system_version: '7.1.0.346',
          system_architecture: USE_FOR_UNKNOWN,
          locale: 'en',
          x64?: false,
          x32?: false,
          mobile?: true,
          to_s: 'safari safari7 webkit webkit534 blackberry'
        },
        'Mozilla/5.0 (BlackBerry; U; BlackBerry 9860; en-US) AppleWebKit/534.11+ (KHTML, like Gecko) Version/7.0.0.254 Mobile Safari/534.11+' => {
          name: 'Safari',
          browser_version: '7.0.0.254',
          engine_name: 'webkit',
          engine_version: '534.11',
          system_name: ['blackberry', '7.0'],
          system_version: '7.0.0.254',
          system_architecture: USE_FOR_UNKNOWN,
          locale: 'en-us',
          x64?: false,
          x32?: false,
          mobile?: true,
          to_s: 'safari safari7 webkit webkit534 blackberry'
        },
        'Mozilla/5.0 (BlackBerry; U; BlackBerry 9800; it) AppleWebKit/534.8+ (KHTML, like Gecko) Version/6.0.0.668 Mobile Safari/534.8+' => {
          name: 'Safari',
          browser_version: '6.0.0.668',
          engine_name: 'webkit',
          engine_version: '534.8',
          system_name: ['blackberry', '6.0'],
          system_version: '6.0.0.668',
          system_architecture: USE_FOR_UNKNOWN,
          locale: 'it',
          x64?: false,
          x32?: false,
          mobile?: true,
          to_s: 'safari safari6 webkit webkit534 blackberry'
        },
        'Mozilla/5.0 (BlackBerry; U; BlackBerry 9700; pt) AppleWebKit/534.8+ (KHTML, like Gecko) Version/6.0.0.546 Mobile Safari/534.8+' => {
          name: 'Safari',
          browser_version: '6.0.0.546',
          engine_name: 'webkit',
          engine_version: '534.8',
          system_name: ['blackberry', '6.0'],
          system_version: '6.0.0.546',
          system_architecture: USE_FOR_UNKNOWN,
          locale: 'pt',
          x64?: false,
          x32?: false,
          mobile?: true,
          to_s: 'safari safari6 webkit webkit534 blackberry'
        }
      },
      ios: {
        'Mozilla/5.0 (iPhone; U; CPU iPhone OS 8_0 like Mac OS X; en-us) AppleWebKit/532.9 (KHTML, like Gecko) Version/4.0.5 Mobile/8A293 Safari/6531.22.7' => {
          name: 'safari',
          browser_version: '4.0.5',
          engine_name: 'webkit',
          engine_version: '532.9',
          system_name: ['ios', '8.0'],
          system_version: '8.0',
          system_architecture: USE_FOR_UNKNOWN,
          locale: 'en-us',
          x64?: false,
          x32?: false,
          mobile?: true,
          to_s: 'safari safari4 webkit webkit532 ios'
        },
        'Mozilla/5.0 (iPhone; CPU iPhone OS 6_0 like Mac OS X) AppleWebKit/536.26 (KHTML, like Gecko) Version/6.0 Mobile/10A5376e Safari/8536.25' => {
          name: 'safari',
          browser_version: '6.0',
          engine_name: 'webkit',
          engine_version: '536.26',
          system_name: ['ios', '6.0'],
          system_version: '6.0',
          system_architecture: USE_FOR_UNKNOWN,
          locale: USE_FOR_UNKNOWN,
          x64?: false,
          x32?: false,
          mobile?: true,
          to_s: 'safari safari6 webkit webkit536 ios'
        },
        'Mozilla/5.0 (iPhone; CPU iPhone OS 5_0 like Mac OS X) AppleWebKit/534.46 (KHTML, like Gecko) Version/5.1 Mobile/9A334 Safari/7534.48.3' => {
          name: 'safari',
          browser_version: '5.1',
          engine_name: 'webkit',
          engine_version: '534.46',
          system_name: ['ios', '5.0'],
          system_version: '5.0',
          system_architecture: USE_FOR_UNKNOWN,
          locale: USE_FOR_UNKNOWN,
          x64?: false,
          x32?: false,
          mobile?: true,
          to_s: 'safari safari5 webkit webkit534 ios'
        }
      }
    }
  end
end

module UserAgents
  module Consoles
    XBOX = {
      'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; Trident/5.0; Xbox)' => {
        console_name: 'xbox',
        console?: true,
      }
    }

    PLAYSTATION = {
      'Mozilla/5.0 (PLAYSTATION 3; 3.55)' => {
        console_name: 'playstation',
        console?: true
      },
      'Mozilla/4.0 (PS3 (PlayStation 3); 1.00)' => {
        console_name: 'playstation',
        console?: true
      }
    }

    NINTENDO_DS = {
      'Bunjalloo/0.7.6(Nintendo DS;U;en)' => {
        console_name: 'nintendo_ds',
        console?: true
      }
    }

    WII = {
      'Opera/9.30 (Nintendo Wii; U; ; 2047-7; de)' => {
        console_name: 'wii',
        console?: true
      }
    }
  end
end

module UserAgents
  module Library
    PHP = {
      'PHP/5.9.2' => {
        name: 'php',
        library_version: '5.9.2',
        library?: true,
        to_s: 'php php5'
      }
    }
    PYTHON = {
      'Python-urllib/3.0' => {
        name: 'python',
        library_version: '3.0',
        library?: true,
        to_s: 'python python3'
      }
    }
    PERL = {
      'libwww-perl/5.814' => {
        name: 'perl',
        library_version: '5.814',
        library?: true,
        to_s: 'perl perl5'
      }
    }
    JAVA = {
      'java/1.6.0_26' => {
        name: 'java',
        library_version: '1.6.0.26',
        library?: true,
        to_s: 'java java1'
      }
    }
    CURL = {
      'curl/7.7.x' => {
        name: 'curl',
        library_version: '7.7.x',
        library?: true,
        to_s: 'curl curl7'
      }
    }
    PYCURL = {
      'PyCURL/7.19.5' => {
        name: 'pycurl',
        library_version: '7.19.5',
        library?: true,
        to_s: 'pycurl pycurl7'
      }
    }
  end
end
